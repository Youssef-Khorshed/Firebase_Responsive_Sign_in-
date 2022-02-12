// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, must_be_immutable, camel_case_types, unused_import, use_key_in_widget_constructors, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';
import 'package:flutter_firebase/Shared/Compoent_SizedBox/sizedbox.dart';
import 'package:flutter_firebase/Shared/Global/constant.dart';
import 'package:flutter_firebase/Shared/component_toast/toast.dart';
import 'package:flutter_firebase/Shared/components_navigation/navigation.dart';
import 'package:flutter_firebase/Shared/components_text_widget/components.dart';
import 'package:flutter_firebase/ViewModels/LoginScreen_ViewModel%20copy/ViewModel.dart';
import 'package:flutter_firebase/ViewModels/LoginScreen_ViewModel%20copy/ViewModelState.dart';
import 'package:flutter_firebase/Views/Home/homepage.dart';
import 'package:flutter_firebase/Views/LoginScreen/wrap.dart';
import 'package:flutter_firebase/Views/RegisterScreen/register.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreen_ViewModel, LoginScreen_ViewModel_States>(
        builder: (context, state) {
          LoginScreen_ViewModel loginCubit = LoginScreen_ViewModel.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: WraperLogin.page(loginCubit),
          );
        },
        listener: (context, state) {});
  }
}
