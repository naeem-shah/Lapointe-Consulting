import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapointeconsultingllc/ui/pages/webview.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 180.0,
                child: Image.asset("images/logo.png")),
            // Card(
            //   elevation: 6,
            //   margin: EdgeInsets.symmetric(horizontal: 24),
            //   child: Padding(
            //     padding:
            //     const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            //     child: ,
            //   ),
            // ),

            // button
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: (){
                          Get.to(()=> Webviewer(link: "https://form.jotform.com/210237682815456"));
                        },
                        child: Text(
                          "Client Intake Form",
                          style: TextStyle(fontSize: 24,color: Colors.white),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 18),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: (){
                          Get.to(()=> Webviewer(link: "https://lapointeconsultingllc.com/services"));
                        },
                        child: Text(
                          "Schedule Meeting",
                          style: TextStyle(fontSize: 24,color: Colors.white),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 18),
                      )),
                ),
              ],
            )

          ],
        ),
      ),
    );
    //   Scaffold(
    //   // backgroundColor: Colors.grey.shade300,
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     title: Text("Lapointe Consulting LLC",style: TextStyle(color: Colors.black),),
    //     elevation: 0,
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         RaisedButton.icon(onPressed: (){
    //           Get.to(()=> Webviewer(link: "https://form.jotform.com/210237682815456"));
    //
    //         },icon: Icon(Icons.create,color: Colors.white,),
    //           label: Text("Create Form"),textColor: Colors.white,
    //           padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 32),),
    //         // Container(
    //         //   width: Get.width,
    //         //   margin: const EdgeInsets.symmetric(horizontal: 12),
    //         //   child: Card(
    //         //     color: Get.theme.primaryColor,
    //         //     child: ListTile(
    //         //     title: Text(
    //         //       "Create Form",
    //         //       style: TextStyle(
    //         //       color: Colors.white
    //         //       ),
    //         //     ),
    //         //       leading: Icon(Icons.create,color: Colors.white),
    //         //       trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white),
    //         //     onTap: (){
    //         //     },
    //         //   ),),
    //         // ),
    //         SizedBox(height: 16,),
    //
    //         RaisedButton.icon(onPressed: (){
    //           Get.to(()=> Webviewer(link: "https://lapointeconsultingllc.com/services"));
    //
    //         },icon: Icon(Icons.access_time,color: Colors.white,),
    //           label: Text("Schedule Meeting"),textColor: Colors.white,
    //           padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
    //         ),
    //         SizedBox(height: 12,),
    //         // Container(
    //         //   width: Get.width,
    //         //   margin: const EdgeInsets.symmetric(horizontal: 12),
    //         //   child: Card(
    //         //     color: Get.theme.primaryColor,
    //         //     child: ListTile(
    //         //     onTap: (){
    //         //
    //         //     },
    //         //     title: Text(
    //         //       "Schedule Meeting",
    //         //       style: TextStyle(color: Colors.white),
    //         //     ),
    //         //     leading: Icon(Icons.access_time,color: Colors.white,),
    //         //     trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white),
    //         //   ),),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
