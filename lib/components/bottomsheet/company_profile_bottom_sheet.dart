import 'package:flutter/material.dart';

import '../../screen/profile/company_profile.dart';
class CompanyProfileBottomSheet extends StatefulWidget {
  const CompanyProfileBottomSheet({super.key});

  @override
  State<CompanyProfileBottomSheet> createState() => _CompanyProfileBottomSheetState();
}

class _CompanyProfileBottomSheetState extends State<CompanyProfileBottomSheet> {
  double sheetTopPosition = 0.0;
  @override @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          sheetTopPosition += details.delta.dy;
          if (sheetTopPosition < 0.0) {
            sheetTopPosition = 0.0;
          }
        });
      },
      onVerticalDragEnd: (details) {
        if (sheetTopPosition > MediaQuery.of(context).size.height * 0.5) {
          Navigator.of(context).pop(); // Close the bottom sheet
        } else {
          setState(() {
            sheetTopPosition = 0.0; // Snap back to the top
          });
        }
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.5, // Initial height as a fraction of the screen
        minChildSize: 0.2, // Minimum height when fully collapsed
        maxChildSize: 1.0, // Maximum height when fully expanded
        builder: (BuildContext context, ScrollController scrollController) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(top: sheetTopPosition),
            child: CompanyProfile(),
          );
        },
      ),
    );
  }
}







