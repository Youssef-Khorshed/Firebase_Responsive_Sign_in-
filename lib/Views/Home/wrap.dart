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
import 'package:flutter_firebase/Views/LoginScreen/shop_login.dart';

class Wraper {
  static Widget page(User user) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 400) {
          return SmallMobile(
            user: user,
            constraints: constraints,
          );
        } else if (constraints.maxWidth <= 800 &&
            constraints.maxHeight <= 800) {
          return MediumMobile(constraints: constraints, user: user);
        } else if (constraints.maxWidth < 800 && constraints.maxHeight >= 800) {
          return LargeMobile(constraints: constraints, user: user);
        } else if (constraints.maxWidth <= 1024) {
          return SmallMediumTablet(constraints: constraints, user: user);
        } else {
          return LargeTablet(constraints: constraints, user: user);
        }
      },
    );
  }
}
