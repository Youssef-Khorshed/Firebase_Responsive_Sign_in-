// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures, non_constant_identifier_names, must_be_immutable, camel_case_types, prefer_const_constructors, duplicate_ignore, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';
import 'package:flutter_firebase/Shared/Compoent_SizedBox/sizedbox.dart';
import 'package:flutter_firebase/Shared/Global/constant.dart';
import 'package:flutter_firebase/Shared/component_toast/toast.dart';
import 'package:flutter_firebase/Shared/components_text_widget/components.dart';
import 'package:flutter_firebase/ViewModels/RegisterScreen_ViewModel/ViewModel.dart';
import 'package:flutter_firebase/ViewModels/RegisterScreen_ViewModel/ViewModelState.dart';
import 'package:flutter_firebase/Views/Home/homepage.dart';
import 'package:flutter_firebase/Views/LoginScreen/shop_login.dart';
import 'package:flutter_firebase/Views/RegisterScreen/wrap.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterationScreen_ViewModel,
            RegisterationScreen_ViewModel_States>(
        builder: (context, state) {
          RegisterationScreen_ViewModel registercubit =
              RegisterationScreen_ViewModel.get(context);
          return Scaffold(
              backgroundColor: Colors.white,
              body: WraperRegister.page(registercubit)

              /*     
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth <= 400) {
                  return SingleChildScrollView(
                    child: Form(
                      key: registercubit.get_formkey(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          small_phone_stack(constraints),
                          Padding(
                            padding: const EdgeInsets.all(padding_page),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StartAnimation(
                                    opacityTop: 2,
                                    way: false,
                                    widget: Text('Sing up',
                                        style: TextStyle(
                                            fontSize:
                                                small_medium_phone_tilte))),
                                // ignore: prefer_const_constructors
                                space_height(height: small_phone_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Text(
                                    'Sign up to get our offers',
                                    style: TextStyle(
                                        fontSize: small_medium_phone_subtitle),
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(height: small_phone_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller:
                                          registercubit.get_email_controller(),
                                      validator:
                                          registercubit.get_email_valiation(),
                                      prefix_icon: Icons.email,
                                      keyboard_type: TextInputType.emailAddress,
                                      text: 'Email'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(height: small_phone_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_password_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_password_valiation(),
                                      suffix_icon:
                                          registercubit.get_icon_password(),
                                      password:
                                          registercubit.get_check_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Password'),
                                ),
                                space_height(height: 5),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_confirmpassword_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_Confirm_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_confirm_password_valiation(),
                                      suffix_icon: registercubit
                                          .get_icon_confirm_password(),
                                      password: registercubit
                                          .get_check_confirm_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Confirm Password'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(height: 5),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: DefaultButton(
                                      controller: () {
                                        if (registercubit
                                            .get_formkey()
                                            .currentState!
                                            .validate()) {
                                          registercubit.Regiteration(
                                              context: context,
                                              password: registercubit
                                                  .get_password_controller()
                                                  .text,
                                              email: registercubit
                                                  .get_email_controller()
                                                  .text);
                                        }
                                      },
                                      color: registercubit.get_buttonregister()
                                          ? LinearGradient(colors: [
                                              Color(0xFF216383),
                                              Color(0xFF71bfbc)
                                            ])
                                          : LinearGradient(colors: [
                                              Colors.grey.shade400,
                                              Colors.white
                                            ]),
                                      text_color: registercubit.butto_color(),
                                      text: registercubit.button_text()),
                                ),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                          '${registercubit.get_account_text()}'),
                                      TextButton(
                                          onPressed: () {
                                            registercubit.go_to_Login(
                                                context: context,
                                                widget: LoginScreen());
                                          },
                                          child: Text(
                                            '${registercubit.get_login_text()}',
                                            style: TextStyle(
                                                color: Color(0xFF71bfbc)),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
             
                } else if (constraints.maxWidth <= 800 &&
                    constraints.maxHeight <= 800) {
                  return SingleChildScrollView(
                    child: Form(
                      key: registercubit.get_formkey(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          medium_phone_stack(constraints),
                          Padding(
                            padding: const EdgeInsets.all(padding_page),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StartAnimation(
                                    opacityTop: 2,
                                    way: false,
                                    widget: Text('Sing up',
                                        style: TextStyle(
                                            fontSize:
                                                small_medium_phone_tilte))),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Text(
                                    'Sign up to get our offers',
                                    style: TextStyle(
                                        fontSize: small_medium_phone_subtitle),
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller:
                                          registercubit.get_email_controller(),
                                      validator:
                                          registercubit.get_email_valiation(),
                                      prefix_icon: Icons.email,
                                      keyboard_type: TextInputType.emailAddress,
                                      text: 'Email'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_password_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_password_valiation(),
                                      suffix_icon:
                                          registercubit.get_icon_password(),
                                      password:
                                          registercubit.get_check_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Password'),
                                ),
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_confirmpassword_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_Confirm_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_confirm_password_valiation(),
                                      suffix_icon: registercubit
                                          .get_icon_confirm_password(),
                                      password: registercubit
                                          .get_check_confirm_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Confirm Password'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: DefaultButton(
                                      controller: () {
                                        if (registercubit
                                            .get_formkey()
                                            .currentState!
                                            .validate()) {
                                          registercubit.Regiteration(
                                              context: context,
                                              password: registercubit
                                                  .get_password_controller()
                                                  .text,
                                              email: registercubit
                                                  .get_email_controller()
                                                  .text);
                                        }
                                      },
                                      color: registercubit.get_buttonregister()
                                          ? LinearGradient(colors: [
                                              Color(0xFF216383),
                                              Color(0xFF71bfbc)
                                            ])
                                          : LinearGradient(colors: [
                                              Colors.grey.shade400,
                                              Colors.white
                                            ]),
                                      text_color: registercubit.butto_color(),
                                      text: registercubit.button_text()),
                                ),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                          '${registercubit.get_account_text()}'),
                                      TextButton(
                                          onPressed: () {
                                            registercubit.go_to_Login(
                                                context: context,
                                                widget: LoginScreen());
                                          },
                                          child: Text(
                                            '${registercubit.get_login_text()}',
                                            style: TextStyle(
                                                color: Color(0xFF71bfbc)),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
               
                } else if (constraints.maxWidth < 800 &&
                    constraints.maxHeight >= 800) {
                  return SingleChildScrollView(
                    child: Form(
                      key: registercubit.get_formkey(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          large_phone_stack(constraints),
                          Padding(
                            padding: const EdgeInsets.all(padding_page),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StartAnimation(
                                    opacityTop: 2,
                                    way: false,
                                    widget: Text('Sing up',
                                        style: TextStyle(
                                            fontSize: large_phone_tilte))),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Text(
                                    'Sign up to get our offers',
                                    style: TextStyle(
                                        fontSize: large_phone_subtilte),
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: large_phone_subtilte,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller:
                                          registercubit.get_email_controller(),
                                      validator:
                                          registercubit.get_email_valiation(),
                                      prefix_icon: Icons.email,
                                      keyboard_type: TextInputType.emailAddress,
                                      text: 'Email'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: large_phone_subtilte,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_password_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_password_valiation(),
                                      suffix_icon:
                                          registercubit.get_icon_password(),
                                      password:
                                          registercubit.get_check_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Password'),
                                ),
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: large_phone_subtilte,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_confirmpassword_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_Confirm_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_confirm_password_valiation(),
                                      suffix_icon: registercubit
                                          .get_icon_confirm_password(),
                                      password: registercubit
                                          .get_check_confirm_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Confirm Password'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: DefaultButton(
                                      textfontsize: large_phone_subtilte,
                                      controller: () {
                                        if (registercubit
                                            .get_formkey()
                                            .currentState!
                                            .validate()) {
                                          registercubit.Regiteration(
                                              context: context,
                                              password: registercubit
                                                  .get_password_controller()
                                                  .text,
                                              email: registercubit
                                                  .get_email_controller()
                                                  .text);
                                        }
                                      },
                                      color: registercubit.get_buttonregister()
                                          ? LinearGradient(colors: [
                                              Color(0xFF216383),
                                              Color(0xFF71bfbc)
                                            ])
                                          : LinearGradient(colors: [
                                              Colors.grey.shade400,
                                              Colors.white
                                            ]),
                                      text_color: registercubit.butto_color(),
                                      text: registercubit.button_text()),
                                ),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        '${registercubit.get_account_text()}',
                                        style: TextStyle(
                                            fontSize: large_phone_subtilte2),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            registercubit.go_to_Login(
                                                context: context,
                                                widget: LoginScreen());
                                          },
                                          child: Text(
                                            '${registercubit.get_login_text()}',
                                            style: TextStyle(
                                                fontSize: large_phone_subtilte2,
                                                color: Color(0xFF71bfbc)),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
               
                } else if (constraints.maxWidth <= 1024) {
                  return SingleChildScrollView(
                    child: Form(
                      key: registercubit.get_formkey(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          small_medium_tablet_stack(constraints),
                          Padding(
                            padding: const EdgeInsets.all(padding_page),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StartAnimation(
                                    opacityTop: 2,
                                    way: false,
                                    widget: Text('Sing up',
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight > 1200
                                              ? tablet_title
                                              : tablet_tilte2,
                                        ))),
                                // ignore: prefer_const_constructors
                                space_height(
                                    height: small_medium_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Text(
                                    'Sign up to get our offers',
                                    style: TextStyle(
                                      fontSize: constraints.maxHeight > 1200
                                          ? tablet_tilte2
                                          : tablet_subtilte,
                                    ),
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(
                                    height: small_medium_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: constraints.maxHeight > 1200
                                          ? tablet_subtilte2
                                          : tablet_subtilte,
                                      iconsize: small_medium_tablet_iconsize,
                                      paddingicon:
                                          small_medium_tablet_paddingicon,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller:
                                          registercubit.get_email_controller(),
                                      validator:
                                          registercubit.get_email_valiation(),
                                      prefix_icon: Icons.email,
                                      keyboard_type: TextInputType.emailAddress,
                                      text: 'Email'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(
                                    height: small_medium_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: constraints.maxHeight > 1200
                                          ? tablet_subtilte2
                                          : tablet_subtilte,
                                      iconsize: small_medium_tablet_iconsize,
                                      paddingicon:
                                          small_medium_tablet_paddingicon,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_password_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_password_valiation(),
                                      suffix_icon:
                                          registercubit.get_icon_password(),
                                      password:
                                          registercubit.get_check_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Password'),
                                ),
                                space_height(
                                    height: small_medium_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: constraints.maxHeight > 1200
                                          ? tablet_subtilte2
                                          : tablet_subtilte,
                                      iconsize: small_medium_tablet_iconsize,
                                      paddingicon:
                                          small_medium_tablet_paddingicon,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_confirmpassword_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_Confirm_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_confirm_password_valiation(),
                                      suffix_icon: registercubit
                                          .get_icon_confirm_password(),
                                      password: registercubit
                                          .get_check_confirm_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Confirm Password'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: DefaultButton(
                                      textfontsize: constraints.maxHeight > 1200
                                          ? tablet_subtilte2
                                          : tablet_subtilte,
                                      controller: () {
                                        if (registercubit
                                            .get_formkey()
                                            .currentState!
                                            .validate()) {
                                          registercubit.Regiteration(
                                              context: context,
                                              password: registercubit
                                                  .get_password_controller()
                                                  .text,
                                              email: registercubit
                                                  .get_email_controller()
                                                  .text);
                                        }
                                      },
                                      color: registercubit.get_buttonregister()
                                          ? LinearGradient(colors: [
                                              Color(0xFF216383),
                                              Color(0xFF71bfbc)
                                            ])
                                          : LinearGradient(colors: [
                                              Colors.grey.shade400,
                                              Colors.white
                                            ]),
                                      text_color: registercubit.butto_color(),
                                      text: registercubit.button_text()),
                                ),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                          '${registercubit.get_account_text()}',
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight < 1200
                                                      ? tablet_subtilte
                                                      : tablet_subtilte2)),
                                      TextButton(
                                          onPressed: () {
                                            registercubit.go_to_Login(
                                                context: context,
                                                widget: LoginScreen());
                                          },
                                          child: Text(
                                            '${registercubit.get_login_text()}',
                                            style: TextStyle(
                                                fontSize:
                                                    constraints.maxHeight < 1200
                                                        ? tablet_subtilte
                                                        : tablet_subtilte2 - 5,
                                                color: Color(0xFF71bfbc)),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                
                } else {
                  return SingleChildScrollView(
                    child: Form(
                      key: registercubit.get_formkey(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          large_tablet_stack(constraints),
                          Padding(
                            padding: const EdgeInsets.all(padding_page),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StartAnimation(
                                    opacityTop: 2,
                                    way: false,
                                    widget: Text('Sing up',
                                        style:
                                            TextStyle(fontSize: tablet_title))),
                                // ignore: prefer_const_constructors
                                space_height(height: large_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Text(
                                    'Sign up to get our offers',
                                    style: TextStyle(fontSize: tablet_tilte2),
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(height: large_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: tablet_subtilte3,
                                      iconsize: large_tablet_iconsize,
                                      paddingicon: large_tablet_paddingicon,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller:
                                          registercubit.get_email_controller(),
                                      validator:
                                          registercubit.get_email_valiation(),
                                      prefix_icon: Icons.email,
                                      keyboard_type: TextInputType.emailAddress,
                                      text: 'Email'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(height: large_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: tablet_subtilte3,
                                      iconsize: large_tablet_iconsize,
                                      paddingicon: large_tablet_paddingicon,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_password_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_password_valiation(),
                                      suffix_icon:
                                          registercubit.get_icon_password(),
                                      password:
                                          registercubit.get_check_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Password'),
                                ),
                                space_height(height: large_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: textformfield(
                                      textsize: tablet_subtilte3,
                                      iconsize: large_tablet_iconsize,
                                      paddingicon: large_tablet_paddingicon,
                                      inputborder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      controller: registercubit
                                          .get_confirmpassword_controller(),
                                      prefix_icon: Icons.lock,
                                      suffix_hand: () {
                                        registercubit
                                            .switch_Confirm_password_suffix_Icon();
                                      },
                                      validator: registercubit
                                          .get_confirm_password_valiation(),
                                      suffix_icon: registercubit
                                          .get_icon_confirm_password(),
                                      password: registercubit
                                          .get_check_confirm_pass_icon(),
                                      keyboard_type: TextInputType.number,
                                      text: 'Confirm Password'),
                                ),
                                // ignore: prefer_const_constructors
                                space_height(height: large_tablet_space_height),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: DefaultButton(
                                      textfontsize: tablet_subtilte3,
                                      controller: () {
                                        if (registercubit
                                            .get_formkey()
                                            .currentState!
                                            .validate()) {
                                          registercubit.Regiteration(
                                              context: context,
                                              password: registercubit
                                                  .get_password_controller()
                                                  .text,
                                              email: registercubit
                                                  .get_email_controller()
                                                  .text);
                                        }
                                      },
                                      color: registercubit.get_buttonregister()
                                          ? LinearGradient(colors: [
                                              Color(0xFF216383),
                                              Color(0xFF71bfbc)
                                            ])
                                          : LinearGradient(colors: [
                                              Colors.grey.shade400,
                                              Colors.white
                                            ]),
                                      text_color: registercubit.butto_color(),
                                      text: registercubit.button_text()),
                                ),
                                StartAnimation(
                                  opacityTop: 2,
                                  way: false,
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                          '${registercubit.get_account_text()}',
                                          style: TextStyle(
                                              fontSize: tablet_subtilte2)),
                                      TextButton(
                                          onPressed: () {
                                            registercubit.go_to_Login(
                                                context: context,
                                                widget: LoginScreen());
                                          },
                                          child: Text(
                                            '${registercubit.get_login_text()}',
                                            style: TextStyle(
                                                fontSize: tablet_subtilte2 - 5,
                                                color: Color(0xFF71bfbc)),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
             
             
                }
              }));
       */
              );
        },
        listener: (context, state) {});
  }
}
