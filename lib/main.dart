import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_zone/bloc/AppBloc.dart';
import 'package:pro_zone/ui/add_provider.dart';
import 'package:pro_zone/ui/home.dart';
import 'package:pro_zone/ui/update_provider.dart';
import 'package:pro_zone/ui/view_provider.dart';
import 'package:pro_zone/utils/size_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      Provider(
        create: (context){
          return AppBloc();
        },
        child: MyApp(),
      )
      );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'ProZone',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
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
