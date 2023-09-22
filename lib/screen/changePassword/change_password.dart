import 'package:flutter/material.dart';
import 'dart:io';
class ChangePasswordScreen extends StatefulWidget {

  ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late  bool passwordVisible=true;
  late bool confirmPasswodVisible = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Change Password", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
      ),
      body: Column(
       children: [
         Padding(
           padding: EdgeInsets.only(top:20, right: 10,left: 10),
           child: TextFormField(
             cursorColor: Colors.black,
             maxLength: 12,
             style: const TextStyle(
                 color: Colors.black
             ),
             controller: oldPasswordController,
             obscureText: passwordVisible,
             decoration: InputDecoration(
               border: const OutlineInputBorder(
                   borderSide: BorderSide(
                       color: Colors.black
                   )
               ),

               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                     color: Colors.black), //<-- SEE HERE
               ),
               focusedBorder: const OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.black),
               ),
               labelText: " Old Password *",
               labelStyle: const TextStyle(color: Colors.black),
               floatingLabelBehavior: FloatingLabelBehavior.auto,

               hintStyle: const TextStyle(color: Colors.black, fontSize: 10.0),

               suffixIcon: IconButton(
                 icon: Icon(
                     passwordVisible ? Icons.visibility
                         : Icons.visibility_off),
                 color: Colors.black,
                 onPressed: () {

                   setState(
                         () {
                       passwordVisible = !passwordVisible;
                     },
                   );
                 },
               ),

             ),
             validator: (String? value) {
               if (value == null || value == '') {
                 return 'Enter Current Password';
               }
               return null;
             },
             autovalidateMode: AutovalidateMode.onUserInteraction,
           ),
         ),
         Padding(
           padding: EdgeInsets.only(top:20, right: 10,left: 10),
           child: TextFormField(
             cursorColor: Colors.black,
             maxLength: 12,
             style: const TextStyle(
                 color: Colors.black
             ),
             controller: newPasswordController,
             obscureText: passwordVisible,
             decoration: InputDecoration(
               border: const OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.black
                 )
               ),

               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                    color: Colors.black), //<-- SEE HERE
               ),
               focusedBorder: const OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.black),
               ),
               labelText: " Current Password *",
                labelStyle: const TextStyle(color: Colors.black),
               floatingLabelBehavior: FloatingLabelBehavior.auto,

               hintStyle: const TextStyle(color: Colors.black, fontSize: 10.0),

               suffixIcon: IconButton(
                 icon: Icon(
                     passwordVisible ? Icons.visibility
                         : Icons.visibility_off),
                 color: Colors.black,
                 onPressed: () {

                   setState(
                         () {
                       passwordVisible = !passwordVisible;
                     },
                   );
                 },
               ),

             ),
             validator: (String? value) {
               if (value == null || value == '') {
                 return 'Enter New Password';
               }else if(value.length < 6){
                 return 'Minimum 6 characters required';
               }
               return null;
             },
             autovalidateMode: AutovalidateMode.onUserInteraction,
           ),
         ),
         Padding(
           padding: EdgeInsets.only(top:20, right: 10,left: 10),
           child: TextFormField(
             cursorColor: Colors.black,
             maxLength: 12,
             style: const TextStyle(
                 color: Colors.black
             ),
             controller: confirmPasswordController,
             obscureText: passwordVisible,
             decoration: InputDecoration(
               border: const OutlineInputBorder(
                   borderSide: BorderSide(
                       color: Colors.black
                   )
               ),

               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                     color: Colors.black), //<-- SEE HERE
               ),
               focusedBorder: const OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.black),
               ),
               labelText: " Confirm Password *",
               labelStyle: const TextStyle(color: Colors.black),
               floatingLabelBehavior: FloatingLabelBehavior.auto,

               hintStyle: const TextStyle(color: Colors.black, fontSize: 10.0),

               suffixIcon: IconButton(
                 icon: Icon(
                     passwordVisible ? Icons.visibility
                         : Icons.visibility_off),
                 color: Colors.black,
                 onPressed: () {

                   setState(
                         () {
                       passwordVisible = !passwordVisible;
                     },
                   );
                 },
               ),

             ),
             validator: (String? value) {
               if (value == null || value == '') {
                 return 'Enter Confirm Password';
               }else if(value != newPasswordController.text){
                 return 'Password mismatch with the new password';
               }
               return null;
             },
             autovalidateMode: AutovalidateMode.onUserInteraction,
           ),
         ),

         Expanded(
           child: Align(
             alignment: Alignment.bottomCenter,
             child: Padding(
               padding: EdgeInsets.only(right:10.0, left:10.0, bottom: Platform.isIOS ? 20.0 : 10.0),
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Color.fromRGBO(0, 60, 129, 1),
                   minimumSize: const Size.fromHeight(55), // NEW
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5.0)
                   ),
                 ),
                 onPressed: () {
                   final snackBar = SnackBar(
                     content: const Text('Yay! A SnackBar!'),
                     action: SnackBarAction(
                       label: 'Undo',
                       onPressed: () {
                         // Some code to undo the change.
                       },
                     ),
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 },
                 child: const Text(
                   'Update',
                   style: TextStyle(fontSize: 20,
                       color: Colors.white, fontWeight: FontWeight.bold),
                 ),
               ),
             ),
           ),
         ),
       ],
      ),
    );
  }
}
