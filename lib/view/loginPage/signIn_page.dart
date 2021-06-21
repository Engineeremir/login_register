import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register/constants/constants_init.dart';
import 'package:login_register/view/loginPage/register_page.dart';
import 'dart:core';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _email;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTop(context),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildForm(),
            ),
            _buildForgotPass(context),
            _buildLogin(context)
          ],
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildEmailField(),
          SizedBox(
            height: 20,
          ),
          _buildPasswordField(),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  InkWell _buildForgotPass(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage())),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        alignment: Alignment.centerRight,
        child: Text(
          customStrings.forgotpass,
          style: TextStyle(color: customColors.blue),
        ),
      ),
    );
  }

  Container _buildTop(BuildContext context) {
    return Container(
      height: 200,

      decoration: BoxDecoration(
          color: customColors.red,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))),

    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: customColors.blue, width: 3)),
        hintText: customStrings.mail,
        prefixIcon: Icon(Icons.mail),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: customColors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  InkWell _buildLogin(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_formkey.currentState!.validate()) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        } else {
          print("Tüm bilgileri doğru girmedin");
        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: customColors.blue,
        ),
        child: Center(
          child: Text(
            customStrings.login,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: customColors.blue, width: 3)),
          hintText: customStrings.sifre,
          prefixIcon: Icon(Icons.lock_outline_rounded),
          suffixIcon: Icon(Icons.remove_red_eye_outlined),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: customColors.blue))),
    );
  }
}
