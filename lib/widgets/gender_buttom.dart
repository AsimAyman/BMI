import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/customContainer.dart';
import 'package:lottie/lottie.dart';

class GenderButtom extends StatefulWidget {
  const GenderButtom({Key? key}) : super(key: key);

  @override
  State<GenderButtom> createState() => _GenderButtomState();
}

class _GenderButtomState extends State<GenderButtom> {
  bool ispPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ispPressed = !ispPressed;
        });
      },
      child: CustomContainer(
        child: Container(),
        ispPressed: ispPressed,
      ),
    );
  }
}
