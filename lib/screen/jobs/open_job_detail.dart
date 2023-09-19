import 'package:flutter/material.dart';
import 'package:peace_worc/screen/profile/company_profile.dart';
class OpenJobDetailScreen extends StatelessWidget {
  const OpenJobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const BackButton(
              color: Colors.black, // <-- SEE HERE
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
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://picsum.photos/250?image=9"),

                      radius: 50,

                    ),
                  ],
                ),


              )
              ,
              const Padding(
                padding: EdgeInsets.only(left:20 , bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Ekodustech",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => {
                        // showModalBottomSheet(
                        //   context: context,
                        //   isScrollControlled: true,
                        //   builder: (BuildContext context) {
                        //     return CompanyProfileBottomSheet() ; // Custom bottom sheet widget
                        //   },
                        // )

                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          useSafeArea: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const CompanyProfile();
                          },
                        )

                      },
                      child: Text("View Profile", style: TextStyle(color: Colors.blueAccent),))
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Test Job",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
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
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right:10.0),
                            child: Icon(Icons.work, size: 20,)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text("Senior Care", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)),
                            Text("Tulip, Female: 56Yrs", style:  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)
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
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:EdgeInsets.only(left:10.0),
                                  child: Icon(Icons.access_time_outlined, size: 20,)),
                              Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text("7:30 PM - 9:30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:5.0, left: 5.0, right: 5.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding : EdgeInsets.only(left: 10),
                                  child: Icon(Icons.calendar_today, size: 20,)),
                              Padding(
                                  padding: EdgeInsets.only(left: 20.0, ),
                                  child: Text("2023-08-30 to 2023-08-30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),))
                            ],
                          ),
                        )
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
                    child:  const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:EdgeInsets.only(left:10.0),
                                  child: Icon(Icons.location_on_sharp, size: 20,)),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016 Akshya Nagar 1st Block 1st", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12) ,
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
                padding: EdgeInsets.all(10.0),
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
