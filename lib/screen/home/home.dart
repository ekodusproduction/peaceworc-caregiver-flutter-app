import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peace_worc/bloc/job/job_bloc.dart';
import 'package:peace_worc/bloc/profile/new_get_profile_bloc.dart';
import 'package:peace_worc/components/card/job_card_item.dart';
import 'package:peace_worc/components/card/quick_call.dart';
import 'package:peace_worc/components/card/quick_call_test_card.dart';
import 'package:peace_worc/components/customDialog/profile_completion_dialog.dart';
import 'package:peace_worc/hive/hive_init.dart';
import 'package:peace_worc/screen/jobs/jobs.dart';
import 'package:peace_worc/screen/jobs/open_job_detail.dart';
import 'package:peace_worc/screen/location/location_assist.dart';
import 'package:peace_worc/screen/location/search_job.dart';
import 'package:peace_worc/screen/location/search_location.dart';
import 'package:peace_worc/screen/profile_registration/profile_registration.dart';
import 'package:peace_worc/screen/settings/strike_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../bloc/profile/profile_details_bloc.dart';
import '../../components/card/highlight_card.dart';
import '../../model/job/bid_job_response.dart';
import '../../model/profile/profile_details_model.dart';
import '../jobs/job_detail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:vector_math/vector_math.dart'as vm;

