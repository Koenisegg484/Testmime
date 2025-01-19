import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testmime/constants/size_config.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String description;
  final String topic;
  final int duration;
  final int questionCount;

  const QuizCard(
      {super.key,
      required this.title,
      required this.description,
      required this.topic,
      required this.duration,
      required this.questionCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.white.withValues(alpha: 0.7),
            padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title", style: TextStyle(fontSize: 10),),
                Text(title,
                  style: TextStyle(color: Color(0xff000000), fontWeight: FontWeight.w600, fontSize: 24),
                ),
                if (description.isNotEmpty) Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.005,
                    ),
                    Text("Description", style: TextStyle(fontSize: 10),),
                    Text(description,
                      style: TextStyle(color: Color(0xff000000), fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.005,
                ),
                Text("Topic", style: TextStyle(fontSize: 10),),
                Text(topic, style: TextStyle(color: Color(0xff4177ff), fontWeight: FontWeight.w500, fontSize: 15),),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.005,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Duration", style: TextStyle(fontSize: 10),),
                        Text("$duration minutes", style: TextStyle(color: Color(0xff4177ff), fontWeight: FontWeight.w500, fontSize: 15),),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total questions", style: TextStyle(fontSize: 10),),
                        Text(questionCount.toString(), style: TextStyle(color: Color(0xff4177ff), fontWeight: FontWeight.w500, fontSize: 15),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}