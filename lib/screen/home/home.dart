import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peace_worc/components/card/job_card_item.dart';
import 'package:peace_worc/components/card/quick_call.dart';
import 'package:peace_worc/screen/jobs/open_job_detail.dart';

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
        appBarElevatation = 20;
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
                size: 40.0,
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
           collapsedHeight: 70,
            backgroundColor: Colors.transparent,

            flexibleSpace: FlexibleSpaceBar(
              title: SizedBox(height: 0.0,),
              titlePadding: EdgeInsets.zero,
              background: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                  ),
                  Positioned(
                      top:130,
                      left: 15,
                    right: 15,
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200],

                          ),


                    child: Padding(
                        padding: EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.search, size: 30, color: Colors.grey[500],),
                            Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.grey[300],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.location_on_outlined, size: 20,),
                                    Text("Guwahati", style: TextStyle(color: Colors.black, fontSize: 14),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                    ),
                  ),
                      ))
                ],
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
                    return JobCardItem(index: index, onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OpenJobDetailScreen()));
                    },);
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
