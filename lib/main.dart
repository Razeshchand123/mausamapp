import 'package:flutter/material.dart';
import 'package:mausam/loading.dart';
import 'package:mausam/myhome.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => loading(),
      '/home': (context) => myhome(),
      '/loading': (context) => loading(),
    },
    title: "mausam",
  ));
}
