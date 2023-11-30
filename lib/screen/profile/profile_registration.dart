import 'package:flutter/material.dart';
import 'package:peace_worc/screen/profile/basic_info.dart';
import 'package:peace_worc/screen/profile_registration/document_screen.dart';
import 'package:peace_worc/screen/profile_registration/optional_reg_screen.dart';

import '../../components/document/document_card.dart';
class ProfileRegistrationScreen extends StatefulWidget {
  const ProfileRegistrationScreen({super.key});

  @override
  State<ProfileRegistrationScreen> createState() => _ProfileRegistrationScreenState();
}

class _ProfileRegistrationScreenState extends State<ProfileRegistrationScreen> {

  int _currentStep = 0;

  continueStep(){
    if(_currentStep < 2){
      setState(() {
        _currentStep = _currentStep + 1;
      });
    }
  }
  List<Step> stepList() => [
     Step(
      state: _currentStep <= 0 ? StepState?.indexed : StepState.complete,
      isActive: _currentStep >= 0,
      title: Text(''), label: Text("Basic"), content: BasicInfoScreen()),

     Step(
         state: _currentStep <= 1 ? StepState?.indexed : StepState.complete,
         isActive: _currentStep >= 1,
         title: Text(''), label: Text("Optional"), content: OptionalRegScreen()),
     Step(
         state: _currentStep <= 2 ? StepState?.indexed : StepState.complete,
         isActive: _currentStep >= 2,
         title: Text(''), label: Text("Document"), content: ProfileDocumentScreen())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Profile Registration", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
      ),
      body:Stepper(

        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                )
            ),
            onPressed: continueStep,
            child: const Text('Next Step', style: TextStyle(color: Color.fromRGBO(0, 60, 129, 1), fontWeight: FontWeight.bold),),
          );
        },
        currentStep:_currentStep ,
        onStepContinue: continueStep,
        type: StepperType.horizontal,
        steps: stepList(),
      ),
    );
  }
}
