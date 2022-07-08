import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

const Color textColor = Color(0xff9AA0FF);

const Color maleColor = Color(0xff4BC0DA);
const Color femaleColor = Color(0xffE4438D);
List<BoxShadow> boxShadow = const [
  BoxShadow(
    blurRadius: 10,
    color: const Color(0xffa7a9af),
    offset: const Offset(10, 10),
   
  ),
  BoxShadow(
    blurRadius: 30,
    color: Colors.white,
    offset: Offset(-10, -10),
     inset: true,
  ),
];


double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
double getWidh(BuildContext context) => MediaQuery.of(context).size.width;


double radius=16.0
 ;
