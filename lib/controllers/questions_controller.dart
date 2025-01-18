import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/controllers/quiz_controller.dart';
import '../models/questions_model.dart';

class QuestionsController extends GetxController {
  final List<Question> questions = Get.put(QuizController()).getQuestions();

  RxInt currentQuestionIndex = 0.obs;
  RxList<int?> selectedOptions = RxList<int?>();

  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    selectedOptions.value = List.filled(questions.length, null);
  }

  void selectOption(int questionIndex, int optionIndex) {
    selectedOptions[questionIndex] = optionIndex;
    update();
  }
}
