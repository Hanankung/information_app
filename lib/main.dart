import 'package:flutter/material.dart';
import 'package:information_app/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // ซ่อนแบนเนอร์ debug
    );
  }
}
