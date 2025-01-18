import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/constants/size_config.dart';
import 'package:testmime/screens/start_quiz_screen.dart';
import 'package:testmime/views/quiz_card.dart';
import 'package:testmime/widgets/custom_app_bar.dart';

import '../controllers/quiz_controller.dart';
import '../controllers/starting_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final StartingController savedName = Get.put(StartingController());
  final QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    quizController.fetchQuizzes();

    return Scaffold(
      appBar: CustomAppBar(
        username: savedName.getName()!,
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff7e7d7d), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Take a Quiz!!!",
                  style: TextStyle(
                    fontSize: SizeConfig.screenHeight * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3d3d3d),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Available Quizzes",
                style: TextStyle(
                  fontSize: SizeConfig.screenHeight * 0.018,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3d3d3d),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                  child: Container(
                    // color: Colors.red,
                    child: Obx(() {
                      // Show loading spinner while data is loading
                      if (quizController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }

                      // Show error message if there is an error
                      if (quizController.hasError.value) {
                        return Center(child: Text('Error loading quizzes.'));
                      }

                      // Show quizzes if they are available
                      if (quizController.quizzes.isEmpty) {
                        return Center(child: Text('No quizzes available.'));
                      }

                      // Display the list of quizzes
                      return ListView.builder(
                        itemCount: quizController.quizzes.length,
                        itemBuilder: (context, index) {
                          final quiz = quizController.quizzes[index];
                          return GestureDetector(
                            onTap: (){
                              Get.to(()=> StartQuizScreen(title: quiz.title, duration: quiz.duration, totalQuestions: quiz.questionsCount,));
                            },
                            child: QuizCard(
                              title: quiz.title,
                              description: quiz.description,
                              topic: quiz.topic,
                              duration: quiz.duration,
                              questionCount: quiz.questionsCount,
                            ),
                          );
                        },
                      );
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
