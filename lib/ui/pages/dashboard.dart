import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:lapointeconsultingllc/ui/pages/webview.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 32,bottom: 100),
        children: [
          Container(height: 180.0, child: Image.asset("images/logo.png")),
          SizedBox(height: 40,),
        Column(
            children: [
              Container(
                padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        Get.to(() => Webviewer(
                            link:
                            "https://form.jotform.com/210237682815456"));
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 18),
                    )),
              ),
              Container(
                padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        Get.to(() => Webviewer(
                            link: "https://www.securefirmportal.com/"));
                      },
                      child: Text(
                        "Client Portal Login",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 18),
                    )),
              ),
              Container(
                padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        Get.to(() => Webviewer(
                            link:
                            "https://lapointeconsultingllc.com/services"));
                      },
                      child: Text(
                        "Schedule Meeting",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 18),
                    )),
              ),
              Container(
                padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        Get.to(() => Webviewer(
                            link:
                            "https://sa.www4.irs.gov/irfof/lang/en/irfofgetstatus.jsp"));
                      },
                      child: Text(
                        "Where's my refund?",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 18),
                    )),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Get.theme.primaryColor,
        onPressed: () async {
          final Email email = Email(
            recipients: ['taxes@lapointeconultingllc.com'],
          );

          await FlutterEmailSender.send(email);
        },
        label: Text("Contact Us"),
        icon: Icon(Icons.contact_support_rounded),
      ),
    );
  }
}
