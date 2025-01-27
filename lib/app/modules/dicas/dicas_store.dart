import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'dicas_store.g.dart';

class DicasStore = _DicasStoreBase with _$DicasStore;

abstract class _DicasStoreBase with Store {

  @observable
  String questionId = "";

  @observable
  List<String> disciplines = [];

  @observable
  ObservableStream<List<Map<String, dynamic>>>? tipsStream;

  @action
  void fetchTips() {
    try {
      final collection = FirebaseFirestore.instance.collection("tips");
      final stream = collection
          .where("questionId", isEqualTo: questionId)
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs.map((doc) {
                // Assegurando que os dados retornados têm o tipo correto
                return Map<String, dynamic>.from(doc.data());
              }).toList());

      tipsStream = ObservableStream(stream);
    } catch (e) {
      print("Erro ao buscar dicas: $e");
    }
  }

  @action
  void setQuestionId(String newQuestion) {
    questionId = newQuestion;
    fetchTips();
  }
}
