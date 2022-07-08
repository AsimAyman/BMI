import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_application_1/style.dart';
import 'package:flutter_application_1/widgets/customContainer.dart';

class InputContainer extends StatefulWidget {
   InputContainer({
    required this.title,
    required this.val,
    Key? key,
  }) : super(key: key);
  final String title;
  int val = 0;

  @override
  State<InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        CustomContainer(
          ispPressed: false,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: .09 * getHeight(context),
                  width: .13 * getWidh(context),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: const Color(0xffa7a9af),
                        offset: const Offset(10, 10),
                        inset: true,
                      ),
                      BoxShadow(
                        blurRadius: 30,
                        color: Colors.white,
                        offset: Offset(-10, -10),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    '${widget.val}',
                    style: Theme.of(context).textTheme.bodyText2,
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                        child: Icon(Icons.add), onPressed: increase),
                    FloatingActionButton(
                        child: Icon(Icons.remove), onPressed:decrease),
                  ],
                )
              ]),
          // ),
        )
      ],
    );
  }

  increase() {
    setState(() {
      widget.val++;
    });
  }
  decrease(){
   setState(() {
      widget.val--;
    });
  }
}
