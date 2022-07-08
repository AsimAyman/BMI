import 'package:flutter_application_1/screens/input_container.dart';
import 'package:flutter_application_1/screens/result.dart';
import 'package:flutter_application_1/widgets/customContainer.dart';
import 'package:flutter_application_1/style.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_application_1/widgets/gender_buttom.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double tall = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "BMI",
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Hello There, Welcome to BMI",
                  style: Theme.of(context).textTheme.bodyText1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  GenderButtom(),
                  GenderButtom(),
                ],
              ),
              Text(
                "HEIGHT",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                "${tall.roundToDouble()} cm",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Slider(
                  value: tall,
                  min: 60,
                  max: 200,
                  inactiveColor: Colors.grey,
                  activeColor: textColor,
                  onChanged: (val) {
                    setState(() {
                      tall = val;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputContainer(
                    title: "WEIGHT",
                    val: 65,
                  ),
                  InputContainer(
                    title: "AGE",
                    val: 18,
                  ),
                ],
              ),
                Container(
                  width: .8 * getWidh(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => ResultScreen()));
                      },
                      child: Text("CALCULATE YOUR BMI")))
            ],
          ),
        ),
      ),
    );
  }
}
