import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mausam/loading.dart';

class myhome extends StatefulWidget {
  const myhome({Key? key}) : super(key: key);

  @override
  _myhomeState createState() => _myhomeState();
}

var searchcontroller = TextEditingController();
var data;
Color tabcolor = Colors.white38;
String icon = "";

class _myhomeState extends State<myhome> {
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    print(data['humidity']);
    setState(() {
      icon = data['icon'];
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blueGrey,
                Colors.lightBlueAccent,
              ]),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchcontroller,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "search",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: 3.0,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // print(searchcontroller.text);
                          if (searchcontroller.text.isEmpty) {
                            print("no search");
                          } else {
                            Navigator.pushNamed(context, '/loading',
                                arguments: {
                                  "searchtext": searchcontroller.text,
                                });
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // search end
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              "http://openweathermap.org/img/wn/$icon@2x.png",
                            ),
                            Column(
                              children: [
                                Text(
                                  data['mainresult'],
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "in",
                                  style: TextStyle(color: Colors.white),
                                ),
                                // Text(data['description'].toString()),
                                Text(
                                  data['location'].toString().toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 4.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Text(data['location']),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //  big containet  stsrt
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 230.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        decoration: BoxDecoration(
                          color: tabcolor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thermostat,
                              size: 90.0,
                              color: Colors.white,
                            ),
                            Text(
                              data['temp'].toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 45.0),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "C",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //  big containet  end
                // two container cover start
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        decoration: BoxDecoration(
                          color: tabcolor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Air speed",
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 4.0,
                                  fontSize: 13.0),
                            ),
                            Icon(
                              Icons.air,
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data['airspeed'].toString().substring(1, 5),
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "km/hr",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        decoration: BoxDecoration(
                          color: tabcolor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Humidity",
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 4.0,
                                  fontSize: 13.0),
                            ),
                            Icon(
                              Icons.invert_colors,
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data['humidity'].toString(),
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "%",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // two container cover end
                // footr part start here
                SizedBox(
                  height: 10.0,
                ),
                // footr part start here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
