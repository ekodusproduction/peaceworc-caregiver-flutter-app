import 'package:flutter/material.dart';
class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
      children: [
      Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top:10.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Text("Company Profile", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)],
              ),
            ),
            Stack(
                children:[
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://picsum.photos/250?image=9"),
                    radius: 50,
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
                      child: const Row(
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
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text("Ekodustech", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)),
            const SizedBox(height: 5,),
            const Padding(
                padding: EdgeInsets.only(bottom: 1.0),
                child: Text("ekodustech@g.com", style: TextStyle(color: Colors.black,  fontSize: 12),)),
          ],
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            color: Colors.black
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text("Year in business", style: TextStyle(color: Colors.white, fontSize: 13),)),
                  Text("0", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text("Country",style: TextStyle(color: Colors.white, fontSize: 13))),

                  Text("USA", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left:12.0, top: 18.0, bottom: 18.0, right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text("Background", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),)),
                Text("No Data", style: TextStyle(color: Colors.black, fontSize: 12))
              ],
            ),

          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.lightGreenAccent[100]
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text("Phone", style: TextStyle(color: Colors.black, fontSize: 13),)),
                  Text("5758855055", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text("Legal Structure",style: TextStyle(color: Colors.black, fontSize: 13))),

                  Text("No Data", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ),

      ]
),
    );
  }
}
