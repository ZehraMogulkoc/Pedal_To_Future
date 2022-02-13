import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';

import 'SignUp.dart';
import 'bottom_appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: CustomScrollView(
              slivers: [ SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Pedal To Future',
                      style: TextStyle(fontSize: 40, color:  Color(0xFF65AC46),fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.lock),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          labelText: "Şifre",
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 30,
                    ),

                    SizedBox(height: 15),
                    FlatButton(

                      onPressed: () async {
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => BottomNavBar()));
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: "Şifre veya Email yanlış. Lütfen tekrar dene",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 20.0);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },


                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color:  Color(0xFF65AC46),
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      child: Text('Giriş Yap',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),


                    SizedBox(height: 15),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp()));
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Color(0xFF0C3102) ,
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      child: Text('Üye Ol!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),



                  ],
                ),

              ),],

            ),
          ),
        ),
      ),
    );
  }

}





