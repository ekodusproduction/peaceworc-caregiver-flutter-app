import 'package:flutter/material.dart';
class FlagCard extends StatelessWidget {
  const FlagCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
       elevation: 5.0,
       clipBehavior: Clip.antiAliasWithSaveLayer,
       margin: EdgeInsets.all(10.0),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10.0)
       ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 10.0),
                          child: Text("1/3", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Flag", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                          Text("Reason: Due to cancel job", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: Padding(
                        padding: EdgeInsets.only(right: 10.0, left: 10.0, top:5.0, bottom: 5.0),
                        child: Text("Job Details", style: TextStyle(color: Colors.black, fontSize: 13),)),
                  )
                ],
              ),
            ),
          ),
          Divider(height: 2.0, color: Colors.grey[200],),
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 15.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Start Date Time:", style: TextStyle(color: Colors.black, fontSize: 14),),

                        Text("Sept 26, 8:00 AM", style: TextStyle(color: Colors.black, fontSize: 14),)
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start Date Time:", style: TextStyle(color: Colors.black, fontSize: 14),),

                      Text("Sept 26, 8:00 AM", style: TextStyle(color: Colors.black, fontSize: 14),)
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0, top:10.0, bottom: 10.0),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Banned from bidding", style: TextStyle(color: Colors.black, fontSize: 10),),
                        Text("96:00:20", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Banned from bidding", style: TextStyle(color: Colors.black, fontSize: 10),),
                        Text("96:00:20", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Banned from bidding", style: TextStyle(color: Colors.black, fontSize: 10),),
                        Text("96:00:20", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
