import 'package:flutter/material.dart';
import 'package:testmime/constants/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  const CustomAppBar({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: ShapeDecoration(
              color: Color(0xffb5d0f3).withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100), side: BorderSide(color: Colors.blueAccent, width: 1))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/illustrations/usr.png",)),
          ),
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
    );
  }

  @override
  Size get preferredSize => Size(SizeConfig.screenWidth, SizeConfig.screenHeight * 0.09);
}