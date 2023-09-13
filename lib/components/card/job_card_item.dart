import 'package:flutter/material.dart';
class JobCardItem extends StatelessWidget {
  const JobCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(

                color: Colors.grey[200],
                child:  Padding(
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
                            child: const Icon(Icons.work, size: 30.0,))),
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                              Text("3087 Terminal Dr.Care, Herbor, Ky 4102563, usa", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,),
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

                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
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
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("\u002423", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[500]),),
                        const SizedBox(width: 7,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.green[500]
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 7.0, right: 7.0, top: 5.0, bottom: 5.0),
                            child: Text("TIME LEFT : 02:24", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10), maxLines: 1,),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Bid Now", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                          ),),
                          Icon(Icons.arrow_forward_ios_rounded, size: 20.0,)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 15.0, )
            ],
          ),
        ),
      ),
    );
  }
}
