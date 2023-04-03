import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_1/dashboard.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tugas UTS',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          tabBarTheme: TabBarTheme(labelColor: Colors.black),
        ),
        home: LoadingPage());
  }
}

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    navigateToLoginPage();
  }

  void navigateToLoginPage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
