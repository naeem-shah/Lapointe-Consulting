import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lapointeconsultingllc/controllers/register_controller.dart';
import 'package:lapointeconsultingllc/ui/pages/auth/login.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    RegisterController controller = Get.put(RegisterController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(height: 140, child: Image.asset("images/logo.png")),
              Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 24,
                        ),

                        // name
                        TextFormField(
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          onSaved: (text) => controller.name = text,
                          validator: (text) {
                            if (text.trim().isEmpty) {
                              return "Can't be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),

                        // Email
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onSaved: (text) => controller.email = text,
                          validator: (text) {
                            if (text.trim().isEmpty) {
                              return "Can't be empty";
                            } else if (!GetUtils.isEmail(text)) {
                              return "Invalid Email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),

                        // password
                        Obx(() => TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: controller.passwordVisible.value,
                          onSaved: (text) => controller.password = text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if (text.trim().isEmpty) {
                              return "Can't be empty";
                            } else if (text.trim().length < 6) {
                              return "too short must be greater than 6";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: Icon(
                                    controller.passwordVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                onPressed: () =>
                                    controller.visibilityAction()),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: Get.width,
                      child: Obx(() => RaisedButton(
                        onPressed: controller.buttonAction.value
                            ? () => controller.registerPatient()
                            : null,
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 18,color: Colors.white),
                        ),textColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                      )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Already a member? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 14),
                          children: [
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Get.theme.primaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.offAll(()=>Login()))
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
