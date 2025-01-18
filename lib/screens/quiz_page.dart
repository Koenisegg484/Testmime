import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/constants/size_config.dart';
import 'package:testmime/controllers/questions_controller.dart';
import 'package:testmime/controllers/quiz_controller.dart';
import 'package:testmime/widgets/quiz_screen_app_bar.dart';
import '../models/questions_model.dart';

class QuizPage extends StatelessWidget {
  QuizPage({super.key});

  final QuestionsController questionController = Get.put(QuestionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizPageAppBar(
        title: "title",
        questionCount: questionController.questions.length,
        initialTime: 10 * 60,
      ),
      body: Container(
        color: Colors.red,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.03,
          vertical: SizeConfig.screenHeight * 0.03,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(8),
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.white,
            child: Obx(
                  () => Column(
                children: [
                  // Question display with PageView
                  Expanded(
                    child: PageView.builder(
                      controller: questionController.pageController,
                      itemCount: questionController.questions.length,
                      onPageChanged: (index) {
                        questionController.currentQuestionIndex.value = index;
                      },
                      itemBuilder: (context, pageIndex) {
                        final question = questionController.questions[pageIndex];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Question ${pageIndex + 1}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              question.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff707070),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: ListView.builder(
                                itemCount: question.options.length,
                                itemBuilder: (context, optionIndex) {
                                  final option = question.options[optionIndex];
                                  final isSelected = questionController
                                      .selectedOptions[pageIndex] ==
                                      optionIndex;

                                  return GestureDetector(
                                    onTap: () {
                                      questionController.selectOption(
                                          pageIndex, optionIndex);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          SizeConfig.screenWidth * 0.02),
                                      margin: EdgeInsets.all(
                                          SizeConfig.screenWidth * 0.01),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: isSelected
                                              ? (option.isCorrect
                                              ? Colors.green
                                              : Colors.red)
                                              : const Color(0xff7e7d7d),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Text("${optionIndex + 1}. "),
                                          Text(option.description),
                                          Spacer(),
                                          Radio<int>(
                                            value: optionIndex,
                                            groupValue: questionController
                                                .selectedOptions[pageIndex],
                                            onChanged: (value) {
                                              questionController.selectOption(
                                                  pageIndex, value!);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  // Next Button
                  ElevatedButton(
                    onPressed: () {
                      if (questionController.currentQuestionIndex.value <
                          questionController.questions.length - 1) {
                        questionController.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.snackbar("Quiz", "You have completed the quiz!");
                      }
                    },
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
