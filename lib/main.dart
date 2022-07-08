import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:const TextTheme(        
          headline1: TextStyle(
              letterSpacing: 6.3,
              color: Colors.black,
              fontWeight: FontWeight.bold,fontSize: 30),
               
           bodyText1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
           bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        primaryColor:const Color(0xffEBEFF1),
      ),
      home:const HomeScreen(),
    );
  }
}
