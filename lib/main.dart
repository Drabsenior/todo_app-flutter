// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_flutter/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{
  await Hive.initFlutter();

  // open a box 
  var box = await Hive.openBox('mytodobox');
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage()
      ),
      theme: ThemeData(primarySwatch:Colors.yellow),
    );
  }
}