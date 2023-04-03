import 'package:flutter/material.dart';
import 'package:mobile_1/profile.dart';
import 'trapezoid.dart';
import 'cylinder.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator Menu'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrapezoidPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/trapezoid.png',
                    width: 70,
                  ),
                  SizedBox(height: 10),
                  Text('Trapezoid'),
                ],
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CylinderPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Cylinder.png',
                    width: 70,
                  ),
                  SizedBox(height: 10),
                  Text('Cylinder'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
