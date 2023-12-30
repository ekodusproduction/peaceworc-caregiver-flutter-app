import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peace_worc/bloc/profile_registration/optional_info_bloc.dart';
import 'package:peace_worc/screen/profile_registration/basic_info.dart';
import 'package:peace_worc/screen/profile_registration/document_screen.dart';
import 'package:peace_worc/screen/profile_registration/optional_reg_screen.dart';
import 'package:peace_worc/screen/settings/document_upload_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../bloc/profile_registration/basic_info_bloc.dart';
import '../../components/document/document_card.dart';
class ProfileRegistrationScreen extends StatefulWidget {
  final int? step;
  const ProfileRegistrationScreen({super.key, this.step});

  @override
  State<ProfileRegistrationScreen> createState() => _ProfileRegistrationScreenState();
}

class _ProfileRegistrationScreenState extends State<ProfileRegistrationScreen> {
  bool isLoading = false;
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

  void addBasicInfo(){
    basicInfoBloc.addBasicInfo(
      BasicInfoScreenState.empFace!,
      BasicInfoScreenState.empCode,
      BasicInfoScreenState.mobileNumberTxt,
      BasicInfoScreenState.dob,
      BasicInfoScreenState.gender,
      BasicInfoScreenState.ssnNumberTxt,
      "${BasicInfoScreenState.street}, ${BasicInfoScreenState.place}, ${BasicInfoScreenState.city}, ${BasicInfoScreenState.state}, USA",
      BasicInfoScreenState.place,
      BasicInfoScreenState.street,
      BasicInfoScreenState.city,
      BasicInfoScreenState.state,
      '12345',
      '',
      '',
      'USA',
    );
  }

  void addOptionalInfo(){
    optionalInfoBloc.optionalInfo(
      OptionalRegScreenState.selectedValue,
      OptionalRegScreenState.experienceTxt,
    );
  }

  void addBasicInfoListener() {
    basicInfoBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          BasicInfoScreenState.clearData();
          continueStep();
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

  void addOptionalInfoListener() {
    optionalInfoBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          OptionalRegScreenState.clearData();
          continueStep();
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
  void initState() {
    addBasicInfoListener();
    addOptionalInfoListener();
    super.initState();
    setState(() {
      _currentStep = widget.step!;
    });
  }

  @override
  void dispose() {
    BasicInfoScreenState.clearData();
    basicInfoBloc.dispose();
    OptionalRegScreenState.clearData();
    optionalInfoBloc.dispose();
    super.dispose();
  }

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
      body:Stack(
        children: [
          Stepper(
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
                    if(_currentStep == 0){
                      if(BasicInfoScreenState.checkValidation().isEmpty){
                        setState(() {
                          isLoading = true;
                        });
                        addBasicInfo();
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
                    }else if(_currentStep == 1){
                      setState(() {
                        isLoading = true;
                      });
                      addOptionalInfo();
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
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                );
              }
            },
          ),
          Visibility(
            visible: isLoading,
              child: Center(child: CircularProgressIndicator(color: Colors.blue.shade800,)))
        ]
      ),
    );
  }
}

