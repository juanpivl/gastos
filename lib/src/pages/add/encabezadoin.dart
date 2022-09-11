import 'package:flutter/material.dart';

class EncabezadoIn extends StatelessWidget {
  const EncabezadoIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:const  [
         
         
          Text(
            'Ingresos',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),

          
          
          
        ],
      ),
    );
  }
}
