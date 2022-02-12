import 'package:karbon_ayakizi/helpers/colors.dart';
import 'package:karbon_ayakizi/screens/calculator/user_inputs.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

const TextStyle kTextStyle = TextStyle(
  fontSize: 24.0,
  color: ColorPallete.color3,
  shadows: [
    Shadow(
      color: ColorPallete.color3,
      blurRadius: 3,
      offset: Offset(
        0.9,
        0.9,
      ),
    ),
    Shadow(
      color: ColorPallete.color3,
      blurRadius: 3,
      offset: Offset(
        1.2,
        1.2,
      ),
    ),
  ],
);

class StartScreen extends StatelessWidget {
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: FlareActor(
                  'assets/flare/WorldSpin.flr',
                  animation: 'roll',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text('Merhaba, bu güne bir değişiklik yaparak başla!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize:16.0,
                ),),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Sürdürülebilir bir dünya için günlük seyahat karbon ayak izinizi hesaplayın!',
                  style: kTextStyle.copyWith(
                    fontSize: 16,
                    color:Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomCard(
                'Seyahat',
                'assets/images/img.png',
                'travel',
              ),
              SizedBox(
                height: 8.0,
              ),


            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final String arg;
  final String routeName = UserInputs.routeName;

  CustomCard(
      this.title,
      this.image,
      this.arg,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          routeName,
          arguments: arg,
        );
      },
      child: Container(
        height: 150,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ColorPallete.cardBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                height: 130,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Text(title,
                        style: kTextStyle.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Container(
                    child: Text(
                      'Karbon ayak izini hesapla.',
                      style: TextStyle(
                        color: ColorPallete.cardHeading,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

