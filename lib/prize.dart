import 'package:flutter/cupertino.dart';

class Prize with ChangeNotifier {
   int id;
   String url;
   String title;
   String shortDescription;


  Prize({
    required this.id,
    required this.url,
    required this.title,
    required this.shortDescription,
  });


}
