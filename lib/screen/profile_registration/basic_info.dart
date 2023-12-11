import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peace_worc/screen/location/search_location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/validator.dart';
import 'address_bottomSheet_screen.dart';
class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => BasicInfoScreenState();
}

class BasicInfoScreenState extends State<BasicInfoScreen> with AddClientValidationMixin {
  static File? _image;
  final _picker = ImagePicker();
  bool isLoading = false;

  var mobileController = TextEditingController();
  var ssnNumberController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  static String dob = "Select DOB";
  final List<String> items = [
    'Select gender',
    'Male',
    'Female',
    'Other',
  ];
  String? selectedValue;

  static String street = "";
  static String description = "";
  static String place = "";
  static String city = "";
  static String state = "";
  bool isAddressAvail = false;
  static var mobileNumberTxt = "";
  static var ssnNumberTxt = "";
  static var gender = "";

  static String checkValidation(){
    if(_image != null){
      if(!mobileNumberTxt.isEmpty){
        if(!dob.isEmpty){
          if(!gender.isEmpty){
            if(!ssnNumberTxt.isEmpty){
              if(street.isNotEmpty && street != null){
                return "";
              }else{
                return 'Address is required.';
              }
            }else{
              return "Please select a ssn number";
            }
          }else{
            return "Please select a gender";
          }
        }else{
          return "Please select a DOB";
        }
      }else{
        return "Please provide mobile number";
      }
    }else{
      return "Please select a profile picture";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  child: _image != null?
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: Image.file(File(_image!.path)).image,
                      ):
                      Icon(Icons.person, color: Colors.black26, size: 45,),
                ),
                Positioned(
                  top: 0.0,
                  right: 130.0,
                  child: GestureDetector(
                    onTap: (){
                      requestPermission();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.camera_alt_outlined,
                            size: 20.0, color: Colors.black),
                      ),
                    ),
                  ), //Icon
                ),
              ],
            ),
          ),
          TextFormField(
            controller: mobileController,
            onChanged: (content){
              mobileNumberTxt = content;
            },
            cursorColor: Colors.black,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              labelText: "Mobile Number *",
              hintStyle: TextStyle(color: Colors.black, fontSize: 10.0),
              labelStyle: TextStyle(color: Colors.black),
            ),
            maxLength: 10,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if(isNumberValid(value!).length != 0){
                return isNumberValid(value!);
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      _selectDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${dob}", style: TextStyle(color: Colors.black),),
                            Icon(Icons.calendar_month, color: Colors.black,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    //cursorColor: Colors.redAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
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
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: ssnNumberController,
            onChanged: (content){
              ssnNumberTxt = content;
            },
            cursorColor: Colors.black,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              labelText: "SSN Number *",
              hintStyle: TextStyle(color: Colors.black, fontSize: 10.0),
              labelStyle: TextStyle(color: Colors.black),
            ),
            maxLength: 9,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if(isSsnValid(value!).length != 0){
                return isSsnValid(value!);
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              _navigateToSearchLocation(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.search, color: Colors.grey,size: 20,),
                    SizedBox(width: 10,),
                    Text("Search address here...")
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Visibility(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(place, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),),
                    Text(description, style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey[600],
                    ),
                    Text("Street name/number:", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                    Text(street, style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(height: 4,),
                    Text("Apartment name/number:", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                    Text("", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            visible: isAddressAvail,
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date = DateTime.parse(selectedDate.toString());

        var formattedDate = "${date.month}-${date.day}-${date.year}";
        dob = formattedDate;
      });
  }

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void openSettings(){
    openAppSettings();
  }

  Future<void> requestPermission() async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.photos,
    ].request();
    if (statuses[Permission.storage]!.isDenied) {
      // Camera permission is denied
      print("storage permission denied");
    }
    if(statuses[Permission.storage]!.isPermanentlyDenied){
      print("Permanently Denied");
      openSettings();
    }
    if(statuses[Permission.photos]!.isDenied){
      print("Permission Denied for photos ${statuses[Permission.photos]!.isGranted}");
      openSettings();
    }
    if(statuses[Permission.photos]!.isPermanentlyDenied){
      print("Permanently Denied photos");
      openSettings();
    }
    if(Platform.isAndroid){
      if(statuses[Permission.storage]!.isGranted){
        print("permission grantedssss ${statuses[Permission.storage]!.isGranted}");
        _openImagePicker();
        // openSettings();
      }
    }else{
      if(statuses[Permission.photos]!.isGranted){
        print("permission granted for photos ${statuses[Permission.photos]!.isGranted}");
        _openImagePicker();
        // openSettings();
      }
    }
  }

  Future<void> _navigateToSearchLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchLocationScreen()),
    ) as Data;

    if (!mounted) return;

    street = result.street!;
    description = result.description!;
    place = result.place!;
    city = result.city!;
    state = result.state!;

    _navigateToBottomSheet(context, street, city, state);
  }

  Future<void> _navigateToBottomSheet(BuildContext context, String _street, String _city, String _state) async {
    final result = await showModalBottomSheet<void>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AddressBottomSheet(street: _street, city: _city, state: _state, zipcode: "12345",);
      },
    ) as bool;
    setState(() {
      isAddressAvail = result;
    });
  }

}
