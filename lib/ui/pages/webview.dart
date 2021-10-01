import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Webviewer extends StatefulWidget {
  final String link;

  const Webviewer({Key key,@required this.link}) : super(key: key);
  @override
  _WebviewerState createState() => _WebviewerState();
}

class _WebviewerState extends State<Webviewer> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => willPopScope()??false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black54,
          brightness: Brightness.dark,
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.link)),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
                useOnDownloadStart: true
            ),
          ),
          onLoadStart: (_,__){
            Get.dialog(Center(child: CircularProgressIndicator(),),barrierColor: Colors.white);
          },
          onLoadStop: (_,__){
            if (Get.isDialogOpen)
              Get.back();

            getPermissions();
          },
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          onDownloadStart: (controller, url) async {
            print("onDownloadStart $url");
            await FlutterDownloader.enqueue(
              url: url.toString(),
              savedDir: (await getExternalStorageDirectory()).path,
              showNotification: true,
              openFileFromNotification: true,
            );
          },
        ),
      ),
    );
  }


  Future<void> getPermissions() async {
    await Permission.storage.request();
    await Permission.photos.request();
  }

  Future<bool> willPopScope() async {
    return await Get.defaultDialog(
      title: "Alert!",
      content: Text("Do you really want to exit?"),
      onConfirm: ()=> Get.back(result: true),
      onCancel: () {

      },
      confirmTextColor: Colors.white
    );
  }
}
