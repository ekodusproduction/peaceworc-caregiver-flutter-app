import 'package:flutter/material.dart';
class BasicInfoScreen extends StatelessWidget {
  const BasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         body: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://picsum.photos/250?image=9"),
                radius: 50,
              ),
            ),
            Row(
              children: [
                TextField(
                  cursorColor: Colors.black,

                  style: TextStyle(

                      color: Colors.black
                  ),

                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Mobile Number *",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 10.0),
                    labelStyle: TextStyle(color: Colors.black),


                  ),

                )
              ],
            )
          ],
      ),
       );

  }
}
