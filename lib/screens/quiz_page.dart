import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/controllers/questions_controller.dart';
import 'package:testmime/screens/score_screen.dart';
import 'package:testmime/widgets/questions_card.dart';

class QuizPage extends StatelessWidget {
  QuizPage({super.key});
  
  QuizQuestionsController controller = Get.put(QuizQuestionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=> showExitConfirmationDialog(context),
            icon: Icon(Icons.arrow_back_ios_new_rounded, size: 24, color: Colors.grey,)
        ),
        title: Obx(()=>Text(
          "Question : ${controller.currentQuestionIndex.value}/ ${controller.questions.length}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
        )),
        actions: [
          Obx(() {
            int minutes = controller.timeRemaining.value ~/ 60;
            int seconds = controller.timeRemaining.value % 60;
            return Text('$minutes:${seconds.toString().padLeft(2, '0')}', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),);
          }),
          SizedBox(width: 12,)
        ],
        centerTitle: true,
        elevation: 5,
        bottomOpacity: 50,
        backgroundColor: Color(0xffd263ff),
      ),
      body: Container(
        color: Color(0xffecb8f8),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (index){
                      controller.currentQuestionIndex.value = index+1;
                    },
                    itemCount: controller.questions.length,
                    itemBuilder: (context, index){
                      final question = controller.questions[index];
                      return QuestionsCard(question: question);

                  }),
                )
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if(controller.currentQuestionIndex.value == controller.questions.length){
                      controller.cancelTimer();
                      controller.calculateScore();
                      Get.off(()=>ScoreScreen());
                    }else{
                      controller.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xffd263ff), // Text color
                    elevation: 5, // Elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius
                    ),
                  ),
                  child: Obx((){
                    return controller.currentQuestionIndex.value == controller.questions.length
                        ?Text("Get Your Score")
                        :Text('Next Question');
                  }),
                )

              ],

            )
          ],
        ),
      )
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