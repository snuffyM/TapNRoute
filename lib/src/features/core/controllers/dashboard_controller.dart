import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tapnroute/src/features/core/models/apply_model.dart';

import '../../../repository/user_repository/dashboard_repository.dart';

class DashBoardController extends GetxController {
  static DashBoardController get instance => Get.find();

  TextEditingController startLocation = TextEditingController();
  final endLocation = TextEditingController();
  final date = TextEditingController();
  final time = TextEditingController();
  final pCount = TextEditingController();

  final userRepo = Get.put(DashBoardRepository());

  Future<void> createApply(ApplyModel apply) async{
    await userRepo.createApply(apply);
  }
}