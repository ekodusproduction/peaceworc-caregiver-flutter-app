import 'package:flutter/material.dart';
import 'package:peace_worc/components/customDialog/custom_dialog.dart';
class LocationAssist extends StatefulWidget {
  const LocationAssist({super.key});

  @override
  State<LocationAssist> createState() => _LocationAssistState();
}

class _LocationAssistState extends State<LocationAssist> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 60, 129, 1),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,


          child: Padding(
            padding: EdgeInsets.only(right: 15.0, left: 15.0),
            child: Column(

              children: [

                SizedBox(height: 30,),
                Center(

                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Image.asset("lib/assets/log.png",  height: 100.0,
                        width: 100.0,),

                      Text("Peaceworc", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                      SizedBox(height: 50,),
                      Text("Hello, I am happy to assist you", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Let's ping your location to find the jobs closest to you.", style: TextStyle(color: Colors.white, fontSize: 14),)
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(60), // NEW
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  onPressed: () {

                    showDialog(context: context, builder: (BuildContext buildcontext){
                      return CustomDialog();
                    });

                  },
                  child: const Text(
                    'Use Current Location',
                    style: TextStyle(fontSize: 18,
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15.0,),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Your location is only accessible to Peacworc when you're on a job, or you've made yourself available for jobs."
                        " your privacy is very important to us. Set your location manually",
                    textAlign: TextAlign.center,

                    style: TextStyle(fontSize: 13, height: 1.2,
                      color: Colors.white, ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
