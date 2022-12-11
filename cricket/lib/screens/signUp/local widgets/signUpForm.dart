import 'package:cricket/services/auth.dart';
import 'package:cricket/widgets/shadowContainer.dart';
import 'package:flutter/material.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cofirmPasswordController = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context,
      String fullName) async {

    try {
      String _returnString =
          await Auth().signUpUser(email, password, fullName);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Incorect Login Info"),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _fullNameController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline), hintText: "Full Name"),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _cofirmPasswordController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_open), hintText: "Confirm Password"),
          obscureText: true,
        ),
        SizedBox(height: 20.0), //sized box
        RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0),
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          onPressed: () {
            if (_passwordController.text == _cofirmPasswordController.text) {
              _signUpUser(_emailController.text, _passwordController.text,
                  context, _fullNameController.text);
            } else {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("passwords do not match"),
                duration: Duration(seconds: 2),
              ));
            }
          },
        ),
      ],
    ));
  }
}
