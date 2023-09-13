import 'package:flutter/material.dart';
class SettingComponent extends StatelessWidget {
  final String settingName;
  final IconData iconName;
  final Function()? onTap;
  const SettingComponent({
    super.key,
    required this.settingName,
    required this.iconName,
    this.onTap

  });
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5.0)
            ),
            child:   Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding:const EdgeInsets.only(left:10.0, right: 10.0),
                              child: Icon(iconName, size: 25,)),
                          Text(settingName, style: TextStyle(color: Colors.black, fontSize: 16),)
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 25,)


                    ],
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}
