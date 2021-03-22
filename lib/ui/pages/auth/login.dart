import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lapointeconsultingllc/controllers/login_controller.dart';
import 'package:lapointeconsultingllc/ui/pages/auth/register.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    final loginController = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 140.0,
                  child: Image.asset("images/logo.png")),
              Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Form(
                    key: loginController.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Can\'t be Empty';
                            }
                            return null;
                          },
                          onSaved: (text) => loginController.email = text,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Obx(() => TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: loginController.passwordVisible.value,
                          onSaved: (text) =>
                          loginController.password = text,
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Can\'t be Empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                icon: Icon(
                                    loginController.passwordVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () =>
                                    loginController.visibilityAction()),
                          ),
                        )),
                        SizedBox(
                          height: 16,
                        ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: GestureDetector(
                        //     onTap: () => Get.dialog(),
                        //     child: Text(
                        //       'Account Forgot?',
                        //       textAlign: TextAlign.right,
                        //       style: TextStyle(
                        //           color: MyColors.primaryColor,
                        //           fontWeight: FontWeight.w500,fontSize: 14,
                        //           fontFamily: 'Roboto'),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),

              // button
              Container(
                padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Obx(()=> RaisedButton(
                      onPressed: loginController.buttonAction.value
                          ? ()=>loginController.login()
                          : null,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                    ))),
              ),

              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Don't have an Account? ",
                    style: TextStyle(color: Colors.black, fontFamily: 'Roboto',fontSize: 14),
                    children: [
                      TextSpan(
                          text: "Get Registered",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Get.theme.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.offAll(Register())
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}