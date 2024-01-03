import 'dart:ffi';
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
import 'package:shimmer/shimmer.dart';

import '../../api/api_client.dart';
import '../../bloc/profile_registration/get_document_bloc.dart';
import '../../bloc/profile_registration/upload_doc_bloc.dart';
import '../../model/doc_upload/doc_upload_response.dart';
class DocumentUpload extends StatefulWidget {
  final bool? isSettinngs;
  const DocumentUpload({super.key, required this.isSettinngs});

  @override
  State<DocumentUpload> createState() => _DocumentUploadState();
}

class _DocumentUploadState extends State<DocumentUpload> {
  var isLoading = false;
  List<String> documentName = ["Tuberculosis Test Result","Covid- 19 Vaccination Card",
    "Criminal Background Result","Child Abuse Clearance",
    "Employment Eligibility Verification Form(i-9 Form)", "Driving License", "2 - forms of id"];
  List<Tuberculosis>? tuberculosisList;
  List<Covid>? covidList;
  List<Criminal>? criminalList;
  List<ChildAbuse>? childAbuseList;
  List<Employment>? employmentList;
  List<Driving>? drivingList;
  List<Identification>? identificationList;

  @override
  void initState() {
    isLoading = true;
    getDocumentBloc.getDocument();
    getDocumentListener();
    super.initState();
  }
  void getDocumentListener() {
    getDocumentBloc.subject.stream.listen((value) async {
      if(value.error == null){
        if (value.success == true) {
          setState(() {
            tuberculosisList = value.data?.tuberculosis;
            covidList = value.data?.covid;
            criminalList = value.data?.criminal;
            childAbuseList = value.data?.childAbuse;
            employmentList = value.data?.employment;
            drivingList = value.data?.driving;
            identificationList = value.data?.identification;
          });
          setState(() {
            isLoading = false;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
          setState(() {
            isLoading = false;
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value.error.toString()),
        ));
        setState(() {
          isLoading = false;
        });
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
      body: isLoading ? ListView(
          children: [
            SizedBox(height: 8,),
            loadingCard(),
            loadingCard(),
            loadingCard(),
            loadingCard(),
            loadingCard(),
            loadingCard(),
            loadingCard()
          ],
        ): ListView(
        children: [
          TuberculosisCard(docs: tuberculosisList),
          CovidCard(docs: covidList,),
          CriminalCard(docs: criminalList,),
          ChildAbuseCard(docs: childAbuseList,),
          EmploymentCard(docs: employmentList,),
          DrivingCard(docs: drivingList,),
          IdentificationCard(docs: identificationList,)
        ],
      ),
    );
  }

  Shimmer loadingCard(){
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8)
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    getDocumentBloc.dispose();
    uploadDocBloc.dispose();
    ApiClient.dispose();
    super.dispose();
  }
}
