import 'package:flutter/material.dart';

class TrapezoidPage extends StatefulWidget {
  @override
  _TrapezoidPageState createState() => _TrapezoidPageState();
}

class _TrapezoidPageState extends State<TrapezoidPage> {
  final _formKeyArea = GlobalKey<FormState>();
  final _formKeyPerimeter = GlobalKey<FormState>();
  final _side1Controller = TextEditingController();
  final _side2Controller = TextEditingController();
  final _side3Controller = TextEditingController();
  final _side4Controller = TextEditingController();
  final _heightController = TextEditingController();
  double _side1 = 0;
  double _side2 = 0;
  double _side3 = 0;
  double _side4 = 0;
  double _height = 0;

  double _calculateArea() {
    return ((_side1 + _side2) / 2) * _height;
  }

  double _calculatePerimeter() {
    return _side1 + _side2 + _side3 + _side4;
  }

  Widget _buildAreaForm() {
    return Form(
      key: _formKeyArea,
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            controller: _side1Controller,
            decoration: InputDecoration(
              labelText: 'Side 1',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _side1 = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _side2Controller,
            decoration: InputDecoration(
              labelText: 'Side 2',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _side2 = double.parse(value!),
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
                double result = _calculateArea();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Area: $result'),
                ));
              }
            },
            child: Text('Calculate Area'),
          ),
        ],
      ),
    );
  }

  Widget _buildPerimeterForm() {
    return Form(
      key: _formKeyPerimeter,
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            controller: _side1Controller,
            decoration: InputDecoration(
              labelText: 'Side 1',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _side1 = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _side2Controller,
            decoration: InputDecoration(
              labelText: 'Side 2',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _side2 = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _side3Controller,
            decoration: InputDecoration(
              labelText: 'Side 3',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _side3 = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _side4Controller,
            decoration: InputDecoration(
              labelText: 'Side 4',
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a value' : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSaved: (value) => _side4 = double.parse(value!),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKeyPerimeter.currentState!.validate()) {
                _formKeyPerimeter.currentState!.save();
                double result = _calculatePerimeter();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Perimeter: $result'),
                ));
              }
            },
            child: Text('Calculate Perimeter'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapezoid Calculator'),
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
                        Tab(text: 'Area'),
                        Tab(text: 'Perimeter'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildAreaForm(),
                          _buildPerimeterForm(),
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
