import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:peace_worc/model/job/quick_call_detail_response.dart';
import 'package:peace_worc/utils/utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../bloc/job/job_bloc.dart';
import '../profile/company_profile.dart';
class JobDetail extends StatefulWidget {
  final int? id;
  const JobDetail( {super.key, required this.id});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> with UtilsHelper{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<JobBloc>(context).add(FetchQuickCallDetailPageEvent(widget.id));
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        fetchQuickCallJobs(context);
        return true;
      },
      child: DefaultTabController(
        length: 2,
        child: BlocBuilder<JobBloc, JobState>(
          builder: (context, state){
          if(state is QuickCallDetailLoadingState){
            var quickCallDummyResponse =  QuickCallDetailResponse(
                success: false,
                message: "test",
                data: null,
                token: null,
                httpStatusCode: 200
            );
            return quickCallDetailWidget(true, quickCallDummyResponse);
          }
          if(state is QuickCallDetailSuccessState){
             return quickCallDetailWidget(false, state.bidJobResponse);
          }
          if(state is QuickCallDetailFailureState){
            Center(
              child: Lottie.asset(
                'lib/assets/internal_error.json',
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
            );
          }
          return SizedBox.shrink();
          },

        ),
      ),
    );

  }
//   void fetchQuickCallJobs() {
//     BlocProvider.of<JobBloc>(context).add(FetchQuickCallJobEvent());
// }

  Widget quickCallDetailWidget(loadingState,QuickCallDetailResponse? quickCallDetailResponse){
    return Skeletonizer(
      enabled: loadingState,
      child:  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading:  BackButton(
              color: Colors.black,
              // <-- SEE HERE
              onPressed: (){
                fetchQuickCallJobs(context);
                Navigator.pop(context, 'quickDetailPage');
              },
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text("Job Details", style: TextStyle(color: Colors.black)),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     CircleAvatar(
                      backgroundImage: NetworkImage(
                "https://peaceworc-phase2-dev.ekodusproject.tech/${quickCallDetailResponse!.data?[0].companyPhoto}" ??  "https://picsum.photos/250?image=9"),

                      radius: 30,

                    ),
                  ],
                ),


              )
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(  quickCallDetailResponse!.data?[0].companyName ?? "",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          useSafeArea: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const CompanyProfile();
                          },
                        )

                      },
                      child: const Text("View Profile", style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
               SizedBox(height: 10,),
               Padding(
                padding: const EdgeInsets.only(left:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(quickCallDetailResponse!.data?[0].jobTitle ?? "",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5.0)

                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(right:10.0),
                            child: Icon(Icons.work, size: 20,)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(quickCallDetailResponse!.data?[0].careType ?? "", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)),
                            Text('${quickCallDetailResponse!.data?[0].careItems?[0]!.patientName  ?? ""}   ${quickCallDetailResponse!.data?[0].careItems?[0]!.gender ?? ""}  ${quickCallDetailResponse!.data?[0].careItems?[0]!.age ?? ""}', style:  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)
                          ],
                        )
                      ],
                    ),
                  ),


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child:  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding:EdgeInsets.only(left:10.0),
                                  child: Icon(Icons.access_time_outlined, size: 20,)),
                              Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text('${quickCallDetailResponse!.data?[0].startTime ?? ""} - ${quickCallDetailResponse!.data?[0].endTime ?? ""}  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0, left: 5.0, right: 5.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding : EdgeInsets.only(left: 10),
                                  child: Icon(Icons.calendar_today, size: 20,)),
                              Padding(
                                  padding: const EdgeInsets.only(left: 20.0, ),
                                  child: Text('${quickCallDetailResponse!.data?[0].startDate ?? ""} to ${quickCallDetailResponse!.data?[0].endDate ?? ""}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),))
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10,  bottom: 5),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child:   Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding:EdgeInsets.only(left:10.0),
                                  child: Icon(Icons.location_on_sharp, size: 20,)),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(quickCallDetailResponse!.data?[0].address ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12) ,
                                      overflow: TextOverflow.visible  ),
                                ),
                              ),


                            ],
                          ),
                        ),

                      ],
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("remittance"),
                            Text("25")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Rewards", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            Icon(Icons.add_alarm)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.only(right: 50.0, left:50.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TabBar(
                    padding: EdgeInsets.all(3.0),
                    indicator: BoxDecoration(
                      color: Color.fromRGBO(0, 60, 129, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: "Job overview",),
                      Tab(text: "checklist",),

                    ],
                  ),
                ),
              ),
              Expanded(
                child:  TabBarView(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top:20.0,left:10.0, right:10.0),
                      child: Container(

                        child:  Text("Job Description & Responsibilities", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
                        decoration: BoxDecoration(

                        ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:20.0,left:10.0, right:10.0),
                      child: Container(

                          child: Text("Caregiver checklist personal care duties and tasks", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
