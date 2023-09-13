import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final bool isSuffixIconVisible;
  final bool passwordVisible;
  const MyTextField({super.key,

  required this.controller,
  required this.hintText,
  required this.obscureText,
    this.onChanged, // Optional callback
     this.isSuffixIconVisible = false,
    this.passwordVisible = false,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        color: Colors.transparent,
        child: TextField(
            cursorColor: Colors.white,
            style: const TextStyle(

              color: Colors.white
            ),
          onChanged:onChanged,

          controller: controller,

          obscureText: obscureText,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              labelStyle: const TextStyle(color: Colors.white),

                suffixIcon: isSuffixIconVisible ? IconButton(
                  icon: Icon(
                      passwordVisible ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {

                  },
                ): null,

            ),

          ),
      ),
    );
  }
}