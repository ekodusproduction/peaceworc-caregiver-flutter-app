import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/profile/profile_details_bloc.dart';
import '../../components/my_textfield.dart';

class OptionalRegScreen extends StatefulWidget {
  const OptionalRegScreen({super.key});

  @override
  State<OptionalRegScreen> createState() => OptionalRegScreenState();
}

class OptionalRegScreenState extends State<OptionalRegScreen> {
  final experienceController = TextEditingController();
  final List<String> items = [
    'Select job type',
    'Full time',
    'Part time'
  ];
  static String? selectedValue;
  static var experienceTxt = "";

  static void clearData(){
    selectedValue = null;
    experienceTxt = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select job type',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )).toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    width: 200,
                  ),
                  menuItemStyleData: const MenuItemStyleData(height: 40,),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Divider(height: 1,color: Colors.black),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextFormField(
              controller: experienceController,
              onChanged: (content){
                experienceTxt = content;
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Caregiver experience (years)',
                labelStyle: TextStyle(color: Colors.black),
                errorMaxLines: 3,
              ),
              keyboardType: TextInputType.number,
              maxLength: 2,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ],
      ),
    );
  }
}
