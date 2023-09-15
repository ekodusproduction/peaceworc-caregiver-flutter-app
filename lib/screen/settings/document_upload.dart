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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.white,
        title: const Text("Document management", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,

      ),
      body: ListView.builder(
        itemCount: documentName.length,
                  itemBuilder: (BuildContext context, int index){
        return DocumentCard(documentName: documentName[index]);
      }),
    );
  }
}
