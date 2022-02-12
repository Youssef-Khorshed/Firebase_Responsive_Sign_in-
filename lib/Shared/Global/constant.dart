// ignore_for_file: constant_identifier_names, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase/Shared/Animation/animation.dart';

// upper photo
// ignore: non_constant_identifier_names
Widget small_phone_stack(BoxConstraints constraints) => Stack(
      alignment: Alignment.topCenter,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_literals_to_create_immutables

        Image(
          image: AssetImage('assets/photo.jpg'),
          height: constraints.maxHeight / 4,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            StartAnimation(
              way: true,
              opacityright: 10,
              widget:
                  //
                  Container(
                height: constraints.maxHeight / 3,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/clock.png'),
                      height: constraints.maxHeight / 6,
                    )),
              ),
            ),
            StartAnimation(
              opacityright: 25,
              way: true,
              widget: Container(
                height: constraints.maxHeight / 3,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/light-1.png'),
                      height: constraints.maxHeight / 3.5,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            StartAnimation(
                opacityright: 10,
                way: true,
                widget: Container(
                  height: constraints.maxHeight / 3,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: AssetImage('assets/light-2.png'),
                        height: constraints.maxHeight / 6,
                      )),
                )),
          ],
        ),
      ],
    );

Widget medium_phone_stack(BoxConstraints constraints) => Stack(
      alignment: Alignment.topCenter,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_literals_to_create_immutables

        Image(image: AssetImage('assets/photo.jpg')),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            StartAnimation(
              opacityTop: 2,
              way: true,
              widget:
                  //
                  Container(
                height: 220,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/clock.png'),
                      height: 120,
                    )),
              ),
            ),
            StartAnimation(
              opacityTop: 2,
              way: true,
              widget: Container(
                height: 220,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/light-1.png'),
                    )),
              ),
            ),
            StartAnimation(
                opacityTop: 2,
                way: true,
                widget: Container(
                  height: 220,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: AssetImage('assets/light-2.png'),
                        height: 120,
                      )),
                )),
          ],
        ),
      ],
    );

Widget large_phone_stack(BoxConstraints constraints) => Stack(
      alignment: Alignment.topCenter,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_literals_to_create_immutables

        Image(
          image: AssetImage('assets/photo.jpg'),
          height: constraints.maxHeight / 4,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            StartAnimation(
              way: true,
              opacityright: 10,
              widget:
                  //
                  Container(
                height: constraints.maxHeight / 4,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/clock.png'),
                    )),
              ),
            ),
            StartAnimation(
              opacityright: 25,
              way: true,
              widget: Container(
                height: constraints.maxHeight / 3,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/light-1.png'),
                      height: constraints.maxHeight / 3.5,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            StartAnimation(
                opacityright: 10,
                way: true,
                widget: Container(
                  height: constraints.maxHeight / 3,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: AssetImage('assets/light-2.png'),
                        height: constraints.maxHeight / 6,
                        fit: BoxFit.fill,
                      )),
                )),
          ],
        ),
      ],
    );

Widget small_medium_tablet_stack(BoxConstraints constraints) => Stack(
      alignment: Alignment.topCenter,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_literals_to_create_immutables

        Image(
          image: AssetImage('assets/photo.jpg'),
          height: constraints.maxHeight / 2.5,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            StartAnimation(
              way: true,
              opacityright: 10,
              widget:
                  //
                  Container(
                height: constraints.maxHeight / 3.5,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/clock.png'),
                      height: constraints.maxHeight / 10,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            StartAnimation(
              opacityright: 25,
              way: true,
              widget: Container(
                height: constraints.maxHeight / 3,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/light-1.png'),
                      height: constraints.maxHeight / 2.5,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            StartAnimation(
                opacityright: 10,
                way: true,
                widget: Container(
                  height: constraints.maxHeight / 3,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: AssetImage('assets/light-2.png'),
                        height: constraints.maxHeight / 4,
                        fit: BoxFit.fill,
                      )),
                )),
          ],
        ),
      ],
    );

Widget large_tablet_stack(BoxConstraints constraints) => Stack(
      alignment: Alignment.topCenter,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_literals_to_create_immutables

        Image(
          image: AssetImage('assets/photo.jpg'),
          height: constraints.maxHeight / 2.5,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            StartAnimation(
              way: true,
              opacityright: 10,
              widget:
                  //
                  Container(
                height: constraints.maxHeight / 3,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/clock.png'),
                      height: constraints.maxHeight / 10,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            StartAnimation(
              opacityright: 25,
              way: true,
              widget: Container(
                height: constraints.maxHeight / 2.5,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/light-1.png'),
                      height: constraints.maxHeight / 2.5,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            StartAnimation(
                opacityright: 10,
                way: true,
                widget: Container(
                  height: constraints.maxHeight / 2.5,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: AssetImage('assets/light-2.png'),
                        height: constraints.maxHeight / 4,
                        fit: BoxFit.fill,
                      )),
                )),
          ],
        ),
      ],
    );

// padding
const double padding_page = 15.0;
const double padding_tablet_page = 35.0;
const double small_medium_tablet_paddingicon = 10;
const double large_tablet_paddingicon = 20;
//spaces
const double small_phone_space_height = 5.0;
const double small_medium_tablet_space_height = 20.0;
const double large_tablet_space_height = 40.0;

//fonts
const double small_medium_phone_tilte = 30;
const double small_medium_phone_subtitle = 15;
const double large_phone_tilte = 40;
const double large_phone_subtilte = 25;
const double large_phone_subtilte2 = 20;
const double tablet_title = 80;
const double tablet_tilte2 = 50;
const double tablet_subtilte = 30;
const double tablet_subtilte2 = 40;
const double tablet_subtilte3 = 60;

//icon sizes
const double small_medium_tablet_iconsize = 36;
const double large_tablet_iconsize = 45;
