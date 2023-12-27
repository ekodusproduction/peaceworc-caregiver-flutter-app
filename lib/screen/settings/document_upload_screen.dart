import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peace_worc/components/document/child_abuse_card.dart';
import 'package:peace_worc/components/document/covid_card.dart';
import 'package:peace_worc/components/document/criminal_card.dart';
import 'package:peace_worc/components/document/document_card.dart';
import 'package:peace_worc/components/document/driving_card.dart';
import 'package:peace_worc/components/document/employment_card.dart';
import 'package:peace_worc/components/document/identification_card.dart';
import 'package:peace_worc/components/document/tubeculosis_card.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../bloc/profile_registration/get_document_bloc.dart';
class DocumentUpload extends StatefulWidget {
  const DocumentUpload({super.key});

  @override
  State<DocumentUpload> createState() => _DocumentUploadState();
}

class _DocumentUploadState extends State<DocumentUpload> {
  var isLoading = false;
  List<String> documentName = ["Tuberculosis Test Result","Covid- 19 Vaccination Card",
    "Criminal Background Result","Child Abuse Clearance",
    "Employment Eligibility Verification Form(i-9 Form)", "Driving License", "2 - forms of id"];

  @override
  void initState() {
    getDocumentBloc.getDocument();
    getDocumentListener();
    super.initState();
  }
  void getDocumentListener() {
    getDocumentBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value.error.toString()),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text("Document management", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          TuberculosisCard(),
          CovidCard(),
          CriminalCard(),
          ChildAbuseCard(),
          EmploymentCard(),
          DrivingCard(),
          IdentificationCard()
        ],
      ),
    );
  }

  @override
  void dispose() {
    getDocumentBloc.dispose();
    super.dispose();
  }
}