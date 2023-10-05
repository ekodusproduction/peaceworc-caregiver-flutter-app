
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
class DocumentCard extends StatefulWidget {
   final String documentName;
  const DocumentCard({super.key, required this.documentName});

  @override
  State<DocumentCard> createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {

  File? _image;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text( widget.documentName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top:20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child:  _image != null ? Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Image.file(File(_image!.path), fit: BoxFit.cover,),
                  ): null,
                ),


                GestureDetector(
                  onTap: (){
                    requestPermission();

                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Icon(Icons.cloud_upload_rounded, size: 40,)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
// This is the image picker

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery,);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void openSettings(){
    openAppSettings();
  }
  Future<void> requestPermission() async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.photos,
      Permission.location
    ].request();
    if (statuses[Permission.storage]!.isDenied) {
      // Camera permission is denied
      print("storage permission denied");
    }
    if(statuses[Permission.storage]!.isPermanentlyDenied){
      print("Permanently Denied");
      openSettings();

    }
    if (statuses[Permission.location]!.isDenied) {
      // Microphone permission is denied
      print("Location permission denied");

    }
    if(statuses[Permission.photos]!.isDenied){
      print("Permission Denied for photos ${statuses[Permission.photos]!.isGranted}");
      openSettings();

    }
    if(statuses[Permission.photos]!.isPermanentlyDenied){
      print("Permanently Denied photos");
      openSettings();

    }
if(Platform.isAndroid){
  if(statuses[Permission.storage]!.isGranted){
    print("permission grantedssss ${statuses[Permission.storage]!.isGranted}");
    _openImagePicker();
    // openSettings();
  }
}else{
  if(statuses[Permission.photos]!.isGranted){
    print("permission granted for photos ${statuses[Permission.photos]!.isGranted}");
    _openImagePicker();
    // openSettings();
  }
}

  }

}
