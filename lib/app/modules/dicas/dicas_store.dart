import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'dicas_store.g.dart';

class DicasStore = _DicasStoreBase with _$DicasStore;

abstract class _DicasStoreBase with Store {
  @observable
  int value = 0;

  @observable
  String questionId = "#00159";

  @observable
  List<String> disciplines = [];

  @observable
  ObservableStream<List<Map<dynamic, dynamic>>>? tipsStream;

  @action
  void setQuestionId(String questionId) {
    this.questionId = questionId;
  }

  @action
  void fetchTips() {
    try {
      final collection = FirebaseFirestore.instance.collection("tips");
      final stream = collection
            .where("questionId", isEqualTo: questionId)
            .snapshots()
            .map((querySnapshot) =>
                querySnapshot.docs.map((doc) => doc.data()).toList());
        
        tipsStream = ObservableStream(stream);
    } catch (e) {
      print("Erro ao criar stream de questões: $e");
    }
  }
}
