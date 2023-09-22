import 'package:flutter/material.dart';
import 'package:peace_worc/screen/home/home.dart';
import 'package:peace_worc/screen/jobs/jobs.dart';
import 'package:peace_worc/screen/profile/profileScreen.dart';
import 'package:peace_worc/screen/settings/settingScreen.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final list = [const HomeScreen(), const JobsScreen(),  ProfileScreen(), const SettingsScreen() ];
  int _selectedIndex = 0;

  void onTap(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: list[_selectedIndex],
         bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed ,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, ),
              label: "Dashboard"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.work,),
              label: "Work"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: 'Account'

          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.settings,),
              label: 'Settings'

          ),

        ],
        onTap: (index){
          onTap(index);
        },
      ),
      ),
    );
  }
}
