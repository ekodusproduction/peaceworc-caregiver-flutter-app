import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peace_worc/bloc/internet/internet_bloc.dart';
import 'package:peace_worc/bloc/login/login_bloc.dart';
import 'package:peace_worc/repository/login_repository.dart';
import 'package:peace_worc/screen/dashboard/Dashboard.dart';
import 'package:peace_worc/screen/login/login.dart';
import 'package:peace_worc/screen/splash/splash.dart';
import 'package:peace_worc/services/connectivity_services.dart';

import 'hive/hive_init.dart';

Future<void> main() async {
  await initFlutterHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Peaceworc Caregiver',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: RepositoryProvider(
          create: (context) => LoginRepo(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      LoginBloc(

                      ),
              

              ),
              BlocProvider(create: (context)=> InternetBloc())
             
            ], child: LoginPage(),
           
          ),
        )
    );
  }
}


