import 'package:get/get.dart';
import 'package:simple_flutter_mvvm/pages/profile/bindings/profile_binding.dart';

import '../../../commons/view_utils.dart';
import '../../main/controllers/main_controller.dart';
import '../../main/models/user_model.dart';
import '../views/profile_page.dart';

class ProfileController extends GetxController {
  late UserModel model;

  @override
  void onInit() {
    model = Get.arguments;
    super.onInit();
  }

  void onFriendTapped(String guid) {
    final users = Get.find<MainController>().cachedUsers;
    final index = users.indexWhere((e) => e.guid == guid);
    if (index == -1) {
      ViewUtils.showErrorToast('User not found');
    } else {
      Get.to(
        ProfilePage.new,
        arguments: users[index],
        binding: ProfileBinding(),
      );
    }
  }
}
