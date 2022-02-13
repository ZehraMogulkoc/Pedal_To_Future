import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;


    var currentUser=FirebaseFirestore.instance.collection('Data').doc(user?.email);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/bg5.jpg'),fit: BoxFit.fill),),
      child: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.6),
          child: Center(child: StreamBuilder(stream: currentUser.snapshots(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if(snapshot.hasData){
    return Text("Hoşgeldin ${snapshot.data.data()['Name']}!  Haydi başlayalım ",style: TextStyle(color: Colors.white,fontSize: 40),); }
    else{
    return CircularProgressIndicator();
    }
    }),
        ),
      ),
    ));
  }
}
