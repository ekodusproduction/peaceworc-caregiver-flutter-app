import 'package:flutter/material.dart';
import 'package:peace_worc/components/setting_component.dart';
import 'package:peace_worc/constants/settings/setting_constant.dart';
import 'package:peace_worc/screen/changePassword/change_password.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(Settings.settings, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body:  Column(
          children: [
            SettingComponent(settingName: Settings.changePassword, iconName: Icons.arrow_forward_ios, onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
            }, ),

            SettingComponent(settingName: Settings.documentManagement, iconName: Icons.audio_file_outlined),
            SettingComponent(settingName: Settings.earnings, iconName: Icons.account_balance_wallet_outlined),
            SettingComponent(settingName:Settings.strikes, iconName: Icons.block),
            SettingComponent(settingName: Settings.flags, iconName: Icons.flag_circle_outlined),
            SettingComponent(settingName:Settings.privacyPolicy, iconName: Icons.privacy_tip_outlined),
            SettingComponent(settingName: Settings.logout, iconName: Icons.logout)
          ],
        ),
      ),
    );
  }
}
