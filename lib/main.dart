import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testmime/constants/size_config.dart';
import 'package:testmime/screens/main_screen.dart';
import 'package:testmime/screens/welcome_screen.dart';
import 'package:testmime/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('userBox');

  // Check if a username exists in local storage
  String? username = SavedName.getUsername();

  runApp(MyApp(initialScreen: username != null ? MainScreen() : WelcomeScreen()));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;

  const MyApp({super.key, required this.initialScreen});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TestMime",
      home: initialScreen,
    );
  }
}

