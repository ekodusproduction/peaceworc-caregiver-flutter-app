import 'package:flutter/material.dart';
import 'package:peace_worc/components/card/edit_education_card.dart';
class EditEducationListScreen extends StatefulWidget {
  const EditEducationListScreen({super.key});

  @override
  State<EditEducationListScreen> createState() => _EditEducationListScreenState();
}

class _EditEducationListScreenState extends State<EditEducationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black,),
        title: Text("Edit Education", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index){
                return EditEducationCard();
              }),
        ),
      ),
    );
  }
}
