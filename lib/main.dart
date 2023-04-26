import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcial 2',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _resultController = TextEditingController();


  void _performAction() {
    final String inputText = _controller.text;
    final int number = int.parse(inputText);
    if (number == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor ingresa un numero valido'),
        ),
      );
    } else {
      final int result = fibonacci(number);
      _resultController.text = result.toString();
    }
  }

//Una secuencia de números enteros en la que cada número es la suma de los dos números anteriores.
  int fibonacci(int n) {
    if (n <= 1) {
      return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcial 2'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresa un numero',
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            TextFormField(
              controller: _resultController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Resultado',
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 16.0),
          ElevatedButton(
           onPressed: _performAction,
           child: Text('Da el resultado', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            ),
          ),
          ],
        ),
      ),
    );
  }
}