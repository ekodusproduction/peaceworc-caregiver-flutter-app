import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CovidCard extends StatefulWidget {
  const CovidCard({super.key});

  @override
  State<CovidCard> createState() => _CovidCardState();
}

class _CovidCardState extends State<CovidCard> {
  File? _image;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:8, right: 5, left: 5, bottom: 8),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text( "Covid- 19 Vaccination Card", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top:20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child:  _image != null ? Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Image.file(File(_image!.path), fit: BoxFit.cover,),
                  ): null,
                ),


                GestureDetector(
                  onTap: (){
                    //requestPermission();

                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Icon(Icons.cloud_upload_rounded, size: 40,)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
