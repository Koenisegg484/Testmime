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
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: Colors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 16,
                      )),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff97d77e)),
                    maxLines: 2,
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.005,
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
                      child: Text(
                        "Duration:\n$duration minutes",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Total Questions:\n$totalQuestions questions",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.005,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(()=> QuizPage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(300)),
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 250,
                      child: Text("Start Quiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 32))))
            ],
          ),
        ),
      ),
    );
  }
}
