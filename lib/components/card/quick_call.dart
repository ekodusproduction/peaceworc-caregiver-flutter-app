import 'package:flutter/material.dart';
import 'package:peace_worc/model/job/bid_job_response.dart';
class QuickCallCard extends StatelessWidget {

  final Function()? onTap;
  final BidJobResponse bidJobResponse;
  const QuickCallCard({super.key ,required this.bidJobResponse, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
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
                           Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text(
                            bidJobResponse!.data?[0].companyName ?? "",
                              style: TextStyle(color: Colors.white,  fontSize: 12.0),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Text(
                            bidJobResponse!.data?[0].jobTitle ?? "",
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
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.person_outline, size: 15, color: Colors.white,),
                                      SizedBox(width: 5,),
                                      Text(bidJobResponse!.data?[0].careType ?? "", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),maxLines: 1,),
                                      const Icon(Icons.do_not_disturb_on_total_silence, color: Colors.white,size: 4,),
                                      Text('${bidJobResponse!.data?[0].careItems?[0]!.patientName  ?? ""}   ${bidJobResponse!.data?[0].careItems?[0]!.gender ?? ""}  ${bidJobResponse!.data?[0].careItems?[0]!.age ?? ""}' , style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),overflow: TextOverflow.ellipsis,)
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 7,),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Icon(Icons.location_on_outlined, color: Colors.white,size: 15,),
                                      SizedBox(width: 5,),
                                      Flexible(
                                        child: Text(
                                            '${bidJobResponse!.data?[0].address ?? ""}',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.calendar_month_outlined, color: Colors.white, size: 15,),
                                    const SizedBox(width: 5,),
                                    Text('${bidJobResponse!.data?[0].startDate ?? ""} ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white), maxLines: 1,),
                                    const SizedBox(width: 15,),
                                    Text('${bidJobResponse!.data?[0].startTime ?? ""} - ${bidJobResponse!.data?[0].endTime ?? ""}  ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white), maxLines: 1,),
                                  ],
                                ),
                                const SizedBox(height: 10,),

                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Rewards", style: TextStyle(color: Colors.white),),
                                  Icon(
                                    Icons.star, color: Colors.orange, size: 40,
                                  )
                                ],
                              ),
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
                           Text('\u0024${bidJobResponse!.data?[0].amount ?? ""}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
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
      ),
    );
  }
}
