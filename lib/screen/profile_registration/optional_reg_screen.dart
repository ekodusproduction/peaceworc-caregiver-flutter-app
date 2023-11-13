import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../components/my_textfield.dart';

class OptionalRegScreen extends StatefulWidget {
  const OptionalRegScreen({super.key});

  @override
  State<OptionalRegScreen> createState() => _OptionalRegScreenState();
}

class _OptionalRegScreenState extends State<OptionalRegScreen> {
  final experienceController = TextEditingController();
  final List<String> items = [
    'Select job type',
    'Full time',
    'Part time'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 140,
                  ),
                  menuItemStyleData: const MenuItemStyleData(height: 40,),
                ),
              ),
              Divider(height: 1,color: Colors.black),
              TextFormField(
                controller: experienceController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Caregiver experience (years)',
                  labelStyle: TextStyle(color: Colors.black),
                  errorMaxLines: 3,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Divider(height: 1,color: Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
