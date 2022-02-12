// ignore_for_file: prefer_const_constructors, unused_element
import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ViewModels/BlocObserver/bloc.dart';

import 'material_app.dart';

// small mobile <= 400
// mobile <=800
// tablet <=1300
// else
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(DevicePreview(builder: (context) => MyApp())); // Wrap your ap
}
