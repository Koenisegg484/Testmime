import 'package:get/get.dart';
import 'package:testmime/services/hive_service.dart';

class StartingController extends GetxController{
  final String? _name = SavedName.getUsername();
  String? get name => _name;

  String? getName(){
    return name;
  }
}