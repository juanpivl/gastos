import 'package:flutter/material.dart';

class Masmenos extends StatelessWidget {
  const Masmenos({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround ,
      
      children: [
        _Contenedor(titulo:'Ingresos',data: Icons.call_made,valor: '\$3213',color: Colors.blue,),
        _Contenedor(titulo:'Egresos',data: Icons.call_received ,valor: '\$2312134',color:Colors.white),
      ],
    );
  }

 
}

class _Contenedor extends StatelessWidget {
  final String valor;
  final IconData data;
  final Color color;
  final String titulo;

  const _Contenedor({super.key, required this.valor, required this.data, required this.color, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color
        ),
        height: 130,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titulo),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(data),
                Text(valor)
              
            ]),
          ],
        ),
      );
  }
}
