import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  File? _image;
  final _picker = ImagePicker();
  bool isLoading = false;

  DateTime selectedDate = DateTime.now();
  final List<String> items = [
    'Select gender',
    'Male',
    'Female',
    'Other',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  child: _image != null?
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: Image.file(File(_image!.path)).image,
                      ):
                      Icon(Icons.person, color: Colors.black26, size: 45,),
                ),
                Positioned(
                  top: 0.0,
                  right: 130.0,
                  child: GestureDetector(
                    onTap: (){
                      requestPermission();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.camera_alt_outlined,
                            size: 20.0, color: Colors.black),
                      ),
                    ),
                  ), //Icon
                ),
              ],
            ),
          ),
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

          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      _selectDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("", style: TextStyle(color: Colors.black),),
                            Icon(Icons.calendar_month, color: Colors.black,)
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    //cursorColor: Colors.redAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Select Item',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 140,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ),

                  ),
                ),

              ],
            ),
          ),
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
              labelText: "SSN Number *",
              hintStyle: TextStyle(color: Colors.black, fontSize: 10.0),
              labelStyle: TextStyle(color: Colors.black),


            ),

          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Icon(Icons.search, color: Colors.grey,size: 20,)
                ],
              ),
            ),

          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Guwahati", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Ffb Business Center 5587, West", style: TextStyle(color: Colors.grey, fontSize: 14),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(height: 4,color: Colors.black,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Street name/number", style: TextStyle(color: Colors.grey, fontSize: 14),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Apartment name/number", style: TextStyle(color: Colors.grey, fontSize: 14),),
                  ),

                ],
              ),

            ),
          )
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void openSettings(){
    openAppSettings();
  }

  Future<void> requestPermission() async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.photos,
    ].request();
    if (statuses[Permission.storage]!.isDenied) {
      // Camera permission is denied
      print("storage permission denied");
    }
    if(statuses[Permission.storage]!.isPermanentlyDenied){
      print("Permanently Denied");
      openSettings();
    }
    if(statuses[Permission.photos]!.isDenied){
      print("Permission Denied for photos ${statuses[Permission.photos]!.isGranted}");
      openSettings();
    }
    if(statuses[Permission.photos]!.isPermanentlyDenied){
      print("Permanently Denied photos");
      openSettings();
    }
    if(Platform.isAndroid){
      if(statuses[Permission.storage]!.isGranted){
        print("permission grantedssss ${statuses[Permission.storage]!.isGranted}");
        _openImagePicker();
        // openSettings();
      }
    }else{
      if(statuses[Permission.photos]!.isGranted){
        print("permission granted for photos ${statuses[Permission.photos]!.isGranted}");
        _openImagePicker();
        // openSettings();
      }
    }
  }
}