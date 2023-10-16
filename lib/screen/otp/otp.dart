import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peace_worc/bloc/otp/otp_bloc.dart';
import 'package:peace_worc/components/toast/customtoast.dart';
import 'package:peace_worc/screen/dashboard/Dashboard.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? data;
String defaultPin = "12345";
late String otp;
  @override
  void initState() {
    // TODO: implement initState
  _listenOtp;
  //_resetLoader();
    super.initState();
  }
   void _listenOtp() async{
     await SmsAutoFill().listenForCode();
     print("OTP Listen is called");
   }

   // void _resetLoader() async{
   //   Timer(Duration(seconds: 10), () {
   //     print("enters herer");
   //     setState(() {
   //       isLoaded = false;
   //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
   //     });
   //   });
   // }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as String?;
    print(data);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 60, 129, 1),
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white, // <-- SEE HERE
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,


        ),
        body:  BlocBuilder<OtpBloc, OtpState>(
  builder: (context, state) {
    if(state is OtpLoadingState){
      return Center(child: CircularProgressIndicator(color: Colors.white,));
    }
    if(state is OtpVerifiedSuccessState){
      _onWidgetDidBuild(() {

        print("pass");
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardScreen()));
      });
    }
    if(state is OtpVerifiedFailureState){
        Toast(message: state.message.toString()).show(context);
    }
    return SingleChildScrollView(
          child: Center(
            child: Column(
                children:[
                  Column(
                    children: [
                      Image.asset("lib/assets/log.png", height: 100, width: 100,),
                      const SizedBox(height: 20,),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 30, top:15.0, right: 20.0, left: 20.0),
                          child: Text("Enter the 6 digits OTP sent to your email", style: TextStyle(color: Colors.white, fontSize: 14),)),
                      Padding(
                        padding: EdgeInsets.only(top:10.0, right: 40.0, left: 40.0, bottom: 10.0),
                        child: PinCodeTextField(
                          keyboardType: TextInputType.number,
                          appContext: context,
                          length: 6,
                          obscureText: false,
                          cursorColor: Colors.white,
                          textStyle: TextStyle(color: Colors.white),
                          animationType: AnimationType.fade,
                          autoFocus: true,


                          pinTheme: PinTheme(
                              activeColor: Colors.white,
                            inactiveColor: Colors.white,
                            shape: PinCodeFieldShape.box,

                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor: Colors.transparent,
                            inactiveFillColor: Colors.transparent,
                              selectedColor: Colors.white,
                              selectedFillColor: Colors.transparent
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.transparent,
                          enableActiveFill: true,
                          // errorAnimationController: errorController,
                           controller: TextEditingController(text: defaultPin),
                          onCompleted: (v) {
                            print("Completed${v}");
                            setState(() {
                              otp = v;
                            });
                          },
                          onChanged: (value) {
                            print(value);
                            // setState(() {
                            //   currentText = value;
                            // });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      )

                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top:10.0, left: 20.0, right: 20.0, bottom: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Resend", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0),)
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50), // NEW
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      onPressed: ()  {

                        BlocProvider.of<OtpBloc>(context).add(
                            OtpButtonClickEvent(
                              email: data!,
                              otp: otp!
                                ));

                      },
                      child: const Text(
                        'Verify OTP',
                        style: TextStyle(fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        );
  },
),
      ),
    );
  }


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });

  }
}
