import 'package:flutter/material.dart';
class QuickCallTestCard extends StatefulWidget {
  const QuickCallTestCard({super.key});

  @override
  State<QuickCallTestCard> createState() => _QuickCallTestCardState();
}

class _QuickCallTestCardState extends State<QuickCallTestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        color: Colors.blue.shade900,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("data", style: TextStyle(color: Colors.white),),
                    Flexible(
                      child: Text("data fxyhagdjauks dgjqgwadlak aduawdaj wdxiuatwduaw sxakwdgiaxda gduiaus",
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text("data", style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Text("Rewards", style: TextStyle(color: Colors.white),),
                    Icon(Icons.timer_outlined, color: Colors.white,)
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
