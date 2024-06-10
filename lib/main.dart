import 'package:flutter/material.dart';
import 'package:question_answer_app/constants/colorpallet.dart';
import 'package:question_answer_app/views/homescreen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: appbarcolor,
          elevation: 0,
        ),
        scaffoldBackgroundColor: bgcolor,
        fontFamily: "montserrat",
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
