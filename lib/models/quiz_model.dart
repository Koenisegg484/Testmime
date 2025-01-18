import 'package:testmime/models/questions_model.dart';

class Quiz {
  final int id;
  final String? name;
  final String title;
  final String description;
  final String? difficultyLevel;
  final String topic;
  final DateTime time;
  final bool isPublished;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int duration;
  final DateTime endTime;
  final double negativeMarks;
  final double correctAnswerMarks;
  final bool shuffle;
  final bool showAnswers;
  final bool lockSolutions;
  final bool isForm;
  final bool showMasteryOption;
  final String? readingMaterial;
  final String? quizType;
  final bool isCustom;
  final int? bannerId;
  final int? examId;
  final bool showUnanswered;
  final String endsAt;
  final String? lives;
  final String liveCount;
  final int coinCount;
  final int questionsCount;
  final String dailyDate;
  final int maxMistakeCount;
  final List<dynamic> readingMaterials;
  final List<Question> questions;

  Quiz({
    required this.id,
    this.name,
    required this.title,
    required this.description,
    this.difficultyLevel,
    required this.topic,
    required this.time,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.duration,
    required this.endTime,
    required this.negativeMarks,
    required this.correctAnswerMarks,
    required this.shuffle,
    required this.showAnswers,
    required this.lockSolutions,
    required this.isForm,
    required this.showMasteryOption,
    this.readingMaterial,
    this.quizType,
    required this.isCustom,
    this.bannerId,
    this.examId,
    required this.showUnanswered,
    required this.endsAt,
    this.lives,
    required this.liveCount,
    required this.coinCount,
    required this.questionsCount,
    required this.dailyDate,
    required this.maxMistakeCount,
    required this.readingMaterials,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      description: json['description'],
      difficultyLevel: json['difficulty_level'],
      topic: json['topic'],
      time: DateTime.parse(json['time']),
      isPublished: json['is_published'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      duration: json['duration'],
      endTime: DateTime.parse(json['end_time']),
      negativeMarks: double.parse(json['negative_marks']),
      correctAnswerMarks: double.parse(json['correct_answer_marks']),
      shuffle: json['shuffle'],
      showAnswers: json['show_answers'],
      lockSolutions: json['lock_solutions'],
      isForm: json['is_form'],
      showMasteryOption: json['show_mastery_option'],
      readingMaterial: json['reading_material'],
      quizType: json['quiz_type'],
      isCustom: json['is_custom'],
      bannerId: json['banner_id'],
      examId: json['exam_id'],
      showUnanswered: json['show_unanswered'],
      endsAt: json['ends_at'],
      lives: json['lives'],
      liveCount: json['live_count'],
      coinCount: json['coin_count'],
      questionsCount: json['questions_count'],
      dailyDate: json['daily_date'],
      maxMistakeCount: json['max_mistake_count'],
      readingMaterials: json['reading_materials'],
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList(),
    );
  }

  List<Question> getQuestions() {
    print(questionsCount);
    return questions;
  }
}

