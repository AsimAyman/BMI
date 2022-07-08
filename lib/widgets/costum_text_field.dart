import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTextForm extends StatefulWidget {
  CustomTextForm({
    Key? key,
    required TextEditingController emailController,
    this.hint = "",
    required this.lable,
    required this.icon1,
    this.icon2 = Icons.visibility_outlined,
    this.isObsecure = false,
    this.keyboardType = TextInputType.name,
    
    required this.validate,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;
  final String lable;
  String hint;
  final IconData icon1, icon2;
  final TextInputType keyboardType;
  final validate;
  bool isObsecure;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool isPasswordField() {
    return widget.lable == "password" ? true : false;
  }

  changeIsObscure() {
    setState(() {
      widget.isObsecure = !widget.isObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        validator: widget.validate,
        onSaved: onSave,
        keyboardType: widget.keyboardType,
        obscureText: widget.isObsecure,
        controller: widget._emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.teal),
          ),
          label: Text(widget.lable),
          labelStyle: const TextStyle(color: Colors.teal),
          suffixIcon: isPasswordField()
              ? IconButton(
                  icon: Icon(widget.isObsecure ? widget.icon1 : widget.icon2,
                      color: Colors.teal),
                  onPressed: changeIsObscure,
                )
              : Icon(
                  widget.icon1,
                  color: Colors.teal,
                ),
          hintText: widget.hint,
        ),
      ),
    );
  }

  onSave(val) async {
    final _pref = await SharedPreferences.getInstance();
    _pref.setString(widget.lable, val);
    print("saveeeed");
  }
}
