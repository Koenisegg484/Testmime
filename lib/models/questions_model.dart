import 'options_model.dart';

class Question {
  final int id;
  final String description;
  final String? difficultyLevel;
  final String topic;
  final bool isPublished;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String detailedSolution;
  final String type;
  final bool isMandatory;
  final bool showInFeed;
  final String pyqLabel;
  final int topicId;
  final int readingMaterialId;
  final DateTime fixedAt;
  final String fixSummary;
  final String? createdBy;
  final String? updatedBy;
  final String? quizLevel;
  final String? questionFrom;
  final String? language;
  final String? photoUrl;
  final String? photoSolutionUrl;
  final bool isSaved;
  final String tag;
  final List<Option> options;

  Question({
    required this.id,
    required this.description,
    this.difficultyLevel,
    required this.topic,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.detailedSolution,
    required this.type,
    required this.isMandatory,
    required this.showInFeed,
    required this.pyqLabel,
    required this.topicId,
    required this.readingMaterialId,
    required this.fixedAt,
    required this.fixSummary,
    this.createdBy,
    this.updatedBy,
    this.quizLevel,
    this.questionFrom,
    this.language,
    this.photoUrl,
    this.photoSolutionUrl,
    required this.isSaved,
    required this.tag,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      description: json['description'],
      difficultyLevel: json['difficulty_level'],
      topic: json['topic'],
      isPublished: json['is_published'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      detailedSolution: json['detailed_solution'],
      type: json['type'] ?? "Undefined",
      isMandatory: json['is_mandatory'],
      showInFeed: json['show_in_feed'],
      pyqLabel: json['pyq_label'] ?? "NA",
      topicId: json['topic_id'],
      readingMaterialId: json['reading_material_id'],
      fixedAt: json['fixed_at'] != null
          ? DateTime.parse(json['fixed_at'])
          : DateTime.now(),
      fixSummary: json['fix_summary'] ?? "NA",
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      quizLevel: json['quiz_level'],
      questionFrom: json['question_from'],
      language: json['language'],
      photoUrl: json['photo_url'],
      photoSolutionUrl: json['photo_solution_url'],
      isSaved: json['is_saved'],
      tag: json['tag'],
      options:
          (json['options'] as List).map((opt) => Option.fromJson(opt)).toList(),
    );
  }
}
