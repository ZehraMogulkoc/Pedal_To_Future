import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Prizes extends StatefulWidget {
  const Prizes({Key? key}) : super(key: key);

  @override
  _PrizesState createState() => _PrizesState();
}

class _PrizesState extends State<Prizes> {

  final List <String> _listItem = [
    'assets/images/bisiklet.jpeg',
    'assets/images/e-scooter.jpg',
    'assets/images/bus_card.jpg',
    'assets/images/netflix.png',
    'assets/images/cini.jpg',
    'assets/images/ticket.jpg',
    'assets/images/comlek.jpg',
    'assets/images/bg2.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/prize4.jpg'),
              fit: BoxFit.cover,
            ),),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(.6),
                  Colors.black.withOpacity(.1)],
                ),
              ),
              child: Center(child: Text('Prizes',style: TextStyle(
                fontSize: 50,
                fontFamily: 'Amatic SC',
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),)),
            ),
          ),
          Expanded(
            child:GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: _listItem.map((item) => Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              )).toList(),
            )
          ),
        ],
      ),
    );
  }
}
