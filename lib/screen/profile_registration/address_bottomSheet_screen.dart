import 'package:flutter/material.dart';

class AddressBottomSheet extends StatefulWidget {
  final String? street;
  final String? city;
  final String? state;
  final String? zipcode;
  const AddressBottomSheet({this.street, this.city, this.state, this.zipcode});

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    streetController.text = widget.street.toString();
    cityController.text = widget.city.toString();
    stateController.text = widget.state.toString();
    zipcodeController.text = widget.zipcode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context, false);
                  },
                  child: Icon(Icons.clear, color: Colors.black,)
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: streetController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Street name/number',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: stateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'State',
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: TextField(
                      controller: zipcodeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Zipcode',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: apartmentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apartment name/number(optional)',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context, true);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context, true);
                      },
                      child: const Text('Save Address', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
