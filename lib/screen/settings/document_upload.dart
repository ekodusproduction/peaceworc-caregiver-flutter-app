import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peace_worc/components/document/document_card.dart';
import 'package:permission_handler/permission_handler.dart';
class DocumentUpload extends StatefulWidget {
  const DocumentUpload({super.key});

  @override
  State<DocumentUpload> createState() => _DocumentUploadState();
}

class _DocumentUploadState extends State<DocumentUpload> {
  List<String> documentName = ["Tuberculosis Test Result","Covid- 19 Vaccination Card",
    "Criminal Background Result","Child Abuse Clearance",
    "Employment Eligibility Verification Form(i-9 Form)", "Driving License", "2 - forms of id"];


  void openSettings(){
    openAppSettings();
  }
  Future<void> requestPermission() async{
    Map<Permission, PermissionStatus> status = await [
     Permission.storage,
      Permission.location
    ].request();
    if (status[Permission.storage]!.isDenied) {
      // Camera permission is denied
      print("storage permission denied");
    }
    if(status[Permission.storage]!.isPermanentlyDenied){
      print("Permanently Denied");
      openSettings();

    }
    if (status[Permission.location]!.isDenied) {
      // Microphone permission is denied
      print("Location permission denied");
    }
    if(status[Permission.storage]!.isGranted){
      print("permission granted");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Document management", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: documentName.length,
                  itemBuilder: (BuildContext context, int index){
        return DocumentCard(documentName: documentName[index], onTap: (){
          requestPermission();
        },);
      }),
    );
  }
}