import '../logout/logout_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream<int> getSecondsFromCurrentMinute() async* {
    final now = DateTime.now();
    final seconds = now.second;
    yield seconds;
    await Future.delayed(Duration(seconds: 1 - seconds));
    yield* getSecondsFromCurrentMinute();
  }
  bool returnedFromDetailPage = false;
  late ScrollController _scrollController;
  bool _stretch = true;
  Color appBarColor = Colors.transparent;
  double appBarElevatation = 0.0;
  late gm.GoogleMapController mapController;
   gm.LatLng _center = const gm.LatLng(45.521563, -122.677433);
  String message = "";
  List pages = ['Home', 'About', 'Careers', 'Contact Us', 'Blog', 'Disclaimer'];
  int _cIndex = 0;
  String locality = '';
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }
  void _onMapCreated(gm.GoogleMapController controller) {
    mapController = controller;
  }
  String profileStatus = "Please complete your caregiver profile to accept job.";

  late AnimationController controller;
  bool isLoading = false;
  bool flag1 = false;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(_scrollListener);
    print("userId${getUserId()}");
    locality = getLocation().toString();
    super.initState();
    print("called on press back");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<JobBloc>(context).add(FetchQuickCallJobEvent());
    });
    getProfileListener();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (returnedFromDetailPage) {
      BlocProvider.of<JobBloc>(context).add(FetchQuickCallJobEvent());
      returnedFromDetailPage = false; // Reset the flag
    }
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

  void getProfileListener() {
    setState(() {
      isLoading = true;
    });
    getProfileBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          if(flag1 == true){
            if(value.data?.profileCompletionStatus?.isBasicInfoAdded == 0){
              _showAlertDialog("Please add your basic details to complete your profile","Complete now", 0);
            }
            else if(value.data?.profileCompletionStatus?.isDocumentsUploaded == 0){

              if(value.data?.profileCompletionStatus?.isOptionalInfoAdded == 0){
                _showAlertDialog("Please complete your profile","Complete now", 1);
              }else{
                _showAlertDialog("Please add your documents to complete your profile","Complete now", 2);
              }
            }else if(value.data?.profileCompletionStatus?.isProfileApproved == 0){
              _showAlertDialog("Your profile is under review. It will take 24 to 48 hours to get the approval.","Ok", 4);
            }
          }

        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value.error.toString()),
        ));
      }
    });
  }

  @override
  void dispose() {
    getProfileBloc.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  Set<gm.Marker> marker = {};
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
          padding: const EdgeInsets.all(0.0),
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
              const Icon(
                Icons.message,
                size: 40.0,
                color: Color.fromRGBO(0, 60, 129, 1),
              ),
            ],
          ),
        ),
      ),
      body:  NestedScrollView(
        physics: BouncingScrollPhysics(),
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: null,
            elevation: 0,
            expandedHeight: 340.0,
            floating: false,
            pinned: true,
           collapsedHeight: 60,
            backgroundColor: Colors.transparent,

            flexibleSpace: LayoutBuilder(
              builder: (context, constraints){
                return FlexibleSpaceBar(
                  title:null,
                  titlePadding: EdgeInsets.zero,
                  background: Stack(
                    children: [
                      Flex(
                        direction: Axis.vertical,
                        children:[
                          Expanded(
                            child: gm.GoogleMap(
                              myLocationEnabled: true,
                              zoomControlsEnabled: true,
                              zoomGesturesEnabled: true,
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: gm.CameraPosition(

                                target: _center,
                                zoom: 11.0,
                              ),
                              markers: marker,
                            ),
                          )
                        ] ,
                      ),
                      Positioned(
                          top:95,
                          left: 15,
                          right: 15,
                          child: Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,

                              ),


                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: (){
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) => Dialog.fullscreen(
                                              insetAnimationCurve: Curves.easeInOut,
                                              child: SearchJobScreen(),
                                            ),
                                          );
                                        },
                                        child: Icon(Icons.search, size: 30, color: Colors.grey[400],)),
                                    InkWell(
                                      onTap: () async {
                                        var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchLocationScreen())) as LocationModel?;
                                        if(!mounted) return;
                                        if(result != null){
                                          print("home page => ${result.lat}");
                                          final double bearing = getBearing(gm.LatLng(45.521563, -122.677433), gm.LatLng(result.lat, result.long));
                                          mapController.animateCamera(gm.CameraUpdate.newCameraPosition(gm.CameraPosition(target: gm.LatLng(result.lat, result.long), zoom: 14)));
                                          marker.clear();
                                          marker.add(gm.Marker(markerId: const gm.MarkerId('currentLocation'), position: gm.LatLng(result.lat, result.long), flat: true,

                                              rotation: bearing,

                                              draggable: false));
                                          saveLocation(result.locality);
                                          setState(() {
                                            locality = result.locality!;

                                          });
                                        }
                                      },
                                      child: Container(

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7.0),
                                          color: Colors.grey[200],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.location_on_outlined, size: 18,),
                                              Text(locality, style: TextStyle(color: Colors.black, fontSize: 12),)
                                            ],
                                          ),
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
                );
        }

            ),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:15, left:10, right:10, bottom: 30),
              child:  Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: HighLightCard(flavorColor: Colors.black, name: 'Jobs', iconName: Icons.work, imageName: "case.png", onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobsScreen()));
                  },)),
                  Expanded(child: HighLightCard(flavorColor: Colors.black, name: 'Rewards', iconName: Icons.currency_bitcoin, imageName: "earnings.png",)),
                  Expanded(child: HighLightCard(flavorColor: Colors.black, name: 'Strikes', iconName: Icons.handshake, imageName: "ad-block.png",  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StrikeScreen(fromMainScreen: true,)));
                  },)),
                  Expanded(child: HighLightCard(flavorColor: Colors.black, name: 'Earnings', iconName: Icons.currency_bitcoin, imageName: "medal.png",))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: GestureDetector(
                onTap: () async {
                  await getProfileBloc.getProfile();
                  setState(() {
                    flag1 = true;
                  });
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.yellow[700],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "lib/assets/medical.png",
                        height: 170.0,
                        width: 170.0,
                      ),
                      Flexible(child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text(profileStatus, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),)),
                            SizedBox(height: 10.0),
                            LinearProgressIndicator(
                              value: 20.00,
                              semanticsLabel: 'Linear progress indicator',
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<JobBloc, JobState>(
              builder: (context, state) {
                if( state is QuickCallLoadingState){
                  return Skeletonizer(
                      child: Column(
                        children: [
                          _quickCallHeader(),
                          SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return JobCardItem(index: index);
                              },
                            ),
                          )
                        ],
                      )
                  );
                }
                if(state is QuickCallSuccessState){
                  print("successState");
                 // print(state.bidJobResponse.data.)
                  if(state.bidJobResponse.data!.isEmpty){
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      _quickCallHeader(),
                      SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: _listItem(false, state.bidJobResponse)

                      )
                    ],
                  );


                }
                return SizedBox.shrink();

              },
            ),
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

            ListView.builder(
              padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index){
                  return JobCardItem(index: index, onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OpenJobDetailScreen()));
                  },);
              },
            )   ,         //const SizedBox(height: 10.0,),
          ],
        ),
      ),
      ),



    );

  }
  Widget _listItem(loadingState, BidJobResponse bidJobResponse){
    return Skeletonizer(
      enabled: loadingState,
      child:ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: pages.length,
          itemBuilder: (context, index){
            return  QuickCallCard(bidJobResponse: bidJobResponse, onTap: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          JobDetail(id: bidJobResponse!.data?[0]!.jobId!,))

             );

              // if (!mounted) return;
              // print("reesult ${result}");
              // if(result != null){
              //   if (result == 'quickDetailPage') {
              //     print("passed");
              //
              //     // Future.delayed(Duration.zero, () {
              //     //   BlocProvider.of<JobBloc>(context).add(FetchQuickCallJobEvent());
              //     // });
              //   }
              // }


            },);

          }),
    );
  }
  Widget _quickCallHeader(){
   return Container(
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
    );
  }
  double getBearing(LatLng begin, LatLng end) {
    double lat = (begin.latitude - end.latitude).abs();
    double lng = (begin.longitude - end.longitude).abs();

    if (begin.latitude < end.latitude && begin.longitude < end.longitude) {
      return vm.degrees(atan(lng / lat));
    } else if (begin.latitude >= end.latitude && begin.longitude < end.longitude) {
      return (90 - vm.degrees(atan(lng / lat))) + 90;
    } else if (begin.latitude >= end.latitude && begin.longitude >= end.longitude) {
      return vm.degrees(atan(lng / lat)) + 180;
    } else if (begin.latitude < end.latitude && begin.longitude >= end.longitude) {
      return (90 - vm.degrees(atan(lng / lat))) + 270;
    }
    return -1;
  }

  _showAlertDialog(String title, String buttonText, int step) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return ProfileCompletionDialog(
            title: title,
            buttonText: buttonText,
            step: step,
            onTap: (){
              setState(() {
                flag1 = false;
              });
              getProfileBloc.dispose();
              getProfileBloc.subject.close();
              Navigator.of(context).pop();
            },
        );
      },
    );
  }

}
