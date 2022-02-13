import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/prizes.dart';
import 'package:health/health.dart';
import 'dart:math';

import 'bottom_appbar.dart';
String? accessCode;
String generateAccescode({
  bool letter = true,
  bool isNumber = true,
  bool isSpecial = true,
}) {
  final length = 15;
  final letterLowerCase = "abcçdefghıijklmnopqrstuüvwxyz";
  final letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final number = '0123456789';
  final special = '@#%^*>\$@?/[]=+';

  String chars = "";
  if (letter) chars += '$letterLowerCase$letterUpperCase';
  if (isNumber) chars += '$number';
  if (isSpecial) chars += '$special';


  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars [indexRandom];
  }).join('');
}
Widget card() {
  return Card(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 80.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'assets/images/yesil.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
                child: FittedBox(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Text(
                      'Erişim Kodu: '+ generateAccescode(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),

              )

            ],
          ),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text('SHARE',style: TextStyle(color: Colors.greenAccent)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('EXPLORE',style: TextStyle(color: Colors.greenAccent)),
            ),
          ],
        ),
      ],
    ),
  );
}



class DailyStepsCount extends StatefulWidget {
  @override
  _DailyStepsCountState createState() => _DailyStepsCountState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_NOT_ADDED,
  STEPS_READY,
}

class _DailyStepsCountState extends State<DailyStepsCount> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;
  int _nofSteps = 10;
  double _mgdl = 10.0;

  // create a HealthFactory for use in the app
  HealthFactory health = HealthFactory();



  /// Fetch data points from the health plugin and show them in the app.
  Future fetchData() async {
    setState(() => _state = AppState.FETCHING_DATA);

    // define the types to get
    final types = [
      HealthDataType.STEPS,
      HealthDataType.WORKOUT,

      // Uncomment this line on iOS - only available on iOS
      // HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    // with coresponsing permissions
    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    // get data within the last 24 hours
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 1));

    // requesting access to the data types before reading them
    // note that strictly speaking, the [permissions] are not
    // needed, since we only want READ access.
    bool requested =
    await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      try {
        // fetch health data
        List<HealthDataPoint> healthData =
        await health.getHealthDataFromTypes(yesterday, now, types);

        // save all the new data points (only the first 100)
        _healthDataList.addAll((healthData.length < 100)
            ? healthData
            : healthData.sublist(0, 100));
      } catch (error) {
        print("Exception in getHealthDataFromTypes: $error");
      }

      // filter out duplicates
      _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

      // print the results
      _healthDataList.forEach((x) => print(x));

      // update the UI to display the results
      setState(() {
        _state =
        _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      });
    } else {
      print("Authorization not granted");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  /// Add some random health data.
  Future addData() async {
    final now = DateTime.now();
    final earlier = now.subtract(Duration(minutes: 5));

    _nofSteps = Random().nextInt(10);
    final types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
    final rights = [HealthDataAccess.WRITE, HealthDataAccess.WRITE];
    final permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    bool? hasPermissions =
    await HealthFactory.hasPermissions(types, permissions: rights);
    if (hasPermissions == false) {
      await health.requestAuthorization(types, permissions: permissions);
    }

    _mgdl = Random().nextInt(10) * 1.0;
    bool success = await health.writeHealthData(
        _nofSteps.toDouble(), HealthDataType.STEPS, earlier, now);

    if (success) {
      success =
      await health.writeHealthData(_mgdl, HealthDataType.WORKOUT, now, now);
    }

    setState(() {
      _state = success ? AppState.DATA_ADDED : AppState.DATA_NOT_ADDED;
    });
  }

  /// Fetch steps from the health plugin and show them in the app.
  Future fetchStepData() async {
    int? steps;

    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        print("Caught exception in getTotalStepsInInterval: $error");
      }

      print('Bugünkü toplam adım: $steps');

      setState(() {
        if (steps! >= 0) {
          accessCode=generateAccescode();
          _showToast(context,steps);
        }
        else{
          accessCode='Erişim kodu bulunmamakta';
        }
        _nofSteps = (steps == null) ? 0 : steps;
        _state = (steps == null) ? AppState.NO_DATA : AppState.STEPS_READY;
      });
    } else {
      print("Authorization not granted");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              strokeWidth: 10,
            )),
        Text('Fetching data...')
      ],
    );
  }

  Widget _contentDataReady() {
    return ListView.builder(
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text('${p.unitString}'),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return Column(
      children: [
        Text('Geleceğe Adım At',
            style: TextStyle(
              color: Color(0xFF3E503C),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget _authorizationNotGranted() {
    return Text('Authorization not given. '
        'For Android please check your OAUTH2 client ID is correct in Google Developer Console. '
        'For iOS check your permissions in Apple Health.');
  }

  Widget _dataAdded() {
    return Text('$_nofSteps steps and $_mgdl mgdl are inserted successfully!');
  }

  Widget _stepsFetched() {
    return Text(
      'Bugünkü toplam adım sayısı: $_nofSteps',
      style: TextStyle(
        color: Color(0xFF3E503C),
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _dataNotAdded() {
    return Text('Failed to add data');
  }

  Widget _content() {
    if (_state == AppState.DATA_READY)
      return _contentDataReady();
    else if (_state == AppState.NO_DATA)
      return _contentNoData();
    else if (_state == AppState.FETCHING_DATA)
      return _contentFetchingData();
    else if (_state == AppState.AUTH_NOT_GRANTED)
      return _authorizationNotGranted();
    else if (_state == AppState.DATA_ADDED)
      return _dataAdded();
    else if (_state == AppState.STEPS_READY)
      return _stepsFetched();
    else if (_state == AppState.DATA_NOT_ADDED) return _dataNotAdded();

    return _contentNotFetched();
  }
  void _showToast(BuildContext context, int steps) {
    int   count=0;



    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        SnackBar(duration: Duration(days: 1),
backgroundColor: Colors.green,
          content: const Text('Ödül Kazandın'),
          action: SnackBarAction(
              label: 'Ödüle git', onPressed:(){ if (steps >= 1000&&steps<2000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailScreen(count: 0)),
            );
          }
          if (steps >= 2000&&steps<3000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailScreen(count: 1)),
            );
          }
          if (steps >= 3000&&steps<4000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailScreen(count: 2)),
            );
          }
          if (steps >= 4000&&steps<5000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailScreen(count: 3)),
            );
          }
          if (steps >= 5000&&steps<6000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailScreen(count: 4)),
            );
          }
          if (steps >= 6000&&steps<7000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailScreen(count: 5)),
            );
          }
          if (steps >= 7000&&steps<8000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailScreen(count: 6)),
            );
          }
          if (steps >= 8000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailScreen(count: 7)),
            );
          }} ), ));

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg7.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.white.withOpacity(0.6),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Uzun bir mesafeye konfor alanından çıkarak sürdürülebilir ulaşım modlarını kullan. Hem doğanın hem de bizim sana vereceğimiz bazı hediyelerin tadını çıkar :)',style:
                    TextStyle(color: Color(0xFF0C3102),fontSize: 18)),
                  ),),
                ),
                SizedBox(height: 20),
                Card(
                  color: Colors.green.withOpacity(0.6),
                  elevation: 3,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.greenAccent,
                      width: 2.0,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                      right: 20,
                      left: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        _content(),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    fetchStepData();
                  },
                  child: Text(
                    'Toplam Adım Sayısı',
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF3E503C),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


