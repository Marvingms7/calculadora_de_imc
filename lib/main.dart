import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 152, 167, 175),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Icon(
            Icons.person_outline_outlined,
            size: 140.0,
            color: Colors.greenAccent,
          ),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Peso em (Kg)",
                labelStyle: TextStyle(color: Colors.greenAccent)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.greenAccent, fontSize: 25.0),
          ),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura (Cm)",
              labelStyle: TextStyle(color: Colors.greenAccent),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.greenAccent, fontSize: 25.0),
          )
        ],
      ),
    );
  }
}
