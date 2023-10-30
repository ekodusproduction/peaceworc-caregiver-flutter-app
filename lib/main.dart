import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peace_worc/bloc/internet/internet_bloc.dart';
import 'package:peace_worc/bloc/job/job_bloc.dart';
import 'package:peace_worc/bloc/login/login_bloc.dart';
import 'package:peace_worc/bloc/logout/settings_bloc.dart';
import 'package:peace_worc/bloc/otp/otp_bloc.dart';
import 'package:peace_worc/bloc/profile/add_certificate_bloc.dart';
import 'package:peace_worc/bloc/profile/profile_details_bloc.dart';
import 'package:peace_worc/bloc/signup/signup_bloc.dart';
import 'package:peace_worc/repository/login/login_repository.dart';
import 'package:peace_worc/screen/dashboard/Dashboard.dart';
import 'package:peace_worc/screen/login/login.dart';
import 'package:peace_worc/screen/settings/document_upload.dart';
import 'package:peace_worc/screen/splash/splash.dart';
import 'package:peace_worc/services/background_service.dart';
import 'package:peace_worc/services/connectivity_services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'hive/hive_init.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Permission.notification.isGranted.then((value) {
  //   if(value){
  //     Permission.notification.request();
  //   }
  // });
  // await initializeService();
  await initFlutterHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider<AddCertificateBloc>(
              create: (context) => AddCertificateBloc(),
            ),
            BlocProvider(

                create: (context) =>
                    LoginBloc(

                    ),
            ),
           // BlocProvider(create: (context)=> InternetBloc()),
            BlocProvider(
              create: (context) =>
                  SignupBloc(

                  ),


            ),
            BlocProvider(
              create: (context) =>
                  OtpBloc(

                  ),


            ),

            BlocProvider(
              create: (context) =>
                  JobBloc(

                  ),

            ),

            BlocProvider(
              create: (context) =>
                  ProfileDetailsBloc(

                  ),

            ),

            BlocProvider(
              create: (context) =>
                  SettingsBloc(

                  ),

            ),

          ], child: const MaterialApp(home: LoginPage(), title: 'Peaceworc Caregiver',
      debugShowCheckedModeBanner: false,),

        );

  }
}


