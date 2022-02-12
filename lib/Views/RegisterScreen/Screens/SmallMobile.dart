import 'package:flutter/material.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';
import 'package:flutter_firebase/Shared/Compoent_SizedBox/sizedbox.dart';
import 'package:flutter_firebase/Shared/Global/constant.dart';
import 'package:flutter_firebase/Shared/components_text_widget/components.dart';
import 'package:flutter_firebase/ViewModels/RegisterScreen_ViewModel/ViewModel.dart';
import 'package:flutter_firebase/Views/LoginScreen/shop_login.dart';

import '../../RegisterScreen/register.dart';

class SmallMobileRegister extends StatelessWidget {
  BoxConstraints constraints;
  RegisterationScreen_ViewModel registercubit;
  SmallMobileRegister({required this.constraints, required this.registercubit});

  @override
  Widget build(BuildContext context) {
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
                          style:
                              TextStyle(fontSize: small_medium_phone_tilte))),
                  // ignore: prefer_const_constructors
                  space_height(height: small_phone_space_height),
                  StartAnimation(
                    opacityTop: 2,
                    way: false,
                    widget: Text(
                      'Sign up to get our offers',
                      style: TextStyle(fontSize: small_medium_phone_subtitle),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  space_height(height: small_phone_space_height),
                  StartAnimation(
                    opacityTop: 2,
                    way: false,
                    widget: textformfield(
                        inputborder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        controller: registercubit.get_email_controller(),
                        validator: registercubit.get_email_valiation(),
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
                            borderRadius: BorderRadius.circular(10)),
                        controller: registercubit.get_password_controller(),
                        prefix_icon: Icons.lock,
                        suffix_hand: () {
                          registercubit.switch_password_suffix_Icon();
                        },
                        validator: registercubit.get_password_valiation(),
                        suffix_icon: registercubit.get_icon_password(),
                        password: registercubit.get_check_pass_icon(),
                        keyboard_type: TextInputType.number,
                        text: 'Password'),
                  ),
                  space_height(height: 5),
                  StartAnimation(
                    opacityTop: 2,
                    way: false,
                    widget: textformfield(
                        inputborder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        controller:
                            registercubit.get_confirmpassword_controller(),
                        prefix_icon: Icons.lock,
                        suffix_hand: () {
                          registercubit.switch_Confirm_password_suffix_Icon();
                        },
                        validator:
                            registercubit.get_confirm_password_valiation(),
                        suffix_icon: registercubit.get_icon_confirm_password(),
                        password: registercubit.get_check_confirm_pass_icon(),
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
                                email:
                                    registercubit.get_email_controller().text);
                          }
                        },
                        color: registercubit.get_buttonregister()
                            ? LinearGradient(
                                colors: [Color(0xFF216383), Color(0xFF71bfbc)])
                            : LinearGradient(
                                colors: [Colors.grey.shade400, Colors.white]),
                        text_color: registercubit.butto_color(),
                        text: registercubit.button_text()),
                  ),
                  StartAnimation(
                    opacityTop: 2,
                    way: false,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${registercubit.get_account_text()}'),
                        TextButton(
                            onPressed: () {
                              registercubit.go_to_Login(
                                  context: context, widget: LoginScreen());
                            },
                            child: Text(
                              '${registercubit.get_login_text()}',
                              style: TextStyle(color: Color(0xFF71bfbc)),
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
}
