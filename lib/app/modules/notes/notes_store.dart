import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'notes_store.g.dart';

class NotesStore = _NotesStoreBase with _$NotesStore;

abstract class _NotesStoreBase with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  ObservableList<Map<String, dynamic>> notesList =
      ObservableList<Map<String, dynamic>>();

  @action
  Future<void> fetchNotes(String questionId) async {
    String userId = _auth.currentUser?.uid ?? '';
    if (userId.isEmpty) return;
    print(questionId);
    try {
      QuerySnapshot querySnapshot = questionId != ''
          ? await _firestore
              .collection('notes')
              .where('userId', isEqualTo: userId)
              .where('questionId', isEqualTo: questionId)
              .orderBy('dateCreated', descending: true)
              .get()
          : await _firestore
              .collection('notes')
              .where('userId', isEqualTo: userId)
              .orderBy('dateCreated', descending: true)
              .get();

      notesList.clear();
      for (var doc in querySnapshot.docs) {
        notesList.add(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Erro ao buscar notas: $e");
    }
  }

  Future<void> updateNote(String noteId, String newText) async {
    try {
      await FirebaseFirestore.instance.collection('notes').doc(noteId).update({
        'text': newText,
      });
    } catch (e) {
      print('Erro ao atualizar a nota: $e');
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await FirebaseFirestore.instance.collection('notes').doc(noteId).delete();
    } catch (e) {
      print('Erro ao excluir a nota: $e');
    }
  }
}
