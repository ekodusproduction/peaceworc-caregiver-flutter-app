import 'package:flutter/material.dart';
class AddBioDetailsScreen extends StatefulWidget {
  const AddBioDetailsScreen({super.key});

  @override
  State<AddBioDetailsScreen> createState() => _AddBioDetailsScreenState();
}

class _AddBioDetailsScreenState extends State<AddBioDetailsScreen> {
  final bioController = TextEditingController();
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
                  Text("Edit Bio", style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),)
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
              maxLines: 8,

              style: const TextStyle(
                  color: Colors.black
              ),
              controller: bioController,
              obscureText: false,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent
                    )
                ),



                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "Bio",
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
                    'Update My Bio',
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
