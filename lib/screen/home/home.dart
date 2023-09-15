import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peace_worc/components/card/job_card_item.dart';
import 'package:peace_worc/components/card/quick_call.dart';

import '../../components/card/highlight_card.dart';
import '../jobs/job_detail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool _stretch = true;
  Color appBarColor = Colors.transparent;
  double appBarElevatation = 0.0;
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  String message = "";
  List pages = ['Home', 'About', 'Careers', 'Contact Us', 'Blog', 'Disclaimer'];
  int _cIndex = 0;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_scrollController.offset >= 320) {
      setState(() {
        appBarColor = Colors.white ;
        appBarElevatation = 5.0;
         message = "reach the bottom";
         print(message);
      });
    }
    if (_scrollController.offset <= 320) {
      setState(() {
        appBarElevatation = 0.0;
        appBarColor = Colors.transparent ;
        message = "reach the top";
        print(message);
      });
    }
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
    elevation: 0.0,
        bottomOpacity: appBarElevatation,
        scrolledUnderElevation: 0,
        backgroundColor: appBarColor,
        title: Padding(
          padding: EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 Expanded(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       IconButton(

                         icon: Image.asset('lib/assets/test.png', ),
                         iconSize: 150,

                         onPressed: () => exit(0),
                       )
                     ],
                   ),
                 ),
              Icon(
                Icons.message,
                size: 30.0,
                color: Color.fromRGBO(0, 60, 129, 1),
              ),
            ],
          ),
        ),
      ),
      body:  NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            elevation: 0,
            expandedHeight: 340.0,
            floating: false,
            pinned: true,

            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(

              background: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0,),
            Container(
              margin: EdgeInsets.only(top:20, left:10, right:10, bottom: 30),
              child: const Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: HighLightCard(flavorColor: Colors.black, name: 'Jobs', iconName: Icons.work, imageName: "case.png",)),
                  Expanded(child: HighLightCard(flavorColor: Colors.black, name: 'Rewards', iconName: Icons.currency_bitcoin, imageName: "earnings.png",)),
                  Expanded(child: HighLightCard(flavorColor: Colors.black, name: 'Strikes', iconName: Icons.handshake, imageName: "ad-block.png",)),
                  Expanded(child: HighLightCard(flavorColor: Colors.black, name: 'Earnings', iconName: Icons.currency_bitcoin, imageName: "medal.png",))

                ],
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 15.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Open Jobs", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                    GestureDetector(child: const Text("See All", style: TextStyle(color: Colors.lightBlueAccent,  fontSize: 13),)

                    )
                  ],
                ),
              ),
            ),


            SizedBox(
              width: double.infinity,
              height: 250,

              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: pages.length,
                  itemBuilder: (context, index){
                    return Container(
                      width: 350,
                      margin: EdgeInsets.only(
                        left: index == 0 ?10: 15,
                        right: index == 10 -1 ? 30: 0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Color(0xffDDDDDD),
                        //     blurRadius: 6.0,
                        //     spreadRadius: 2.0,
                        //     offset: Offset(0.0, 0.0),
                        //   ),
                        // ],
                      ),

                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey[200],
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 5.0, bottom: 5.0),
                                      child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.orange
                                          ),
                                          child: const Icon(Icons.work, size: 30.0,))
                                  ),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          "Ekodustech",
                                          style: TextStyle(color: Colors.black,  fontSize: 12.0),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "New Test Job",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Icon(Icons.person_outline, size: 15,),
                                              const SizedBox(width: 5,),
                                              const Text("Child Care", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,),
                                              Icon(Icons.do_not_disturb_on_total_silence, color: Colors.grey[800],size: 4,),
                                              const Text("Tulip, Female: 56 Yrs", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,)
                                            ],
                                          ),
                                          const SizedBox(height: 7,),
                                          const Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.location_on_outlined, size: 15,),
                                              SizedBox(width: 5,),
                                              Expanded(
                                                child: Text(
                                                  "3087 Terminal gswqhjx jfuydqwvx  uqwskqx qjxfuwxjhqsx",
                                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 7,),
                                          const Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.calendar_month_outlined, size: 15,),
                                              SizedBox(width: 5,),
                                              Text("2023-09-01", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black), maxLines: 1,),
                                              SizedBox(width: 15,),
                                              Text("7:28PM - 9:40PM", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black), maxLines: 1,),
                                            ],
                                          ),
                                          const SizedBox(height: 10,),

                                          const SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: Column(
                                        children: [
                                          Text("Rewards", style: TextStyle(color: Colors.black),),
                                          Icon(
                                            Icons.add_alarm, size: 30,
                                          )
                                        ],
                                      ),
                                    )
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 15.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Quick Calls", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                    GestureDetector(child: const Text("See All", style: TextStyle(color: Colors.lightBlueAccent,  fontSize: 13),)

                    )
                  ],
                ),
              ),
            ),
            QuickCallCard(jobName: "Test Job", onTap: ()=>{
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          JobDetail()))
            },)


          ],
        ),
      ),
      ),



    );

  }
}
