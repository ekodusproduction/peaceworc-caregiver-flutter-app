import 'package:flutter/material.dart';
import 'package:peace_worc/bloc/profile_registration/get_document_bloc.dart';

import '../../components/document/document_card.dart';
class ProfileDocumentScreen extends StatefulWidget {
  const ProfileDocumentScreen({super.key});

  @override
  State<ProfileDocumentScreen> createState() => _ProfileDocumentScreenState();
}

class _ProfileDocumentScreenState extends State<ProfileDocumentScreen> {
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
    return Column(
      children:[
        Container(
          height: MediaQuery.of(context).size.height *0.6,
          child: ListView.builder(
              itemCount: documentName.length,
              itemBuilder: (BuildContext context, int index){
                return DocumentCard(documentName: documentName[index]);
              }),
        )
      ] ,
    );
  }
  @override
  void dispose() {
    getDocumentBloc.dispose();
    super.dispose();
  }
}
