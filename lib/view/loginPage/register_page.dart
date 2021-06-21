import 'package:flutter/material.dart';
import 'package:login_register/constants/constants_init.dart';
import 'package:login_register/view/loginPage/signIn_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _email;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTop(),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildForm(),
            ),
            _buildRegister(context)
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
          _buildNameField(),
          SizedBox(
            height: 20,
          ),
          _buildEmailField(),
          SizedBox(
            height: 20,
          ),
          _buildPhoneField(),
          SizedBox(
            height: 20,
          ),
          _buildPasswordField(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Container _buildTop() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: customColors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
    );
  }

  TextFormField _buildNameField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: customColors.blue),
            borderRadius: BorderRadius.circular(20)),
        hintText: customStrings.name,
        prefixIcon: Icon(Icons.person_add),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: customColors.blue, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
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
        validator: (String? value) {
          if (value!.isEmpty) {
            return "enter an email";
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return 'Please enter a valid Email';
          }
        });
  }

  TextFormField _buildPhoneField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: customColors.blue, width: 3)),
            hintText: customStrings.phone,
            labelText: customStrings.phone,
            prefixIcon: Icon(Icons.phone),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: customColors.blue, width: 3))),
        validator: (String? value) {
          if (value!.isEmpty) {
            return "enter an Phone Number";
          }
          if (value.length < 9) {
            return 'Please enter a valid Phone Number';
          }
        });
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
          labelText: customStrings.sifre,
          prefixIcon: Icon(Icons.lock_outline_rounded),
          suffixIcon: Icon(Icons.remove_red_eye_outlined),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: customColors.blue, width: 3))),
    );
  }

  InkWell _buildRegister(BuildContext context) {
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
        margin: EdgeInsets.all(5),
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: customColors.orange,
        ),
        child: Center(
          child: Text(
            customStrings.register,
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
}
