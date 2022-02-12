import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';
import 'package:flutter_firebase/Shared/Compoent_SizedBox/sizedbox.dart';
import 'package:flutter_firebase/Shared/Global/constant.dart';
import 'package:flutter_firebase/Shared/components_text_widget/components.dart';
import 'package:flutter_firebase/ViewModels/LoginScreen_ViewModel%20copy/ViewModel.dart';

import '../../RegisterScreen/register.dart';

class LargeTabletLogin extends StatelessWidget {
  BoxConstraints constraints;
  LoginScreen_ViewModel loginCubit;
  LargeTabletLogin({required this.constraints, required this.loginCubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: loginCubit.get_formkey(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            large_tablet_stack(constraints),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: padding_tablet_page),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StartAnimation(
                    opacityTop: 2,
                    way: false,
                    widget: Text('${loginCubit.get_login_text()}',
                        style: TextStyle(fontSize: tablet_title)),
                  ),
                  space_height(height: large_tablet_space_height),
                  StartAnimation(
                      opacityTop: 2,
                      way: false,
                      widget: Text(
                        '${loginCubit.get_login_title_text()}',
                        style: TextStyle(fontSize: tablet_tilte2),
                      )),
                  space_height(height: large_tablet_space_height),
                  StartAnimation(
                      opacityTop: 2,
                      way: false,
                      widget: Container(
                        child: textformfield(
                            textsize: tablet_subtilte3,
                            iconsize: large_tablet_iconsize,
                            paddingicon: large_tablet_paddingicon,
                            controller: loginCubit.get_email_controller(),
                            inputborder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            validator: loginCubit.get_email_valiation(),
                            prefix_icon: Icons.email,
                            keyboard_type: TextInputType.emailAddress,
                            text: 'Email'),
                      )),
                  space_height(height: large_tablet_space_height),
                  StartAnimation(
                    opacityTop: 2,
                    way: false,
                    widget: Container(
                      child: textformfield(
                          textsize: tablet_subtilte3,
                          iconsize: large_tablet_iconsize,
                          paddingicon: large_tablet_paddingicon,
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
                          text: 'Password'),
                    ),
                  ),
                  space_height(height: large_tablet_space_height),
                  StartAnimation(
                    opacityTop: 1,
                    way: false,
                    widget: Container(
                        child: DefaultButton(
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
                            textfontsize: tablet_subtilte3,
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
                        Text('${loginCubit.get_account_text()}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: tablet_subtilte2)),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              loginCubit.go_to_registeration(
                                  context: context, widget: RegisterScreen());
                            },
                            child: Text(
                              '${loginCubit.get_register_text()}',
                              style: TextStyle(
                                  fontSize: tablet_subtilte2,
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
                          width: constraints.maxWidth / 2.5,
                          color: Colors.grey.shade400,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('or',
                              style: TextStyle(fontSize: tablet_subtilte3)),
                        ),
                        Container(
                          height: 3,
                          width: constraints.maxWidth / 2.5,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                  space_height(height: large_tablet_space_height),
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
                                  height: 90,
                                  width: 60,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Continue with facebook',
                                  style: TextStyle(
                                      fontSize: tablet_subtilte3,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  space_height(height: 20),
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
                            padding: EdgeInsets.all(3.0),
                            color: Color(0xFFca1e1e),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,

                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset(
                                  'assets/g1.jpg',
                                  height: 100,
                                  width: 120,
                                ),
                                Text('Continue with google',
                                    style: TextStyle(
                                        fontSize: tablet_subtilte3,
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
