import 'package:flutter/material.dart';
import 'package:peace_worc/components/card/flag_card.dart';
class FlagScreen extends StatefulWidget {


   const FlagScreen({super.key});

  @override
  State<FlagScreen> createState() => _FalgScreenState();


}

class _FalgScreenState extends State<FlagScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      print(_scrollPosition);
    });
  }

  List<String> documentName = ["Tuberculosis Test Result","Covid- 19 Vaccination Card",
    "Criminal Background Result","Child Abuse Clearance",
    "Employment Eligibility Verification Form(i-9 Form)", "Driving License", "2 - forms of id"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        leading: BackButton(),
        title: Text("Flags", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent
      ) ,
      body: ListView.builder(
          itemCount: documentName.length,
          itemBuilder: (BuildContext context, int index){
            return FlagCard();
          }),
    );
  }
}
