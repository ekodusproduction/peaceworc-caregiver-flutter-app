import 'package:flutter/material.dart';
class AddBasicInformationScreen extends StatefulWidget {
  final String? phoneNumner;
  final String? experience;
  const AddBasicInformationScreen({super.key, required this.phoneNumner, required this.experience});

  @override
  State<AddBasicInformationScreen> createState() => _AddBasicInformationScreenState();
}

class _AddBasicInformationScreenState extends State<AddBasicInformationScreen> {
  final phoneNumberController = TextEditingController();
  final experienceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    phoneNumberController.text = widget.phoneNumner!;
    experienceController.text = widget.experience!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Edit Basic Information", style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); //close Dialog
              },
              child: Icon(
                Icons.close,
                size: 30.0,
                color: Color.fromRGBO(0, 60, 129, 1),

              ),
            ),
          ],
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15, right: 20.0, left: 20.0),
            child: TextFormField(
              cursorColor: Colors.black,

              style: const TextStyle(
                  color: Colors.black
              ),
              controller: phoneNumberController,
              obscureText: false,
              decoration: InputDecoration(
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
                labelText: "Phone number",
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
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:15, right: 20.0, left: 20.0),
            child: TextFormField(
              cursorColor: Colors.black,

              style: const TextStyle(
                  color: Colors.black
              ),
              controller: experienceController,
              obscureText: false,
              decoration: InputDecoration(
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
                labelText: "Experience",
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
            ),
          ),


          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(right:15.0, left:15.0, bottom : 10.0),
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
                    'Update',
                    style: TextStyle(fontSize: 16,
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
