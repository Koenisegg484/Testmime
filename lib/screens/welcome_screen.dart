import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmime/screens/main_screen.dart';
import '../services/hive_service.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final SavedName savedName = SavedName();
  final TextEditingController _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What can I call you?",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(0xff2c2c2c),
                  fontWeight: FontWeight.w600,
                  fontSize: 28),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Your name please...",
                hintStyle: TextStyle(
                    color: Color(0xffb2b0b0),
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            IconButton(
              onPressed: () {
                if(_nameController.text == ""){
                  // TODO: Create a custom error snackbar
                  Get.snackbar("Error", "Please enter your name");
                  return;
                }else{
                  savedName.saveUsername(_nameController.text);
                  Get.off(MainScreen());
                }
              },
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xffb6b6b6),
                size: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
