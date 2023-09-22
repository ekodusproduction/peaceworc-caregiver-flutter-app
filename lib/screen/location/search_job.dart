import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class SearchJobScreen extends StatefulWidget {
  const SearchJobScreen({super.key});

  @override
  State<SearchJobScreen> createState() => _SearchJobScreenState();
}

class _SearchJobScreenState extends State<SearchJobScreen> {
  final List<String> items = [
    'Select job type',
    'Senior Care',
    'Child Care',
    'Patient Care',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black,),
        title: Text("Search Job", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
                children: [
        Expanded(
          child: DropdownButtonHideUnderline(
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
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
    ),
        ),

                ],
              ),

            Text("Remittance Range", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
            Row(
              children: [
                Expanded(child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Colors.black
                  ),

                  obscureText: false,
                  decoration: InputDecoration(
                    prefix: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("\$", style: TextStyle(color: Colors.black, fontSize: 18),),
                    ),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),



                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: "From",
                    labelStyle: const TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,

                    hintStyle: const TextStyle(color: Colors.black, fontSize: 10.0),



                  ),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return 'Required';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                )),
                SizedBox(width: 10.0,),
                Expanded(child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Colors.black
                  ),

                  obscureText: false,
                  decoration: InputDecoration(
                    prefix: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("\$", style: TextStyle(color: Colors.black, fontSize: 18),),
                    ),
                    border: const OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Colors.transparent
                        ),

                    ),



                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: "To",
                    labelStyle: const TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,

                    hintStyle: const TextStyle(color: Colors.black, fontSize: 10.0),



                  ),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return 'Required';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ))
              ],
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(right:10.0, left:10.0, bottom : 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 60, 129, 1),
                      minimumSize: const Size.fromHeight(50), // NEW
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
                      'Search Job',
                      style: TextStyle(fontSize: 16,
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
