import 'package:flutter/material.dart';
import 'package:information_app/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:information_app/provider/user_provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // ซ่อนแบนเนอร์ debug
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
