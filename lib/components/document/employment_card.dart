import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peace_worc/model/doc_upload/doc_upload_response.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../api/api_links.dart';
import '../../bloc/profile_registration/upload_doc_bloc.dart';
class EmploymentCard extends StatefulWidget {
  final List<Employment>? docs;
  const EmploymentCard({super.key, required this.docs});

  @override
  State<EmploymentCard> createState() => _EmploymentCardState();
}

class _EmploymentCardState extends State<EmploymentCard> {
  File? _image;
  final _picker = ImagePicker();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    addDocUploadListener();
  }

  void addDocUploadListener() {
    uploadDocBloc.subject.stream.listen((value) async {
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
                Text( "Employment Eligibility Verification Form(i-9 Form)", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top:20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.docs?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Image.network(
                              ApiLinks.PUBLIC_URL+widget.docs![index].image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }),
                ),

                GestureDetector(
                  onTap: (){
                    requestPermission();
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
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      setState(() {
        isLoading = true;
      });
      uploadDocBloc.uploadDoc(_image!, _image!.path.split('/').last, 'employment', "09-09-2065");
    }
  }
  void openSettings(){
    openAppSettings();
  }
  Future<void> requestPermission() async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.photos,
      Permission.location
    ].request();
    if (statuses[Permission.storage]!.isDenied) {
      // Camera permission is denied
      print("storage permission denied");
    }
    if(statuses[Permission.storage]!.isPermanentlyDenied){
      print("Permanently Denied");
      openSettings();

    }
    if (statuses[Permission.location]!.isDenied) {
      // Microphone permission is denied
      print("Location permission denied");

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

  @override
  void dispose() {
    super.dispose();
    uploadDocBloc.dispose();
  }
}
