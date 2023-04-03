import 'package:flutter/material.dart';
import 'package:mobile_1/calculator.dart';
import 'package:mobile_1/datetime.dart';
import 'package:mobile_1/login.dart';
import 'package:mobile_1/profile.dart';
import 'trapezoid.dart';
import 'cylinder.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/profile.png",
                    width: 70,
                  ),
                  SizedBox(height: 10),
                  Text('Profile'),
                ],
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/calculator.png',
                    width: 70,
                  ),
                  SizedBox(height: 10),
                  Text('Calculator'),
                ],
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/calendar.png',
                    width: 70,
                  ),
                  SizedBox(height: 10),
                  Text('Date & Time'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}









































