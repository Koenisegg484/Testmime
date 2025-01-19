import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/constants/size_config.dart';
import 'package:testmime/screens/quiz_page.dart';

class StartQuizScreen extends StatelessWidget {
  final String title;
  final int duration;
  final int totalQuestions;

  const StartQuizScreen(
      {super.key,
      required this.title,
      required this.duration,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white,),
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
        Positioned(
          top: 250,
          left: 100,
          child: Image.asset(
            'assets/illustrations/dim.png',
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
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ),
        // Scaffold content
        Positioned.fill(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2195f1)
                  ),
                  maxLines: 3,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Duration:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            Text(
                              "$duration minutes",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Questions:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            Text(
                              "$totalQuestions questions",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => QuizPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Start Quiz",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32)),
                            Image.asset("assets/illustrations/quz.png", scale: 9,)
                          ],
                        )))
              ],
            ),
          )
        ),
      ],
    );
  }
}
