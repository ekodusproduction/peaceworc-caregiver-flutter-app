import 'package:flutter/material.dart';
import 'package:peace_worc/components/card/strike_card.dart';
class StrikeScreen extends StatefulWidget {
  const StrikeScreen({super.key});

  @override
  State<StrikeScreen> createState() => _StrikeScreenState();
}

class _StrikeScreenState extends State<StrikeScreen> {
  List<String> documentName = [
    "Tuberculosis Test Result",
    "Covid- 19 Vaccination Card",
    "Criminal Background Result",
    "Child Abuse Clearance",
    "Employment Eligibility Verification Form(i-9 Form)",
    "Driving License",
    "2 - forms of id"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                color: Colors.black,
              ),
              Text(
                "Strikes",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.question_mark_outlined,
                size: 30.0,
                color: Colors.black,
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent),
      body: ListView.builder(
          itemCount: documentName.length,
          itemBuilder: (BuildContext context, int index) {
            return StrikeCard();
          }),
    );
  }
}
