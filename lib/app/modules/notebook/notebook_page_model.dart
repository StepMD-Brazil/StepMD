class NotebookPageModel {
  final String id;
  final String title;
  final String content;

  NotebookPageModel({
    required this.id,
    required this.title,
    required this.content,
  });

  // Converte um documento do Firestore para um modelo NotebookPageModel
  factory NotebookPageModel.fromMap(Map<String, dynamic> map) {
    return NotebookPageModel(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  // Converte o modelo para um formato que o Firestore pode armazenar
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  // Cria uma cópia do objeto com dados atualizados
  NotebookPageModel copyWith({String? title, String? content}) {
    return NotebookPageModel(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
