import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/costum_text_field.dart';

class SignScreen extends StatefulWidget {
  SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

// intialize controllers to receive email and password in .
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool isRememberMe = false;
  var _pref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Sign in',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              CustomTextForm(
                emailController: _emailController,
                hint: "assemayman136@gmail.com",
                icon1: Icons.email_outlined,
                lable: "email",
                keyboardType: TextInputType.emailAddress,
                validate: validateEmail,
              ),
              CustomTextForm(
                validate: validatePassword,
                isObsecure: true,
                emailController: _passwordController,
                hint: "********",
                icon1: Icons.visibility_off_outlined,
                lable: "password",
                keyboardType: TextInputType.visiblePassword,
              ),
              CheckboxListTile(
                  title: Text("Remember me"),
                  value: isRememberMe,
                  onChanged: setRememberMe),
              Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                    onPressed: () {
                      signIn(context);
                    },
                    child: Text("Sign in")),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(val) {
    // Check if this field is empty
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    // using regular expression
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
      return "Please enter a valid email address";
    }

    // the email is valid

    return null;
  }

  String? validatePassword(val) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    var passNonNullValue = val ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Password is required");
    } else if (passNonNullValue.length < 6) {
      return ("Password Must be more than 5 characters");
    } else if (!regex.hasMatch(passNonNullValue)) {
      return ("Password should contain upper,lower,digit and Special character ");
    }
    return null;
  }

  setRememberMe(val) async {
    setState(() {
      _pref.setBool("rememberMe", val);
    });
  }

  getPassword() async {
    print(_pref.getBool("rememberMe"));
  }

  signIn(context) async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      final _pref = await SharedPreferences.getInstance();
      print(
        _pref.getString("email"),
      );
      print(
        _pref.getString("password"),
      );
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>HomeScreen() ),);
    }
  }
}
