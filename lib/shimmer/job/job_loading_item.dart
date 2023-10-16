import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class JobLoadingItem extends StatelessWidget {
  const JobLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(child:
        Column(
          children: [

          ],
        )
        , baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!);
  }
}
