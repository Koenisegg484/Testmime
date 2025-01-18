import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class SavedName{
  void saveUsername(String username) async {
    var box = Hive.box<String>('userBox');
    if (kDebugMode) {
      print("username => $username");
    }
    await box.put('username', username);
  }

  static String? getUsername() {
    var box = Hive.box<String>('userBox');
    return box.get('username');
  }
}