// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Repository/API/api.dart';
import 'package:flutter_firebase/ViewModels/LoginScreen_ViewModel%20copy/ViewModel.dart';
import 'package:flutter_firebase/ViewModels/RegisterScreen_ViewModel/ViewModel.dart';
import 'package:flutter_firebase/Views/LoginScreen/shop_login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  RegisterationScreen_ViewModel(repository: MyFirebase())),
          BlocProvider(
              create: (context) =>
                  LoginScreen_ViewModel(repository: MyFirebase())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          builder: DevicePreview.appBuilder,
        ));
  }
}
