import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testmime/models/options_model.dart';
import 'package:testmime/models/quiz_model.dart';

import '../models/questions_model.dart';

class QuizController extends GetxController {
  RxList<Quiz> quizzes = <Quiz>[].obs;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;

  Future<void> fetchQuizzes() async {
    isLoading(true);
    hasError(false);
    try {
      final response =
      await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        quizzes.value = [Quiz.fromJson(data)];
      } else {
        hasError(true);
      }
    } catch (e) {
      print(e.toString());
      hasError(true);
    } finally {
      isLoading(false);
    }
  }

  List<Question> getQuestions() {
    return quizzes[0].getQuestions();
  }

  List<Option> getOptionsWithId(int id) {
    List<Question> questions = getQuestions();
    for (Question question in questions) {
      if (question.id == id) {
        return question.options;
      }
    }
    throw Exception("No options were found");
  }

}