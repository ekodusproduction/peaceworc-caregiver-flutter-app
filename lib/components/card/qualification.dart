import 'package:flutter/material.dart';
class Qualification extends StatelessWidget {
  const Qualification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.school),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Test", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              Text("Bsc", style: TextStyle(color: Colors.grey[400]),),
              Text("2015-2018", style: TextStyle(color: Colors.grey[400]),)
            ],
          )
        ],
      ),
    );
  }
}
