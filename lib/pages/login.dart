import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        welcomeTitle(),
        formLogin(),
        SizedBox(height: 20.0),
        buttonSignin(),
        forgotPassword()
      ],
    );
  }
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
                    fontSize: 40.0, fontWeight: FontWeight.bold, height: .9))),
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
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
              labelStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black)),
              labelText: 'Enter or Username',
              border: UnderlineInputBorder()),
        ),
        SizedBox(height: 20.0),
        TextField(
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

Widget buttonSignin() {
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
              onPressed: () {}),
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
        child: Text('Forgot Pasword?',
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.blueAccent, letterSpacing: 1.0)))),
  );
}
