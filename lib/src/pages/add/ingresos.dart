import 'package:flutter/material.dart';
import 'package:gastos/src/components/background.dart';
import 'package:gastos/src/pages/add/componentes.dart';

class IngresosPage extends StatelessWidget {
  const IngresosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Background(),
          ListView(
            children: [
               Column(
              children: const [
                EncabezadoIn(),
                SizedBox(height: 100,),
                Center(child: Text('Movimientos',style: TextStyle(fontSize: 25,color: Color.fromRGBO(16, 36, 84, 1)),)),
                 SizedBox(height: 30,),
                Formulario(),
                SizedBox(height: 30,),
                Formulario(),
                SizedBox(height: 30,),
                Formulario(),
                 SizedBox(height: 30,),

                 FloatingActionButton(onPressed: null, 
                 child: Text('Aceptar'),)
               
            ],
            
              
            
          ),
        ]),
        ]
      ),
      )
    );
  }
}