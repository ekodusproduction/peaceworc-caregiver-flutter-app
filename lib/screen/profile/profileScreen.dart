import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peace_worc/components/card/qualification.dart';
import 'package:peace_worc/screen/profile/add_basic_information_screen.dart';
import 'package:peace_worc/screen/profile/add_bio_information_screen.dart';
import 'package:peace_worc/screen/profile/add_certificate_screen.dart';
import 'package:peace_worc/screen/profile/edit_education_list.dart';
class ProfileScreen extends StatefulWidget {
   const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List _list = [
    "test1",
    "test2",
    "test2",
    "test2",

  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              color: const Color.fromRGBO(0, 60, 129, 1),
              child: Center(
                child: Column(
                  children: [
                     Padding(
                      padding: EdgeInsets.only(top:10.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ Text("Subrajit Deb", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)],
                      ),
                    ),
                    Stack(
                        children:[
        CachedNetworkImage(
        imageUrl: "https://picsum.photos/250?image=9",
        errorWidget: (context, url, error) => Text("error"),
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 50,
          backgroundImage: imageProvider,
        ),
      ),


                          Positioned(
                            bottom: 0,
                            right: 20,
                            left: 20,


                            child: Container(

                              padding: EdgeInsets.only(top:2,bottom: 2),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child:  const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 14.0,
                                  ),

                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                    const SizedBox(height: 10,),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: Text("subrajitdeg54@gmail.com",
                          style: TextStyle(color: Colors.white,  fontSize: 12),)),
                    const SizedBox(height: 10.0,),
                    const Divider(height: 5.0, color: Colors.white),
                    const IntrinsicHeight(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child:  Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(

                              children: [
                                Text(

                                  'Jobs Completed',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(

                                    color: Colors.white,
                                    fontSize: 13.0

                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    color: Colors.white,

                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )),
                          VerticalDivider(width: 5.0,color: Colors.white,indent: 0, endIndent: 0,),

                          Expanded(child:  Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  'Rewards',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white,

                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),),
                          VerticalDivider(width: 5.0,color: Colors.white,),
                          Expanded(child:  Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  'Total Strikes',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white,

                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),),
                          VerticalDivider(width: 5.0,color: Colors.white,),
                          Expanded(child:  Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  'Total Flags',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white,

                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // CustomScrollView(
            //   slivers:[
            //     SliverList(delegate: SliverChildBuilderDelegate(
            //           (BuildContext context, int index) {
            //         // Your first ListView.builder goes here
            //         // Example: return ListTile(title: Text('Item $index'));
            //       },
            //     ))
            //   ]
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  child: Text("Phone No.", style: TextStyle(color: Colors.grey),)),
                              Text("5878088988.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),

                              Padding(
                                  padding: EdgeInsets.only(bottom: 5.0, top: 15.0),
                                  child: Text("Caregiver Experience.", style: TextStyle(color: Colors.grey),)),
                              Text("0 Years.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14))
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text("Gender", style: TextStyle(color: Colors.grey),)),
                                  Text("Male", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),

                                  Padding(
                                      padding: EdgeInsets.only(bottom: 5.0, top: 15.0),
                                      child: Text("DOB", style: TextStyle(color: Colors.grey),)),
                                  Text("09-17-2005", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14))
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => Dialog.fullscreen(
                                      insetAnimationCurve: Curves.easeInOut,
                                      child: AddBasicInformationScreen(),
                                    ),
                                  );
                                },
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.edit_outlined, size: 25,)
                                    ]),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(height: 3.0, color: Colors.grey[400],),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text("Bio", style: TextStyle(color: Colors.grey),)),
                              Text("Test Dinesh.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Dialog.fullscreen(
                                  insetAnimationCurve: Curves.easeInOut,
                                  child: AddBioDetailsScreen(),
                                ),
                              );
                            },
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.edit_outlined, size: 25,)
                                ]),
                          )


                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Education", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          PopupMenuButton(
                            // add icon, by default "3 dot" icon
                            // icon: Icon(Icons.book)
                              offset: const Offset(20, 40),
                              itemBuilder: (context){
                                return [
                                  PopupMenuItem<int>(

                                    value: 0,
                                    child: SizedBox(
                                        width: 100,
                                        child: Text("Add")),
                                  ),

                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: SizedBox(
                                        width: 100,
                                        child: Text("Edit")),
                                  ),

                                ];
                              },
                              onSelected:(value){
                                if(value == 0){
                                  print("My account menu is selected.");
                                }else if(value == 1){
                                  print("Settings menu is selected.");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditEducationListScreen()));
                                }else if(value == 2){
                                  print("Logout menu is selected.");
                                }
                              }
                          )
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _list.length.toInt(),
                          itemBuilder: (context, index){
                          return Qualification();
                      }),
                    ),

                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                  child: Icon(Icons.school, size: 30,)),
                              Text("Certificate/course", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.only(left: 10.0,right: 10.0, top: 2.0, bottom: 2.0),
                                backgroundColor: Colors.grey[200]
                            ),
                            onPressed: ()=>showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Dialog.fullscreen(
                               insetAnimationCurve: Curves.easeInOut,

                                child: AddCertificateScreen(),
                              ),
                            ),
                            icon: Icon(Icons.add_circle_outline, size: 18, color: Colors.black,), // Replace with your desired icon
                            label: Text('Add', style: TextStyle(color: Colors.black),),
                          )

                        ],
                      ),
                    ),





                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
