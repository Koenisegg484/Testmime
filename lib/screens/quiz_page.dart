import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/controllers/questions_controller.dart';
import 'package:testmime/screens/score_screen.dart';
import 'package:testmime/widgets/questions_card.dart';

class QuizPage extends StatelessWidget {
  QuizPage({super.key});

  final QuizQuestionsController controller = Get.put(QuizQuestionsController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container
        Container(color: Colors.white),
        // Top left illustration
        Positioned(
          top: -50,
          left: -50,
          child: Image.asset(
            'assets/illustrations/abs.png',
            width: 350,
            height: 350,
          ),
        ),
        // Bottom right illustration
        Positioned(
          bottom: -50,
          right: -50,
          child: Image.asset(
            'assets/illustrations/spr.png',
            width: 350,
            height: 350,
          ),
        ),
        // Blur effect with semi-transparent overlay
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.blue.withValues(alpha: 0.1),
            ),
          ),
        ),
        // Scaffold content
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => showExitConfirmationDialog(context),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 24,
                  color: Colors.grey.shade800,
                ),
              ),
              title: Obx(
                    () => Text(
                  "Question: ${controller.currentQuestionIndex.value} / ${controller.questions.length}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Obx(() {
                    int minutes = controller.timeRemaining.value ~/ 60;
                    int seconds = controller.timeRemaining.value % 60;
                    return Text(
                      '$minutes:${seconds.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
                ),
                SizedBox(width: 12),
              ],
              centerTitle: true,
              elevation: 5,
              backgroundColor: Colors.blue.withValues(alpha: 0.25),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: controller.pageController,
                        onPageChanged: (index) {
                          controller.currentQuestionIndex.value = index + 1;
                        },
                        itemCount: controller.questions.length,
                        itemBuilder: (context, index) {
                          final question = controller.questions[index];
                          return QuestionsCard(question: question);
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (controller.currentQuestionIndex.value == controller.questions.length) {
                              controller.cancelTimer();
                              controller.calculateScore();
                              Get.off(() => ScoreScreen());
                            } else {
                              controller.pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.lightBlue,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          child: Obx(() {
                            return controller.currentQuestionIndex.value == controller.questions.length
                                ? Text("Get Your Score")
                                : Text('Next Question');
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




void showExitConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Exit Quiz',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        content: Text(
          'Are you sure you want to exit the quiz?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              // Handle Yes action
              Navigator.of(context).pop(true);
            },
            child: Text(
              'Yes',
              style: TextStyle(fontSize: 14),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              // Handle No action
              Navigator.of(context).pop(false);
            },
            child: Text(
              'No',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      );
    },
  );
}