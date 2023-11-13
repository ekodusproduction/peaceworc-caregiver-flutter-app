import 'dart:async';
import 'package:flutter/material.dart';
import 'package:peace_worc/hive/hive_init.dart';
import 'package:peace_worc/model/login/login.dart';
import 'package:peace_worc/screen/login/login.dart';
import 'package:peace_worc/screen/signup/signup.dart';
import '../dashboard/Dashboard.dart';
class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>{
              if(getToken() == null){
                // Navigator.pop(context),
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) =>
                    const LoginPage()
                    )
                )
              }
              else if(getToken() != null){
                // Navigator.pop(context),
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) =>
                    const DashboardScreen()
                    )
                )
              }
            }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
         color: Color.fromRGBO(0, 60, 129, 1)
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    "lib/assets/log.png",
                    height: 100.0,
                    width: 100.0,
                  ),
                const Text("Peaceworc Caregiver", style: TextStyle(color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold),)
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}

