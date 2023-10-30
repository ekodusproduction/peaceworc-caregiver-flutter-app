import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peace_worc/bloc/logout/settings_bloc.dart';
import 'package:peace_worc/components/setting_component.dart';
import 'package:peace_worc/constants/settings/setting_constant.dart';
import 'package:peace_worc/screen/changePassword/change_password.dart';
import 'package:peace_worc/screen/login/login.dart';
import 'package:peace_worc/screen/logout/logout_screen.dart';
import 'package:peace_worc/screen/settings/document_upload.dart';
import 'package:peace_worc/screen/settings/flag_screen.dart';
import 'package:peace_worc/screen/settings/strike_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(Settings.settings, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body:  BlocBuilder<SettingsBloc, SettingsState>(
  builder: (context, state) {
    if(state is LogoutLoadingState){
      const Center(child: CircularProgressIndicator(
        color: Colors.white,
      ),);
    }
    if(state is LogoutSuccessState){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginPage()), (route) => false);
    }
    if(state is LogoutFailureState){
      Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return Column(
          children: [
            SettingComponent(settingName: Settings.changePassword, iconName: Icons.lock_outline, onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
            }, ),

            SettingComponent(settingName: Settings.documentManagement, iconName: Icons.audio_file_outlined, onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DocumentUpload()));
            },),
            const SettingComponent(settingName: Settings.earnings, iconName: Icons.account_balance_wallet_outlined),
            SettingComponent(settingName:Settings.strikes, iconName: Icons.block, onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const StrikeScreen()));
            },),
            SettingComponent(settingName: Settings.flags, iconName: Icons.flag_circle_outlined, onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FlagScreen()));
            },),
            const SettingComponent(settingName:Settings.privacyPolicy, iconName: Icons.privacy_tip_outlined),
            SettingComponent(settingName: Settings.logout, iconName: Icons.logout, onTap: (){
              _showAlertDialog();
            },)
          ],
        );
  },
),
      ),
    );
  }
  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Logout(onNoTap: (){

             Navigator.of(context).pop();

        }, onYesTap: (){
          Navigator.of(context).pop();
          context
              .read<SettingsBloc>()
              .add(LogoutButtonClickEvent());

        },);
      },
    );
  }
}
