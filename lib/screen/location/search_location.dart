import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:peace_worc/components/List/location_list_title.dart';
import 'package:peace_worc/screen/location/location_assist.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController controller = TextEditingController();

  var uuid = Uuid();
  String _sessionToken = "12344";
  String placeApiKey = "AIzaSyAeOdrrTE5shsq875mLaIYsDesJoXwmGXI";
  List<dynamic> _placesList = [];
  //late Data data;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange(){
    if(_sessionToken == null){
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async{
    var kPLACES_API_KEY = placeApiKey;
    String baseURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();

    print('data');
    print(data);
    if(response.statusCode == 200){
      setState(() {
        _placesList = jsonDecode(response.body.toString()) ['predictions'];
      });
    }else{
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation:0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            child: Icon(Icons.location_on_outlined, size: 18, color: Colors.grey[800],),
            backgroundColor: Colors.grey[200],
          ),
        ),
        title: Text("Set Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.clear, size: 24, color: Colors.grey[800],),
                backgroundColor: Colors.grey[200],
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            placeApiWidgetTwo(context),
            SizedBox(height: 20,),
            Center(child: Text("Or", style: TextStyle(color: Colors.black87, fontSize: 18),)),
            Padding(
              padding: EdgeInsets.only(top:15),
              child: InkWell(
                onTap: () async{
                 var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationAssist())) as LocationModel?;
                 if (!mounted) return;
                 if(result != null){
                   print('search loc => $result');
                   Navigator.pop(context,result);
                 }
                },
                child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_searching_rounded, color: Colors.black, size: 20,),
                    SizedBox(width: 10,),
                    Text("Use Your current location", style: TextStyle(color: Colors.black87, fontSize: 18))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  placeApiWidgetOne(){
    return Column(
      children: [
        Form(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  hintText: "Search your address",
                  contentPadding:
                  EdgeInsets.only(left: 10.0,right: 40.0, top: 10.0, bottom: 10.0),
                  prefixIcon: Icon(Icons.gps_fixed_outlined),
                ),
              ),
            )
        ),
        Divider(
          height: 4,
          thickness: 4,
          color: Colors.grey[200],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: _placesList.length.toInt(),
                itemBuilder: (context, index){
                  return LocationListTile(
                      press: () async {
                      //  List<Location> locations = await locationFromAddress(_placesList[index]['description']);
                        /*print("lat => ${locations.last.latitude}");
                          print("long => ${locations.last.longitude}");*/
                        print("data to be printed");
                        print(_placesList[index]);
                      },
                      location: _placesList[index]['description']
                  );
                }
            )
        ),
      ],
    );
  }

  placeApiWidgetTwo(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: controller,
        googleAPIKey: placeApiKey,
        inputDecoration: InputDecoration(
          hintText: "Search your location",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: ["us"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: (Prediction prediction) {
          print("placeDetails => " + prediction.toJson().toString());

          final data = Data(
            lat : prediction.lat.toString(),
            long: prediction.lng.toString(),
            street: prediction.structuredFormatting?.mainText.toString() ?? "No Data",
            description: prediction.description.toString(),
            city: prediction.terms?[2].value.toString(),
            state: prediction.terms?[3].value.toString(),
            place: prediction.terms?[1].value.toString(),
          );
          Navigator.pop(context, data);
          //Navigator.of(context).pop();
        },

        itemClick: (Prediction prediction) {
          controller.text = prediction.description ?? "";
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
        },
        seperatedBuilder: Divider(),
        // OPTIONAL// If you want to customize list view item builder
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 7,
                ),
                Expanded(child: Text("${prediction.description??""}"))
              ],
            ),
          );
        },
        isCrossBtnShown: true,
        // default 600 ms ,
      ),
    );
  }
}

class Data {
  String? lat;
  String? long;
  String? street;
  String? description;
  String? city;
  String? state;
  String? place;
  Data({this.lat, this.long, this.street, this.description, this.city, this.state, this.place});
}
