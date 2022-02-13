import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_page.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

var name;

class _SignUpState extends State<SignUp> {
  //final _auth=FirebaseAuth.instance;
  //FirebaseFirestore firestore=FirebaseFirestore.instance;
  //CollectionReference userRef= FirebaseFirestore.instance.collection('Data');

  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.jpg'),
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), // 0 = Colored, 1 = Black & White
              BlendMode.saturation,),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(.6),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 100,),
                    TextMethod('Enter Username'),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          labelText: "Username",
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          name = value;

                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextMethod('Enter Your Email'),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
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
                      height: 40,
                    ),

                    TextMethod('Enter Password'),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF65AC46)),
                          ),
                          labelText: "Password",
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
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF65AC46)),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )),

                      ),

                      onPressed: () async {
                        /*Map<String, dynamic> userData={'Email': email,'Name': name};
                        //userRef.doc(email).set(userData);

                        try {
                          final newUser = await _auth
                              .createUserWithEmailAndPassword(email: email,
                              password: password);
                          if(newUser!= null){

                            Fluttertoast.showToast(
                                msg: "Account created successfully",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.cyan,
                                textColor: Colors.white,
                                fontSize: 20.0);
                            setState(() {
                              //  showProgress = false;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            });
                          }
                        }
                        catch(e){
                          print(e);
                        }*/
                      },
                      child: Text(
                        'Hesap Olustur',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



TextMethod(String value) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: Text(
      value,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color(0xFF759C72),
        fontSize: 20,
      ),
    ),
  );
}
