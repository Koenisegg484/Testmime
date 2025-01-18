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
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xffea9090),
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.005,
            ),
            if (description.isNotEmpty) Text(description),
            SizedBox(
              height: SizeConfig.screenHeight * 0.005,
            ),
            Text(topic),
            SizedBox(
              height: SizeConfig.screenHeight * 0.005,
            ),
            Text("Duration: $duration minutes"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.005,
            ),
            Text("Total questions: $questionCount"),
          ],
        ),
      ),
    );
  }
}

// "id": 60,
// "name": null,
// "title": "Genetics and Evolution",
// "description": "",
// "difficulty_level": null,
// "topic": "The Molecular Basis of Inheritance",
// "time": "2024-07-15T00:00:00.000+05:30",
// "is_published": true,
// "created_at": "2024-07-15T17:42:08.623+05:30",
// "updated_at": "2024-09-23T18:43:29.210+05:30",
// "duration": 15,
// "end_time": "2024-07-16T00:00:00.000+05:30",
// "negative_marks": "1.0",
// "correct_answer_marks": "4.0",
// "shuffle": true,
// "show_answers": true,
// "lock_solutions": false,
// "is_form": false,
// "show_mastery_option": false,
// "reading_material": null,
// "quiz_type": null,
// "is_custom": false,
// "banner_id": null,
// "exam_id": null,
// "show_unanswered": false,
// "ends_at": "2025-01-18",
// "lives": null,
// "live_count": "Free Test",
// "coin_count": -1,
// "questions_count": 10,
// "daily_date": "January 17, 2025",
// "max_mistake_count": 9,
// "reading_materials": [],
