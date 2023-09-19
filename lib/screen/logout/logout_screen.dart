import 'package:flutter/material.dart';
class Logout extends StatelessWidget {
  final Function()? onYesTap;
  final Function()? onNoTap;
  const Logout({super.key, this.onNoTap, this.onYesTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      insetPadding: EdgeInsets.symmetric(vertical: 8.0),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only( right: 10),
              child: Icon(Icons.logout, color: Colors.black, size: 30,)),
          Text("Logout", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)
        ],
      ),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Do you want to exit the app?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('No'),
          onPressed: onNoTap
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: onYesTap,
        ),
      ],
    );
  }
}
