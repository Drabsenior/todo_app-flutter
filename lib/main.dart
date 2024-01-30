// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text('Todo app',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),)),
        backgroundColor: Colors.deepPurple[100],
      ),
    );
  }
}