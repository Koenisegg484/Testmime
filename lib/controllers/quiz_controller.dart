import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/questions_model.dart';
import '../models/quiz_model.dart';
class QuizController extends GetxController {
  // State variables
  RxList<Quiz> quizzes = <Quiz>[].obs;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxInt currentQuestionIndex = 0.obs;
  RxMap<int, int> selectedOptionIds = <int, int>{}.obs;

  // Data placeholders
  List<Question> _questions = [];
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
    hasError.value = false;
    currentQuestionIndex.value = 0;
    selectedOptionIds.value = {};
    fetchQuizzes();
  }

  // Fetch quizzes
  Future<void> fetchQuizzes() async {
    isLoading(true);
    hasError(false);
    try {
      final response = await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        quizzes.value = [Quiz.fromJson(data)];

        // Fetch questions only after quizzes are fetched successfully
        fetchQuestions();
      } else {
        hasError(true);
      }
    } catch (e) {
      hasError(true);
    } finally {
      isLoading(false);
    }
  }

  // Fetch questions
  void fetchQuestions() {
    if (quizzes.isNotEmpty) {
      _questions = quizzes[0].getQuestions().cast<Question>();
    } else {
      _questions = []; // Default empty list
    }
  }

  // Get questions
  List<Question> getQuestions() {
    return _questions;
  }

  int getDuration() {
    return quizzes.isNotEmpty ? quizzes[0].duration : 0;
  }
}
