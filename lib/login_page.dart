import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:meditation_app/src/services/GoHomePage.dart';
import 'homepage.dart';
//import 'package:meditation_app/src/screens/SignUp.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:meditation_app/src/services/fingerprint.dart';
//import 'package:meditation_app/src/services/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'bottom_appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  //final _auth = FirebaseAuth.instance;

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
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), // 0 = Colored, 1 = Black & White
              BlendMode.saturation,)
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.4),
              child: CustomScrollView(
                slivers: [ SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /*Container(
                          width: 150,
                          height: 150,
                          child: Image(
                              image: AssetImage('assets/images/blue hair girl.png')),
                        ),*/
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Take Care Of You',
                          style: TextStyle(fontSize: 30, color: Colors.cyan),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              prefixIcon: Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              labelText: "Your Email",
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
                            textAlign: TextAlign.start,
                            obscureText: true,
                            decoration: InputDecoration(
                              //contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              prefixIcon: Icon(Icons.lock),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              labelText: "Your Password",
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
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => BottomNavBar()));
                            });
                            /*try {
                              final user = await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                              if (user != null) {
                                setState(() {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Home()));
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Email or password is wrong, try again",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 20.0);
                              }
                            } catch (e) {
                              print(e);
                            }*/
                          },


                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Color(0xFF65AC46),
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          child: Text('Sign In ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                        ),


                        SizedBox(height: 15),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              //Navigator.push(context,
                                 // MaterialPageRoute(builder: (context) => SignUp()));
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Color(0xFF0C3102),
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          child: Text('Sign Up!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                        ),
                        //GoogleButton(),


                      ],
                    ),
                  ),

                ),],

              ),
            ),
          ),
        ),
      ),
    );
  }

}
/*class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> GoogleSignInProvider(),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            SignInButton(
              Buttons.Google,
              text: "Sign in with Google",
              onPressed: () {

                final provider=Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();

              },
            ),
          ],
        ));
  }
}*/