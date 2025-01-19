import 'dart:async';
import 'package:flutter/material.dart';

class QuizPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final int questionCount;
  final int initialTime;
  final int answeredQuestions = 0;

  const QuizPageAppBar({
    super.key,
    required this.title,
    required this.questionCount,
    required this.initialTime,
  });

  @override
  _QuizPageAppBarState createState() => _QuizPageAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _QuizPageAppBarState extends State<QuizPageAppBar> {
  late int remainingTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialTime;
    // Start the countdown timer
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Exit Quiz',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure you want to exit the quiz?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Close the dialog
              },
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Close the dialog
                Navigator.pop(context);  // Exit the quiz screen
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => _showExitDialog(context),  // Show the exit confirmation dialog
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Questions: ${widget.answeredQuestions}/${widget.questionCount}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            formatTime(remainingTime),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.blueAccent,
      elevation: 5,
    );
  }
}
