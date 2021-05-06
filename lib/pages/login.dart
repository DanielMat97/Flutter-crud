import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// models
import 'package:crud/models/users.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variables
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  String mensaje = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 80.0),
          welcomeTitle(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              mensaje,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.red, fontSize: 10.0)),
            ),
          ),
          formLogin(),
          SizedBox(height: 20.0),
          buttonSignin(context),
          forgotPassword()
        ],
      ),
    ));
  }

  Widget welcomeTitle() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      height: .9))),
          Text('Back',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      height: .9)))
        ],
      ),
    );
  }

  Widget formLogin() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: Column(
        children: [
          TextField(
            controller: controllerEmail,
            decoration: InputDecoration(
                labelStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.black)),
                labelText: 'Email or Username',
                border: UnderlineInputBorder()),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: controllerPass,
            obscureText: true,
            decoration: InputDecoration(
                labelStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.black)),
                labelText: 'Password',
                border: UnderlineInputBorder()),
          ),
        ],
      ),
    );
  }

  Widget buttonSignin(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sign In',
              style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(.2),
                      spreadRadius: 5.0,
                      blurRadius: 7.0,
                      offset: Offset(0, 3))
                ]),
            height: 40.0,
            width: 40.0,
            child: IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {
                  loginUser(context);
                }),
          )
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextButton(
          onPressed: () {},
          child: Text('Forgot Pasword ?',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.blueAccent, letterSpacing: 1.0)))),
    );
  }

  void loginUser(context) async {
    if (controllerEmail.text.isNotEmpty && controllerPass.text.isNotEmpty) {
      try {
        final UserModel userToken =
            await getLogin(controllerEmail.text, controllerPass.text);
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        setState(() {
          mensaje = 'Server Error Internal';
        });
      }
    } else {
      setState(() {
        mensaje = 'Please complete form';
      });
    }
  }

  Future<UserModel> getLogin(username, password) async {
    final String urlApiUsers = '192.168.0.20:3000';
    final response = await http.post(
        Uri.http(urlApiUsers, '/api/users/v1/login'),
        body: {'user': username, 'pass': password});
    if (response.statusCode == 200) {
      // usuario correcto
      final String responseString = response.body;
      return userModelFromJson(responseString);
    } else if (response.statusCode == 404) {
      // usuario no encontrado
      setState(() {
        mensaje = 'User not found';
      });
      return userModelFromJson('');
    } else if (response.statusCode == 401) {
      // contraseña erronea
      setState(() {
        mensaje = 'Wrong password';
      });
      return userModelFromJson('');
    }
  }
}
