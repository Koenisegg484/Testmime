import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/controllers/quiz_controller.dart';
import 'package:testmime/models/questions_model.dart';
import 'package:testmime/screens/score_screen.dart';

import '../models/options_model.dart';

class QuizQuestionsController extends GetxController {
  // This stores the selected options of each question id
  RxMap<int, int> answeredQuestions = <int, int>{}.obs;

  // The total score is tored here
  RxInt score = 0.obs;

  // The list of questions
  late List<Question> questions;

  //   The page Controller
  late PageController pageController;

  // Index of current question
  RxInt currentQuestionIndex = 1.obs;

  // Correct answers
  int correctAnswers = 0;

  Timer? _timer;
  var timeRemaining = 0.obs;

  @override
  void onInit() {
    answeredQuestions = <int, int>{}.obs;
    score.value = 0;
    questions = Get.put(QuizController()).getQuestions();
    pageController = PageController(viewportFraction: 0.98);
    currentQuestionIndex = 1.obs;
    startTimer(Get.put(QuizController()).getDuration());
    super.onInit();
  }

  void startTimer(int minutes) {
    timeRemaining.value = minutes * 60;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeRemaining.value > 0) {
        timeRemaining.value--;
      } else {
        timer.cancel();
        showDialogOnTimerEnd();
      }
    });
  }
  void showDialogOnTimerEnd() {
    Get.dialog(
      AlertDialog(
        title: Text('Time is up!'),
        content: Text('Would you like to see your score?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _timer?.cancel();

              Future.delayed(Duration.zero, () {
                Get.off(ScoreScreen());
              });
            },
            child: Text('Get Your Score'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }


  void cancelTimer(){
    _timer?.cancel();
  }

  void selectOption(int questionId, int optionIndex) {
    answeredQuestions[questionId] = optionIndex;
  }

  int? getSelectedOption(int questionId) {
    return answeredQuestions[questionId];
  }

  List<Option> getOptions(int questionIndex) {
    return questions[questionIndex].options;
  }
  List<Option> getOptionsWithIndex(int questionId) {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].id == questionId) {
        return questions[i].options;
      }
    }
    throw Exception("Question with id $questionId not found");
  }

  void calculateScore() {
    answeredQuestions.forEach((key, value) {
      try {
        if(score.value >= questions.length*4){
          return;
        }
        List<Option> opts = getOptionsWithIndex(key);
        if (opts[value].isCorrect) {
          score.value += 4;
          correctAnswers++;
        } else {
          score.value -= 1;
        }
      } catch (e) {
        Get.snackbar("Uh.Ohhh", e.toString());
      }
    });
  }

  int getScore() {
    return score.value;
  }

  // Navigation
  void goToNextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
      pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}