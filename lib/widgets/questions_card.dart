import 'package:flutter/material.dart';
import 'package:testmime/constants/size_config.dart';
import 'package:testmime/widgets/options_card.dart';

import '../models/questions_model.dart';

class QuestionsCard extends StatelessWidget {
  final Question question;
  const QuestionsCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(SizeConfig.screenHeight*0.01),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenHeight*0.02, vertical: SizeConfig.screenHeight*0.05), // Optional padding
            decoration: BoxDecoration(
              color: Colors.purple[300],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                question.description,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 12,),
          OptionsCard(options: question.options, questionId: question.id),
        ],
      ),
    );
  }
}