import 'package:flutter/material.dart';
import 'dart:math';

class CylinderPage extends StatefulWidget {
  @override
  _CylinderCalculatorPageState createState() => _CylinderCalculatorPageState();
}

class _CylinderCalculatorPageState extends State<CylinderPage> {
  final _formKeyArea = GlobalKey<FormState>();
  final _formKeyPerimeter = GlobalKey<FormState>();
  final _radiusController = TextEditingController();
  final _heightController = TextEditingController();
  double _radius = 0;
  double _height = 0;

  double _calculateVolume() {
    return pi * pow(_radius, 2) * _height;
  }

  double _calculateSurfaceArea() {
    return 2 * pi * _radius * _height + 2 * pi * pow(_radius, 2);
  }

  Widget _buildVolumeForm() {
    return Form(
      key: _formKeyArea,
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            controller: _radiusController,
            decoration: InputDecoration(
              labelText: 'Radius',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _radius = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _heightController,
            decoration: InputDecoration(
              labelText: 'Height',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _height = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKeyArea.currentState!.validate()) {
                _formKeyArea.currentState!.save();
                double result = _calculateVolume();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Volume: $result'),
                ));
              }
            },
            child: Text('Calculate Volume'),
          ),
        ],
      ),
    );
  }

  Widget _buildSurfaceAreaForm() {
    return Form(
      key: _formKeyPerimeter,
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            controller: _radiusController,
            decoration: InputDecoration(
              labelText: 'Radius',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _radius = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _heightController,
            decoration: InputDecoration(
              labelText: 'Height',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _height = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKeyPerimeter.currentState!.validate()) {
                _formKeyPerimeter.currentState!.save();
                double result = _calculateSurfaceArea();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Surface Area: $result'),
                ));
              }
            },
            child: Text('Surface Area'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cylinder Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.grey,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: 'Volume'),
                        Tab(text: 'Surface Area'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildVolumeForm(),
                          _buildSurfaceAreaForm(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
