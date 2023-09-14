import 'package:flutter/material.dart';
class DocumentCard extends StatelessWidget {
  final String documentName;
  final Function()? onTap;
  const DocumentCard({super.key, required this.documentName,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(documentName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top:20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //   margin: EdgeInsets.only(right: 20),
                //   height: 100,
                //     width: 100,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(5.0)
                //   ),
                // ),

                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Icon(Icons.cloud_upload_rounded, size: 40,)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
