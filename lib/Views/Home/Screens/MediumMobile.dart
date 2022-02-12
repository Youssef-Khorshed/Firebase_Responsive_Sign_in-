import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';
import 'package:flutter_firebase/Shared/Compoent_SizedBox/sizedbox.dart';
import 'package:flutter_firebase/Shared/Global/constant.dart';
import 'package:flutter_firebase/Shared/components_navigation/navigation.dart';
import 'package:flutter_firebase/Shared/components_text_widget/components.dart';
import 'package:flutter_firebase/Views/LoginScreen/shop_login.dart';

class MediumMobile extends StatelessWidget {
  BoxConstraints constraints;
  User user;
  MediumMobile({required this.constraints, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          medium_phone_stack(constraints),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding_page),
            child: Column(
              children: [
                StartAnimation(
                  opacityTop: 5,
                  way: false,
                  widget: ClipOval(
                    child: user.photoURL == null
                        ? Image.asset(
                            'assets/user.jpg',
                            height: constraints.maxHeight / 4,
                            width: constraints.maxWidth / 2,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            '${user.photoURL}',
                            height: constraints.maxHeight / 4,
                            width: constraints.maxWidth / 2,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                space_height(),
                StartAnimation(
                  opacityTop: 5,
                  way: false,
                  widget: Text(
                    user.displayName ?? 'User',
                    style: TextStyle(
                        fontSize: small_medium_phone_tilte - 5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                space_height(),
                StartAnimation(
                  way: false,
                  opacityTop: 5,
                  widget: Text(user.email!,
                      style: TextStyle(
                          fontSize: small_medium_phone_subtitle,
                          fontWeight: FontWeight.bold)),
                ),
                space_height(),
                StartAnimation(
                  widget: DefaultButton(
                      controller: () {
                        navgiation(context: context, widget: LoginScreen());
                      },
                      // ignore: prefer_const_literals_to_create_immutables
                      color: LinearGradient(
                          colors: [Color(0xFF216383), Color(0xFF71bfbc)]),
                      text: "Sign out"),
                  way: false,
                  opacityTop: 5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
