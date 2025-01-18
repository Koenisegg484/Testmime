import 'package:flutter/material.dart';
import 'package:testmime/constants/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  const CustomAppBar({Key? key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.face_2_rounded, size: SizeConfig.screenWidth * 0.09),
            SizedBox(width: SizeConfig.screenWidth * 0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome", style: TextStyle(fontSize: SizeConfig.screenWidth * 0.04)),
                Text(username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.screenWidth * 0.05)),
              ],
            ),
            Spacer(),
            Icon(Icons.menu_rounded, size: SizeConfig.screenWidth * 0.06),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(SizeConfig.screenWidth, SizeConfig.screenHeight * 0.09);
}