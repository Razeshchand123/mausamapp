import 'package:flutter/material.dart';
import 'package:mausam/worker.dart';
import 'package:mausam/myhome.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
// import './showcase.dart';
// import './workspace.dart';

class loading extends StatefulWidget {
  loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

var location = "indore";
var temp;
var humidity;
var airspeed;
var description;
var mainresult;
var icon;
var getsearchdata;

startapp(BuildContext context, String location) async {
  worker instance = worker(location: "$location");
  await instance.getdata();

  temp = (instance.temp);
  humidity = instance.humidity;
  airspeed = (instance.airspeed) / 0.27777777777778;
  description = instance.description;
  mainresult = instance.main;
  // location = instance.location;
  var icon = instance.icon;

  Navigator.pushReplacementNamed(context, '/home', arguments: {
    "temp": temp,
    "humidity": humidity,
    "airspeed": airspeed,
    "description": description,
    "mainresult": mainresult,
    "location": location,
    "icon": icon,
  });
}

class _loadingState extends State<loading> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getting search text start

    // if (getsearchdata.isNotEmpty) {
    //   var getsearchdata = ModalRoute.of(context)!.settings.arguments as Map;
    //   setState(() {
    //     location = getsearchdata['searchtext'];
    //   });
    // }
    startapp(context, location);
    // getting search text end

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            SpinKitWave(
              color: Colors.blue,
              size: 50.0,
            ),
            SizedBox(
              height: 55,
            ),
            Text(
              " WEATHER APP",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.blue,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Developd By :Razesh Chand",
              style: TextStyle(fontSize: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
