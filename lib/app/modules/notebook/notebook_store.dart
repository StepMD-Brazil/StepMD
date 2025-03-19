import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'notebook_page_model.dart'; // Importação da model

part 'notebook_store.g.dart';

class NotebookStore = _NotebookStoreBase with _$NotebookStore;

abstract class _NotebookStoreBase with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  ObservableList<NotebookPageModel> pages = ObservableList<NotebookPageModel>();

  @observable
  NotebookPageModel? selectedPage;

  @observable
  bool isLoading = false;

  @action
  void loadPages() {
    final user = _auth.currentUser;
    if (user == null) return;

    isLoading = true;

    _firestore.collection('notebooks').doc(user.uid).snapshots().listen((doc) async {
      if (doc.exists) {
        final data = doc.data();
        pages = ObservableList.of(
          (data?['pages'] as List<dynamic>?)
                  ?.map((p) => NotebookPageModel.fromMap(p))
                  .toList() ??
              [],
        );
      } else {
        pages.clear();
      }
      
      // Se não houver páginas, criar "Página 1" automaticamente
      if (pages.isEmpty) {
        await addPage("Página 1", "");
      }
      isLoading = false;
    }, onError: (e) {
      print("Erro ao carregar páginas: $e");
      isLoading = false;
    });
  }

  @action
  void setSelectedPage(NotebookPageModel page) {
    selectedPage = page;
  }

  @action
  Future<void> addPage(String title, String content) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final newPage = NotebookPageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );

    pages.add(newPage);

    final docRef = _firestore.collection('notebooks').doc(user.uid);
    await docRef.set({
      'pages': FieldValue.arrayUnion([newPage.toMap()])
    }, SetOptions(merge: true));
  }

  @action
  Future<void> updatePage(String id, String newContent) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final index = pages.indexWhere((page) => page.id == id);
    if (index != -1) {
      pages[index] = pages[index].copyWith(content: newContent);

      final docRef = _firestore.collection('notebooks').doc(user.uid);
      final updatedPages = pages.map((p) => p.toMap()).toList();
      await docRef.update({'pages': updatedPages});
    }
  }
}
