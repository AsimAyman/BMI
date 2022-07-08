import 'package:flutter_application_1/style.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:lottie/lottie.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer({
    required this.child,
    required this.ispPressed,
    Key? key,
  }) : super(key: key);
  final Widget child;
  bool ispPressed;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // child: Lottie.asset("assets/male.json"),
      child:widget.child,
      duration: const Duration(microseconds: 200),
      margin: const EdgeInsets.all(20),
      height: .25 * getHeight(context),
      width: .25 * getWidh(context),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: const Color(0xffa7a9af),
              offset: const Offset(10, 10),
              inset: widget.ispPressed,
            ),
            const BoxShadow(
              blurRadius: 30,
              color: Colors.white,
              offset: Offset(-10, -10),
            ),
          ]),
      //   child:  Lottie.asset("name"),
    );
  }
}
