// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';
import 'package:flutter_firebase/Shared/Compoent_SizedBox/sizedbox.dart';
import 'package:flutter_firebase/Shared/Global/constant.dart';
import 'package:flutter_firebase/Shared/components_navigation/navigation.dart';
import 'package:flutter_firebase/Shared/components_text_widget/components.dart';
import 'package:flutter_firebase/Views/Home/wrap.dart';
import 'package:flutter_firebase/Views/LoginScreen/shop_login.dart';

class HomeScreen extends StatelessWidget {
  User user;
  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(backgroundColor: Colors.white, body: Wraper.page(user));
  }
}
