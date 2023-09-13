import 'package:flutter/material.dart';
class QuickCallCard extends StatelessWidget {
  final String jobName;
  final Function()? onTap;
  const QuickCallCard({super.key ,required this.jobName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
        child: Card(
          color: const Color.fromRGBO(0, 60, 129, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 10.0, left: 5.0, bottom: 5.0),
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange
                            ),
                            child: const Icon(Icons.work, size: 30.0,))),

                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "Ekodustech",
                            style: TextStyle(color: Colors.white,  fontSize: 12.0),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        Text(
                          jobName,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )

                      ],
                    )
                  ],
                ),
              ),
             const Padding(
               padding: EdgeInsets.only(right: 20.0, left: 20.0),
               child: Divider(
                 color: Colors.white,
               ),
             ),
              Container(
                child: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Padding(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.person_outline, size: 15, color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text("Child Care", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),maxLines: 1,),
                                  Icon(Icons.do_not_disturb_on_total_silence, color: Colors.white,size: 4,),
                                  Text("Tulip, Female: 56 Yrs", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),maxLines: 1,)
                                ],
                              ),
                            ),
                            SizedBox(height: 7,),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on_outlined, color: Colors.white, size: 15,),
                                  SizedBox(width: 5,),
                                  Text("3087 Terminal Dr.Care, Herbor, Ky 4102563, usa", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),maxLines: 1,),
                                ],
                              ),
                            ),
                            SizedBox(height: 7,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.calendar_month_outlined, color: Colors.white, size: 15,),
                                SizedBox(width: 5,),
                                Text("2023-09-01", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white), maxLines: 1,),
                                SizedBox(width: 15,),
                                Text("7:28PM - 9:40PM", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white), maxLines: 1,),
                              ],
                            ),
                            SizedBox(height: 10,),

                            SizedBox(height: 10,),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rewards", style: TextStyle(color: Colors.white),),
                              Icon(
                                Icons.add_alarm, color: Colors.orange, size: 30,
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
                        const Text("\u002423", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                        const SizedBox(width: 7,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.red[800]
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
                          Text("Bid Now",  style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0

                          ),),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20.0,)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 15.0, ),
            ],
          ),
        ),
      ),
    );
  }
}
