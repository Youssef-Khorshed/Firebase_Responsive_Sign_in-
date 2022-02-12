import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';
import 'package:flutter_firebase/Shared/Compoent_SizedBox/sizedbox.dart';
import 'package:flutter_firebase/Shared/Global/constant.dart';
import 'package:flutter_firebase/Shared/components_text_widget/components.dart';
import 'package:flutter_firebase/ViewModels/LoginScreen_ViewModel%20copy/ViewModel.dart';

import '../../RegisterScreen/register.dart';

class LargeMobileLogin extends StatelessWidget {
  BoxConstraints constraints;
  LoginScreen_ViewModel loginCubit;
  LargeMobileLogin({required this.constraints, required this.loginCubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: loginCubit.get_formkey(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            large_phone_stack(constraints),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding_page),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StartAnimation(
                    opacityTop: 2,
                    way: false,
                    widget: Text('${loginCubit.get_login_text()}',
                        style: TextStyle(fontSize: large_phone_tilte)),
                  ),
                  space_height(),
                  StartAnimation(
                      opacityTop: 2,
                      way: false,
                      widget: Text(
                        '${loginCubit.get_login_title_text()}',
                        style: TextStyle(fontSize: large_phone_subtilte),
                      )),
                  space_height(),
                  StartAnimation(
                      opacityTop: 2,
                      way: false,
                      widget: Container(
                        child: textformfield(
                            controller: loginCubit.get_email_controller(),
                            inputborder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            validator: loginCubit.get_email_valiation(),
                            prefix_icon: Icons.email,
                            keyboard_type: TextInputType.emailAddress,
                            text: 'Email',
                            textsize: large_phone_subtilte),
                      )),
                  space_height(),
                  StartAnimation(
                    opacityTop: 2,
                    way: false,
                    widget: Container(
                      child: textformfield(
                          inputborder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          controller: loginCubit.get_password_controller(),
                          validator: loginCubit.get_password_valiation(),
                          suffix_hand: () {
                            loginCubit.switch_password_suffix_Icon();
                          },
                          suffix_icon: loginCubit.get_icon_password(),
                          password: loginCubit.get_check_pass_icon(),
                          prefix_icon: Icons.lock,
                          keyboard_type: TextInputType.number,
                          text: 'Password',
                          textsize: large_phone_subtilte),
                    ),
                  ),
                  space_height(),
                  StartAnimation(
                    opacityTop: 1,
                    way: false,
                    widget: Container(
                        child: DefaultButton(
                            textfontsize: large_phone_subtilte,
                            controller: () async {
                              if (loginCubit
                                  .get_formkey()
                                  .currentState!
                                  .validate()) {
                                await loginCubit.sigin_Email_Password(
                                    email:
                                        loginCubit.get_email_controller().text,
                                    password: loginCubit
                                        .get_password_controller()
                                        .text,
                                    context: context);
                                loginCubit.get_email_controller().clear();
                                loginCubit.get_password_controller().clear();
                              }
                            },
                            text_color: Colors.white,
                            color: loginCubit.get_buttonlogin()
                                // ignore: prefer_const_literals_to_create_immutables
                                ? LinearGradient(colors: [
                                    Color(0xFF216383),
                                    Color(0xFF71bfbc)
                                  ])
                                : LinearGradient(colors: [
                                    Colors.grey.shade400,
                                    Colors.white
                                  ]),
                            text: loginCubit.get_buttonlogin()
                                ? '${loginCubit.get_login_text()}'
                                : '${loginCubit.get_wait_text()}')),
                  ),
                  StartAnimation(
                    opacityTop: 1,
                    way: false,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${loginCubit.get_account_text()}',
                          style: TextStyle(fontSize: large_phone_subtilte2),
                        ),
                        TextButton(
                            onPressed: () {
                              loginCubit.go_to_registeration(
                                  context: context, widget: RegisterScreen());
                            },
                            child: Text(
                              '${loginCubit.get_register_text()}',
                              style: TextStyle(
                                  fontSize: large_phone_subtilte2,
                                  color: Color(0xFF216383)),
                            ))
                      ],
                    ),
                  ),
                  StartAnimation(
                    opacityTop: 1,
                    way: false,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          height: 3,
                          width: 120,
                          color: Colors.grey.shade400,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('or',
                              style: TextStyle(fontSize: large_phone_subtilte)),
                        ),
                        Container(
                          height: 3,
                          width: 120,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                  space_height(),
                  StartAnimation(
                    opacityTop: 1,
                    way: false,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            await loginCubit.sigin_Facebook(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            color: Colors.blue.shade900,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset(
                                  'assets/f.png',
                                  height: 25,
                                  width: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Continue with facebook',
                                  style: TextStyle(
                                      fontSize: large_phone_subtilte2,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  space_height(),
                  StartAnimation(
                    opacityTop: 1,
                    way: false,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            await loginCubit.sigin_Google(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            color: Color(0xFFca1e1e),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,

                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset(
                                  'assets/g1.jpg',
                                  height: 25,
                                  width: 50,
                                ),
                                Text('Continue with google',
                                    style: TextStyle(
                                        fontSize: large_phone_subtilte2,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
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
