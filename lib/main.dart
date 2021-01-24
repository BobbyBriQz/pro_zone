import 'package:flutter/material.dart';
import 'package:pro_zone/ui/add_provider.dart';
import 'package:pro_zone/ui/home.dart';
import 'package:pro_zone/ui/update_provider.dart';
import 'package:pro_zone/ui/view_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProZone',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: "/home",

      routes: {
        "/home" : (context)=> Home(),
        "/viewProvider": (context)=> ViewProvider(),
        "/addProvider": (context)=> AddProvider(),
        "/updateProvider": (context)=> UpdateProvider(),
      },
    );
  }
}
