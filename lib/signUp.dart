import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final _auth=FirebaseAuth.instance;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  CollectionReference userRef= FirebaseFirestore.instance.collection('Data');

  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pedal To Future'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(

          image: DecorationImage(
            image: AssetImage('assets/images/bg1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white10.withOpacity(0.6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextMethod('Kullanıcı Adını Giriniz'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Kullanıcı Adı",
                          labelStyle: TextStyle(
                            color: Colors.white,
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
                      height: 20,
                    ),
                    TextMethod('Email Giriniz'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.white,
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

                    TextMethod('6 Haneli Şifreyi Giriniz'),

                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Şifre",
                          labelStyle: TextStyle(
                            color: Colors.white,
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
                            Colors.green),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )),

                      ),

                      onPressed: () async {
                        Map<String, dynamic> Data={'Email': email,'Name': name};
                        userRef.doc(email).set(Data);

                        try {
                          final newUser = await _auth
                              .createUserWithEmailAndPassword(email: email,
                              password: password);
                          if(newUser!= null){

                            Fluttertoast.showToast(
                                msg: "Hesap Başarıyla Oluşturuldu",
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
                        }
                      },
                      child: Text(
                        'Hesabı Oluştur',
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
        color: Colors.green,
        fontSize: 20,
      ),
    ),
  );
}
