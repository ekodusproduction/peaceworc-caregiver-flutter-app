import 'package:flutter/material.dart';
class JobCardItem extends StatelessWidget {
  int index;
  final Function()? onTap;
  JobCardItem({super.key, required this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        margin: EdgeInsets.only(
          left: index == 0 ?10: 15,
          right: index == 10 -1 ? 30: 0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
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
      ),
    );

  }
}
