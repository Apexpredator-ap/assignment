import 'package:get/get.dart';
import '../db/database_helper.dart';
import '../model/user_model.dart';
import '../view/home_page.dart';
import '../view/login_page.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<void> registerUser(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty || password.length < 6) {
      Get.snackbar("Error", "Invalid input", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    int result = await DatabaseHelper().registerUser(User(name: name, email: email, password: password));

    isLoading.value = false;
    if (result > 0) {
      Get.snackbar("Success", "Account created");
      Get.offAll(LoginPage());
    } else {
      Get.snackbar("Error", "Email already in use");
    }
  }

  Future<void> loginUser(String email, String password) async {
    if (email.isEmpty || password.isEmpty || password.length < 6) {
      Get.snackbar("Error", "Invalid credentials", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    User? user = await DatabaseHelper().loginUser(email, password);
    isLoading.value = false;

    if (user != null) {
      Get.offAll(() => HomePage(userName: user.name));
    } else {
      Get.snackbar("Error", "Invalid email or password");
    }
  }
}
