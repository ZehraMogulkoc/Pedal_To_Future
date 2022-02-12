import 'package:karbon_ayakizi/helpers/colors.dart';
import 'package:karbon_ayakizi/helpers/text_theme.dart';
import 'package:karbon_ayakizi/screens/home/startScreen.dart';
import 'package:flutter/material.dart';

class ReduceEmissionScreen extends StatelessWidget {
  static final routeName = "/reduce-carbon-footprint";

  List<Widget> getWidgetTree() {
    List reduceCarbonFootPrintmsgs = [

      {
        'icon': Icons.card_travel,
        'title': 'İşe gidip gelmenizden kaynaklanan emisyonları azaltın',
        'options': [
          {
            'icon': Icons.do_not_disturb_alt,
            'message': 'Gereksiz yere hız yapmayın, hızlanma  kilometreyi %33 e kadar arttırır, atık gaz, para ve karbon salınımını arttırır',
          },
          {
            'icon': Icons.done_outline,
            'message': 'Mümkünse, karbon emisyonunu tamamen önlemek için yürüyün veya bisiklete binin',
          },
          {
            'icon': Icons.do_not_disturb_alt,
            'message':' Mümkün olduğu kadar toplu taşıma araçlarını kullanın, özel araç kullanımı azaltın',
          },
        ]
      },

    ];

    List<Widget> parentWidgetTree = [];

    for (var reduceEmissionData in reduceCarbonFootPrintmsgs) {
      List<Widget> widgetTree = [];

      widgetTree.add(
        SizedBox(
          height: 15,
        ),
      );

      Widget cardHeader = ListTile(
        leading: Icon(
          reduceEmissionData['icon'],
          color: ColorPallete.color3,
        ),
        title: CoolText(
          reduceEmissionData['title'],
          fontSize: 17, letterSpacing:1.0,
        ),
      );

      widgetTree.add(cardHeader);

      List<Widget> sectionDivider = [
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 1,
            color: ColorPallete.color6,
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ];

      widgetTree = [...widgetTree, ...sectionDivider];

      for (var option in reduceEmissionData['options']) {
        Widget optionWidget = ListTile(
          leading: Icon(
            option['icon'],
            color: ColorPallete.color3,
          ),
          title: Text(
            option['message'],
            style: TextStyle(
              color: ColorPallete.color3,
            ),
          ),
        );

        widgetTree.add(optionWidget);
      }

      widgetTree.add(
        SizedBox(
          height: 10,
        ),
      );

      Widget parentWidget = Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: ColorPallete.cardBackground,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgetTree,
            ),
          ),
        ),
      );

      parentWidgetTree.add(parentWidget);
    }

    return parentWidgetTree;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   color: ColorPallete.cardBackground,
            //   child: SizedBox(
            //     height: MediaQuery.of(context).size.height / 6,
            //     width: double.infinity,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(10),
            //           child: CoolText(
            //             "Reduce your carbon footprint",
            //             fontSize: 18,
            //             letterSpacing: 1.1,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            ...getWidgetTree(),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: ColorPallete.cardBackground.withBlue(150),
        onPressed: () {
          Navigator.pushNamed(
            context,
            StartScreen.routeName,
          );
        },
        label: Text(
          "Home",
          style: TextStyle(
            color: ColorPallete.color3,
          ),
        ),
        icon: Icon(
          Icons.home,
          color: ColorPallete.color3,
        ),
      ),
    );
  }
}