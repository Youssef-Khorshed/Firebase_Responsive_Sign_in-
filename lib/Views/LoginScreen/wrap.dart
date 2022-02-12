// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';
import 'package:flutter_firebase/Shared/Compoent_SizedBox/sizedbox.dart';
import 'package:flutter_firebase/Shared/Global/constant.dart';
import 'package:flutter_firebase/Shared/components_navigation/navigation.dart';
import 'package:flutter_firebase/Shared/components_text_widget/components.dart';
import 'package:flutter_firebase/Views/Home/Screens/LargeMobile.dart';
import 'package:flutter_firebase/Views/Home/Screens/LargeTablet.dart';
import 'package:flutter_firebase/Views/Home/Screens/MediumMobile.dart';
import 'package:flutter_firebase/Views/Home/Screens/SmallMediumTablet.dart';
import 'package:flutter_firebase/Views/Home/Screens/SmallMobile.dart';
import 'package:flutter_firebase/Views/LoginScreen/Screens/LargeTablet.dart';
import 'package:flutter_firebase/Views/LoginScreen/Screens/MediumMobile.dart';
import 'package:flutter_firebase/Views/LoginScreen/Screens/SmallMobile.dart';
import 'package:flutter_firebase/Views/LoginScreen/shop_login.dart';

import '../../ViewModels/LoginScreen_ViewModel copy/ViewModel.dart';
import 'Screens/LargeMobile.dart';
import 'Screens/SmallMediumTablet.dart';

class WraperLogin {
  static Widget page(LoginScreen_ViewModel logincubit) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 400) {
          return SmallMobileLogin(
            loginCubit: logincubit,
            constraints: constraints,
          );
        } else if (constraints.maxWidth <= 800 &&
            constraints.maxHeight <= 800) {
          return MediumMobileLogin(
              constraints: constraints, loginCubit: logincubit);
        } else if (constraints.maxWidth < 800 && constraints.maxHeight >= 800) {
          return LargeMobileLogin(
              constraints: constraints, loginCubit: logincubit);
        } else if (constraints.maxWidth <= 1024) {
          return SmallMediumTabletLogin(
              constraints: constraints, loginCubit: logincubit);
        } else {
          return LargeTabletLogin(
              constraints: constraints, loginCubit: logincubit);
        }
      },
    );
  }
}
