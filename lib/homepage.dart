import 'package:flutter/material.dart';
import 'prizes.dart';
import 'bottom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavBar()));
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/bg5.jpg'),fit: BoxFit.cover),),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hos geldin User! Hadi baslayalim',style: TextStyle(
                color: Colors.white,
                fontFamily: 'Architects Daughter',
                fontSize: 20,
              ),),
              SizedBox(height: 50,),
              Text('(Devam etmek icin ekrana dokun)',style: TextStyle(
                color: Colors.white,
                fontFamily: 'Architects Daughter',
                fontSize: 15,
              ),),

            ],
          ),
        ),
      ),
    );
  }
}
