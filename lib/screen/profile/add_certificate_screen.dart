import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peace_worc/bloc/profile/add_certificate_bloc.dart';
import 'package:peace_worc/model/profile/add_certificate_model.dart';
import 'package:peace_worc/utils/permission_handle.dart';
import 'dart:io';

class AddCertificateScreen extends StatefulWidget {
  const AddCertificateScreen({super.key});

  @override
  State<AddCertificateScreen> createState() => _AddCertificateScreenState();
}

class _AddCertificateScreenState extends State<AddCertificateScreen>
    with PermissionHandler<File, AddCertificateScreen> {
  final certificateCourse = TextEditingController();
  final startYear = TextEditingController();
  final endYear = TextEditingController();

  @override
  Widget build(BuildContext context) {
     XFile? image = getImage();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Certificate/Course",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); //close Dialog
              },
              child: const Icon(
                Icons.close,
                size: 30.0,
                color: Color.fromRGBO(0, 60, 129, 1),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<AddCertificateBloc, AddCertificateState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, right: 20.0, left: 20.0),
                child: TextFormField(
                  cursorColor: Colors.black,

                  style: const TextStyle(
                      color: Colors.black
                  ),
                  controller: certificateCourse,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),


                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: "Certificate/Course",
                    labelStyle: const TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,

                    hintStyle: const TextStyle(
                        color: Colors.black, fontSize: 10.0),


                  ),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return 'Required';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            color: Colors.black
                        ),
                        controller: startYear,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black
                              )
                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "Start Year",
                          labelStyle: const TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,

                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 10.0),


                        ),
                        validator: (String? value) {
                          if (value == null || value == '') {
                            return 'Required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.black,

                        style: const TextStyle(
                            color: Colors.black
                        ),
                        controller: endYear,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black
                              )
                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "End Year *",
                          labelStyle: const TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,

                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 10.0),


                        ),
                        validator: (String? value) {
                          if (value == null || value == '') {
                            return 'Required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
                child: Container(

                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                          color: Colors.black
                      )

                  ),
                  child: GestureDetector(
                    onTap: (){
                      requestPermission();
                    },
                    child:




          image != null ? Image.file(File(image!.path), fit: BoxFit.cover, height: 100, width: 100,):
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text("Add Certificate Image",
                            style: TextStyle(color: Colors.black),),
                        ),
                        Icon(Icons.add_circle_outline, color: Colors.black,
                          size: 20,)
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 15.0, left: 15.0, bottom: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 60, 129, 1),
                        minimumSize: const Size.fromHeight(50), // NEW
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      onPressed: () {
                        // final snackBar = SnackBar(
                        //   content: const Text('Yay! A SnackBar!'),
                        //   action: SnackBarAction(
                        //     label: 'Undo',
                        //     onPressed: () {
                        //       // Some code to undo the change.
                        //     },
                        //   ),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        BlocProvider.of<AddCertificateBloc>(context).add(AddCertificateButtonClickEvent(certificateOrCourse: certificateCourse.text, documnent: image, startYear: startYear.text, endYear: endYear.text));
                      },
                      child: const Text(
                        'Add Certificate',
                        style: TextStyle(fontSize: 16,
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )

            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
