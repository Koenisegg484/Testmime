class Option {
  final int id;
  final String description;
  final int questionId;
  final bool isCorrect;

  Option({
    required this.id,
    required this.description,
    required this.questionId,
    required this.isCorrect,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      description: json['description'],
      questionId: json['question_id'],
      isCorrect: json['is_correct'],
    );
  }

  @override
  String toString() {
    return "id: $id, description: $description, questionId: $questionId, isCorrect: $isCorrect";
  }
}
