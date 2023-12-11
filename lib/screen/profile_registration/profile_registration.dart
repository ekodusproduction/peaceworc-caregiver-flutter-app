import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peace_worc/screen/profile_registration/basic_info.dart';
import 'package:peace_worc/screen/profile_registration/document_screen.dart';
import 'package:peace_worc/screen/profile_registration/optional_reg_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../components/document/document_card.dart';
class ProfileRegistrationScreen extends StatefulWidget {
  const ProfileRegistrationScreen({super.key});

  @override
  State<ProfileRegistrationScreen> createState() => _ProfileRegistrationScreenState();
}

class _ProfileRegistrationScreenState extends State<ProfileRegistrationScreen> {

  int _currentStep = 0;
  bool isLast = false;

  continueStep(){
    if(_currentStep < 2){
      setState(() {
        _currentStep = _currentStep + 1;
        isLast = _currentStep == 2;
      });
    }
  }
  List<Step> stepList() => [
    Step(
        state: _currentStep <= 0 ? StepState?.indexed : StepState.complete,
        isActive: _currentStep >= 0,
        title: Text(""),
        label: Text("Mandatory", style: TextStyle(fontSize: 12)),
        content: BasicInfoScreen(),
    ),
    Step(
      state: _currentStep <= 1 ? StepState?.indexed : StepState.complete,
      isActive: _currentStep >= 1,
      title: Text(""),
      label: Text("Optional", style: TextStyle(fontSize: 12)),
      content: OptionalRegScreen(),
    ),
     Step(
         state: _currentStep <= 2 ? StepState?.indexed : StepState.complete,
         isActive: _currentStep >= 2,
         title: Text(""),
         label: Text("Document", style: TextStyle(fontSize: 12)),
         content: ProfileDocumentScreen()
     )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Profile Registration", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
      ),
      body:Stepper(
        elevation: 0,
        type: StepperType.horizontal,
        currentStep:_currentStep ,
        onStepContinue: continueStep,
        steps: stepList(),

        controlsBuilder: (BuildContext context, ControlsDetails details) {
          if(isLast == false){
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: Colors.grey.shade300,
                  minimumSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
              onPressed: (){
                if(BasicInfoScreenState.checkValidation().isEmpty){
                  BasicInfoScreenState.clearData();
                  continueStep();
                }else{
                  Fluttertoast.showToast(
                      msg: BasicInfoScreenState.checkValidation(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              },
              child: const Text('Next Step >', style: TextStyle(color: Color.fromRGBO(0, 60, 129, 1), fontWeight: FontWeight.bold),),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextButton(
                  onPressed: (){
                    //JobPreviewScreenState.createJob();
                  },
                  child: const Text('Save', style: TextStyle(color: Colors.white),),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
