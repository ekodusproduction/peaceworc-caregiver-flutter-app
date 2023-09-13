import 'package:flutter/material.dart';
class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              child: TabBar(
                padding: const EdgeInsets.all(6.0),
                isScrollable: true,
                 dividerColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), // Creates border
                      color: Colors.white),

                tabs: const <Widget>[

                    Tab(

                            child: Padding(
                              padding: EdgeInsets.only(right: 15, left: 15),
                                child: Text("My Bids", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),)),

                    ),

                  Tab(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                       child: Text("Awarded Jobs", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),)),

                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                       child: Text("Completed", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),)),

                  ),
                ],
              ),
            ),
            const Expanded(child: TabBarView(
              children: <Widget>[
                Center(
                  child: Text("My Bids Screen"),
                ),
                Center(
                  child: Text("Awarded Job Screen"),
                ),
                Center(
                  child: Text("Completed Screen"),
                ),
              ],
            )
            )
          ],
        ),
      ),
    );
  }
}
