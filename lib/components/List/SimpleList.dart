import 'package:flutter/material.dart';
class SimpleList extends StatelessWidget {
  const SimpleList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.work),
        Text('Build the row containing these columns by calling the function '),
      ],
    );
  }
}
