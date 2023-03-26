
import 'package:bmi_calc/pages4/home_page.dart';
import 'package:flutter/material.dart';

class MyGame5 extends StatefulWidget {
  const MyGame5({super.key});

  @override
  State<MyGame5> createState() => _MyGame5State();
}

class _MyGame5State extends State<MyGame5> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0XFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
      home: Bmi(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Bmi_home());
  }
}
