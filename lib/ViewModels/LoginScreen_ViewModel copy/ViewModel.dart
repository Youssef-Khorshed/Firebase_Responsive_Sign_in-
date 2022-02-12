// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_new, prefer_final_fields, unused_field, curly_braces_in_flow_control_structures, camel_case_types, prefer_const_constructors

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Repository/repo.dart';
import 'package:flutter_firebase/Shared/component_toast/toast.dart';
import 'package:flutter_firebase/Shared/components_navigation/navigation.dart';
import 'package:flutter_firebase/Views/Home/homepage.dart';

import 'ViewModelState.dart';

class LoginScreen_ViewModel extends Cubit<LoginScreen_ViewModel_States> {
  LoginScreen_ViewModel({required this.repository})
      : super(LoginScreen_ViewModel_InitialState());

// variables
  bool _buttonlogin = true;
  bool _check_pass_icon = true;
  IconData _icon_password = Icons.visibility_off_outlined;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // ignore: prefer_function_declarations_over_variables
  FormFieldValidator<String> _email_valiation = (value) {
    if (value.toString().isEmpty)
      return 'Please enter  your email';
    else if (!value.toString().endsWith('@gmail.com'))
      return 'Please enter  your gmail';
  };
  // ignore: prefer_function_declarations_over_variables
  FormFieldValidator<String> _password_valiation = (value) {
    if (value.toString().isEmpty)
      return 'Enter Password please';
    else if (value.toString().length < 6) return 'Password is too short';
  };
  String _login_text = 'Login ';
  String _login_title_text = 'Login to get our offers';
  String _wait_text = 'Please Wait......';
  String _account_text = 'Don\`t have Account';
  String _register_text = 'Register now';
  User? user;
  Repository repository;
// methods
  static LoginScreen_ViewModel get(context) => BlocProvider.of(context);

  void switch_password_suffix_Icon() {
    _check_pass_icon = !_check_pass_icon;

    _check_pass_icon
        ? _icon_password = Icons.visibility_off_outlined
        : _icon_password = Icons.remove_red_eye_outlined;

    emit(LoginScreen_ViewModel_SwichEyeState());
  }

  void go_to_registeration(
      {required BuildContext context, required Widget widget}) {
    navgiation(context: context, widget: widget);
    emit(LoginScreen_ViewModel_GotoRegisterationState());
  }

  //methdos
  Future sigin_Anonymous() async {
    return await repository.Singin_Anonymous();
  }

  Future sigin_Facebook(BuildContext context) async {
    emit(LoginScreen_ViewModel_LoadingSinginState());
    dynamic data = await repository.Facebook_siginin();
    if (data != null) {
      print(data);
      user = data;
      emit(LoginScreen_ViewModel_SucessSigninState());
      toast(message: 'Sucess Login', toast_state: Toast_state.success);
      navgiation(context: context, widget: HomeScreen(user: user!));
    }
  }

  Future sigin_Google(BuildContext context) async {
    emit(LoginScreen_ViewModel_LoadingSinginState());
    dynamic data = await repository.Google_siginin();
    if (data != null) {
      user = data;
      print(user.toString());
      emit(LoginScreen_ViewModel_SucessSigninState());
      toast(message: 'Sucess Login', toast_state: Toast_state.success);
      navgiation(context: context, widget: HomeScreen(user: user!));
    }
  }

  Future sigin_Email_Password(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginScreen_ViewModel_LoadingSinginState());
    dynamic data = await repository.Email_Password_Signin(
        email: email, password: password);
    if (data != null) {
      print(data);
      user = data;
      toast(message: 'Sucess Login', toast_state: Toast_state.success);
      emit(LoginScreen_ViewModel_SucessSigninState());
      navgiation(
          context: context,
          widget: HomeScreen(
            user: user!,
          ));
    }
  }

  // Getter
  bool get_buttonlogin() => _buttonlogin;
  bool get_check_pass_icon() => _check_pass_icon;
  String get_login_text() => _login_text;
  String get_register_text() => _register_text;
  String get_account_text() => _account_text;
  String get_login_title_text() => _login_title_text;
  String get_wait_text() => _wait_text;
  IconData get_icon_password() => _icon_password;
  TextEditingController get_email_controller() => _email;
  TextEditingController get_password_controller() => _password;
  GlobalKey<FormState> get_formkey() => _formkey;
  FormFieldValidator<String> get_email_valiation() => _email_valiation;
  FormFieldValidator<String> get_password_valiation() => _password_valiation;
}
