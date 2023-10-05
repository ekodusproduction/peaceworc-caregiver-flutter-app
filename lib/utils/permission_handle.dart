import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:flutter/material.dart';
mixin PermissionHandler<T, W extends StatefulWidget> on State<W>{
  File? _image;
  final _picker = ImagePicker();
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
  void openSettings(){
    openAppSettings();
  }
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
  File? getImage() {
    return _image;
  }

}