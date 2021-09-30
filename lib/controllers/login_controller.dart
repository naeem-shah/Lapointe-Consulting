import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapointeconsultingllc/services/db_manager.dart';
import 'package:lapointeconsultingllc/ui/pages/dashboard.dart';
import 'package:lapointeconsultingllc/ui/pages/webview.dart';

class LoginController extends GetxController {
  String email, password;

  var passwordVisible = true.obs;
  var buttonAction = true.obs;

  final formKey = GlobalKey<FormState>();

  void visibilityAction() {
    passwordVisible.value = !passwordVisible.value;
  }

  void login() async {
    // form validation
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();

    Get.dialog(Center(child: CircularProgressIndicator()));
    buttonAction(false);
    await Future.delayed(Duration(seconds: 2),(){});
    bool verified = false;
    if ((email == "lapointe@gmail.com" && password == "123456")||
        (email == "llc1@gmail.com" && password == "Llc1234")){
      verified = true;
    } else {
      verified = await DatabaseManager.db.verifyUser(email, password);
    }
    Get.back();
    buttonAction(true);

    if (verified){
      Get.offAll(()=> Dashboard());
    } else {
      Get.rawSnackbar(message: "Invalid credentials",backgroundColor: Colors.red);
    }
  }
}
