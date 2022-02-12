import 'package:karbon_ayakizi/helpers/colors.dart';
import 'package:karbon_ayakizi/screens/home/startScreen.dart';
import 'package:karbon_ayakizi/screens/reduce/reduce_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './screens/result/result_screen.dart';
import './screens/calculator/user_inputs.dart';
import './screens/calculator/user_input_questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Questions())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'C1O2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          cursorColor: ColorPallete.color3,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPallete.color3,
                )),
          ),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: StartScreen.routeName,
        // home: ResultScreen(
        //         activityName: "Household",
        //         userEmission: 70,
        //         averageEmission: 50,
        //       ),//HomeScreen.routeName,
        routes: {
          StartScreen.routeName: (context) => StartScreen(),
          UserInputs.routeName: (context) => UserInputs(),
          ReduceEmissionScreen.routeName: (context) => ReduceEmissionScreen(),
        },
      ),
    );
  }
}