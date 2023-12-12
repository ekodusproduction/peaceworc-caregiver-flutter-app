import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../screen/profile_registration/profile_registration.dart';

class ProfileCompletionDialog extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? buttonText;
  final int? step;
  const ProfileCompletionDialog({super.key, this.title, this.buttonText, this.step, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      insetPadding: EdgeInsets.symmetric(vertical: 8.0),
      content:  SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(title!!),
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: TextButton(
                  onPressed: (){
                    if(step == 4){
                      Navigator.of(context).pop();
                    }else{
                      Navigator.of(context).pop();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileRegistrationScreen(step: step,)));
                    }
                  },
                  child: Text(buttonText!!, style: TextStyle(color: Colors.white),),
                ),
            ),
        )
      ],
    );
  }
}
