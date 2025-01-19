import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/controllers/questions_controller.dart';
import '../models/options_model.dart';

class OptionsCard extends StatelessWidget {
  final List<Option> options;
  final int questionId;

  OptionsCard({super.key, required this.options, required this.questionId});

  final QuizQuestionsController questionsController = Get.find<QuizQuestionsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int? selectedOptionIndex = questionsController.getSelectedOption(questionId);
      return ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (context, index) {
          Color borderColor;
          Color textColor;
          if (selectedOptionIndex == index) {
            if (options[index].isCorrect) {
              borderColor = Colors.green;
              textColor = Colors.green;
            } else {
              borderColor = Colors.red;
              textColor = Colors.red;
            }
          } else {
            borderColor = Colors.grey.shade400;
            textColor = Colors.black;
          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: RadioListTile(
              value: index,
              groupValue: selectedOptionIndex,
              onChanged: (value) {
                questionsController.selectOption(questionId, index);
              },
              activeColor: borderColor,
              title: Text(
                "${index + 1}. ${options[index].description}",
                style: TextStyle(color: textColor),
              ),
            ),
          );
        },
      );
    });
  }
}
