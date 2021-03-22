import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapointeconsultingllc/models/user_model.dart';
import 'package:lapointeconsultingllc/services/db_manager.dart';
import 'package:lapointeconsultingllc/ui/pages/auth/login.dart';

class RegisterController extends GetxController{

  String name, email, password;

  var passwordVisible = true.obs;

  var buttonAction = true.obs;

  var loginIdError = "Can't be empty".obs;

  final formKey = GlobalKey<FormState>();


  void visibilityAction() {
    passwordVisible.value = !passwordVisible.value;
  }

  void registerPatient() async {

    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    buttonAction(false);

    Get.dialog(Center(child: CircularProgressIndicator()));
    UserModel userModel = new UserModel(name: name, email: email, password: password);
    await Future.delayed(Duration(seconds: 2),(){

    });

    int value = await DatabaseManager.db.addUser(userModel);
    Get.back();
    buttonAction(true);

    if (value > 0){

      Get.defaultDialog(
        title: "",
        titleStyle: TextStyle(fontSize: 0),
        barrierDismissible: false,
        content: Column(
          children: [
            Icon(Icons.check_circle_outline,color: Colors.green,size: 48,),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Registration Completed Successfully",style: TextStyle(
                fontSize: 16,color: Colors.black87,
              ),textAlign: TextAlign.center,),
            )
          ],
        ),
        onConfirm: ()=>Get.off(Login()),
        confirmTextColor: Colors.white
      );
    } else {
      Get.rawSnackbar(message: "Something went wrong",backgroundColor: Colors.black87);
    }

  }

}