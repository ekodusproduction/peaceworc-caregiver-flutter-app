import 'package:flutter/material.dart';
class EditEducationCard extends StatelessWidget {
  const EditEducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
              color: Colors.black
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0, bottom: 20.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.edit_outlined, size: 25, color: Colors.black,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
