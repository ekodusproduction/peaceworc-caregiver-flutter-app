import 'package:flutter/material.dart';
class HighLightCard extends StatelessWidget {
  final Color flavorColor;
  final String imageName;
  final String name;
  final IconData iconName;
  final Function()? onTap;
  const HighLightCard({super.key,
    this.flavorColor = Colors.black,
   required this.name ,
   required this.iconName,
    required this.imageName,
     this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            decoration: BoxDecoration(
            border: Border.all(color: Color(0xffeeeeee), width: 2.0),
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white10,
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            margin: const EdgeInsets.all(6),
            height: 90,
            width: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Padding(

                      padding: EdgeInsets.all(1.0),
                      child:Image.asset('lib/assets/$imageName', height: 50, width: 50,),
                    )),
              ],
            ),
          ),
          Text(name, style: TextStyle(
            fontWeight: FontWeight.bold,

          ),)
        ]
      ),
    );
  }
}