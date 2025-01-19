import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/controllers/questions_controller.dart';
import 'package:testmime/screens/main_screen.dart';

import '../constants/size_config.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> with SingleTickerProviderStateMixin {
  final QuizQuestionsController controller = Get.find<QuizQuestionsController>();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    controller.calculateScore();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: controller.getScore() / (controller.questions.length * 4)).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: SizeConfig.screenHeight * 0.215,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              width: SizeConfig.screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              child: Center(
                child: Text(
                  "Attempted : ${controller.correctAnswers}/${controller.questions.length}",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.25,
            child: Container(
              width: SizeConfig.screenWidth * 0.8,
              height: SizeConfig.screenHeight * 0.50,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Your score:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: SizeConfig.screenHeight * 0.30,
                        height: SizeConfig.screenHeight * 0.30,
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return CircularProgressIndicator(
                              value: _animation.value,
                              strokeWidth: 8,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            );
                          },
                        ),
                      ),
                      Text(
                        "${controller.getScore()} / ${controller.questions.length * 4}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text("Congratulations!!! You've completed this quiz.")
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.8,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.offAll(() => MainScreen());
                },
                icon: Icon(Icons.home),
                label: Text('Go to home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
