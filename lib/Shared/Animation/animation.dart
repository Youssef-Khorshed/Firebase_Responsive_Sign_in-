import 'package:flutter/cupertino.dart';

class StartAnimation extends StatelessWidget {
  Widget widget;
  bool way;
  int? opacityTop;
  int? opacityright;
  StartAnimation(
      {required this.widget,
      required this.way,
      this.opacityright,
      this.opacityTop});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: widget,
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 1500),
        builder: (BuildContext context, double opacity, Widget? child) {
          return Opacity(
            opacity: opacity,
            child: Padding(
              child: child,
              padding: way
                  ? EdgeInsets.only(right: opacity * (opacityright ?? 35))
                  : EdgeInsets.only(top: opacity * (opacityTop ?? 2)),
            ),
          );
        });
  }
}
