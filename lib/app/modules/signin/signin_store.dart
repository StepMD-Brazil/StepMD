import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:stepmd/app/root/root_store.dart';

part 'signin_store.g.dart';

class SigninStore = _SigninStoreBase with _$SigninStore;

abstract class _SigninStoreBase with Store {
  final RootStore rootStore = Modular.get();

  @observable
  int value = 0;
  @observable
  String phone = '';
  @observable
  String code = '';
  @action
  void increment() {
    value++;
  }

  @action
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    print('Phone number: $phoneNumber');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Phone number verification failed: ${e}');
      },
      codeSent: (String verificationId, int? resendToken) {
        this.phone = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.phone = verificationId;
      },
    );
  }

  @action
  Future<void> createUserWithPhone(String phoneNumber, String smsCode) async {
    try {
      // Verify the phone number with the provided SMS code
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: phoneNumber,
        smsCode: smsCode,
      );

      // Sign in the user with the credential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Get the signed-in user
      User? user = userCredential.user;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get();

      if (!userDoc.exists) {
        // Create a new document for the user in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .set({
          'userId': user?.uid,
          'phone': phoneNumber,
          'createdAt': FieldValue.serverTimestamp(),
          'dataBirth': '',
          'imageUrl': '',
          'name': '',
          'surname': ''
        });
        rootStore.setSelectedTrunk(1);
      } else {
        rootStore.setSelectedTrunk(1);
      }
    } catch (e) {
      print('Failed to create user: $e');
    }
  }
}
