import 'package:flutter/material.dart';
class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.0),
      backgroundColor: Colors.transparent,

      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
        
          padding: EdgeInsets.only(left:30.0,top: 30.0
             , right: 30.0,bottom: 20.0
          ),
          margin: EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,

              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
           Text("Please add your basic details to complete your profile", textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(0, 60, 129, 1), fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 60, 129, 1),
                  minimumSize: const Size.fromHeight(50), // NEW
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                onPressed: () {



                },
                child: const Text(
                  'Complete now',
                  style: TextStyle(fontSize: 16,
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
