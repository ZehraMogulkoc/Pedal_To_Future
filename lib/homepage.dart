import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/bg5.jpg'),fit: BoxFit.fill),),
      child: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.6),
          child: Center(child: Text('Hos geldin User! Hadi baslayalim',style: TextStyle(
            color: Colors.white,
            fontFamily: 'Architects Daughter',
            fontSize: 24,
          ),)),
        ),
      ),
    );
  }
}
