import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tapnroute/src/features/authentication/models/user_model.dart';
import 'package:tapnroute/src/features/core/models/apply_model.dart';
import 'package:tapnroute/src/repository/authentication_repository/exceptions/authentication_repository.dart'
    show AuthenticationRepository;
import 'package:tapnroute/src/repository/user_repository/dashboard_repository.dart';

import '../../../repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  final _dashRepo = Get.put(DashBoardRepository());

  void onInit() {
    super.onInit();
    getUserData();
  }

  getUserData() async {
    final phoneNo = _authRepo.firebaseUser.value?.phoneNumber;
    if (phoneNo != null) {
      final userData = await _userRepo.getUserDetails(phoneNo);
      print("User data: $userData");
      // do something with the user data
    } else {
      print("Error, Login to Continue");
      //Get.snackbar("Error", "Login to Continue");
    }
  }

  Future<List<ApplyModel>> getTravelHistory() async {
    return await _dashRepo.travel_History();
  }
}
