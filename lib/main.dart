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
  TextEditingController controladorPeso = TextEditingController();
  TextEditingController controladorAltura = TextEditingController();

  String _infoText = 'Informe seus dados';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _reset() {
    controladorPeso.text = '';
    controladorAltura.text = '';
    setState(() {
      _infoText = 'Informe seus dados';
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(controladorPeso.text);
      double altura = double.parse(controladorAltura.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _infoText = 'Abaixo do peso, IMC(${imc.toStringAsPrecision(4)})';
      } else if (imc >= 18.6 && imc <= 24.9) {
        _infoText = 'Peso normal, IMC(${imc.toStringAsPrecision(4)})';
      } else if (imc >= 25.0 && imc <= 29.9) {
        _infoText = 'Sobrepeso, IMC(${imc.toStringAsPrecision(4)})';
      } else if (imc >= 30.0 && imc < 40.0) {
        _infoText = 'Obesidade(${imc.toStringAsPrecision(4)})';
      } else if (imc >= 40) {
        _infoText = 'Obesidade grave, IMC(${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(onPressed: _reset, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 152, 167, 175),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Icons.person_outline_outlined,
                size: 200.0,
                color: Colors.greenAccent,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Peso em (Kg)",
                    labelStyle: TextStyle(color: Colors.greenAccent)),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: Colors.greenAccent, fontSize: 25.0),
                controller: controladorPeso,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu Peso';
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Altura em (Cm)",
                  labelStyle: TextStyle(color: Colors.greenAccent),
                ),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: Colors.greenAccent, fontSize: 25.0),
                controller: controladorAltura,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira sua altura';
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: SizedBox(
                  height: 70.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _calcular();
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 25.0))),
                    child: const Text('Calcular'),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: Colors.greenAccent, fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
