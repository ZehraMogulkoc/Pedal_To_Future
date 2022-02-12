import 'package:flutter/material.dart';

class Questions with ChangeNotifier {

  List _travelQuestions = [
    'Bisikletle gidilen mesafe nedir?',
    'Arabanın kat ettiği mesafe nedir?',
    'Bisikletin kat ettiği mesafe nedir?',

  ];


  get travelQuestions {
    return _travelQuestions;
  }


}