import 'package:flutter/material.dart';
import 'package:gastos/src/components/background.dart';
import 'package:gastos/src/pages/home/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Background(),
          Column(
            children: const [
              Encabezado(),
              SizedBox(height: 40,),
              Center(child: Text('Movimientos',style: TextStyle(fontSize: 25,color: Color.fromRGBO(16, 36, 84, 1)),)),
              Comprobantes()
            ],
          ),
        ]),
      ),
    );
  }
}
