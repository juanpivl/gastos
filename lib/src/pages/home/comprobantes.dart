import 'package:flutter/material.dart';

class Comprobantes extends StatelessWidget {
  const Comprobantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white
      
      ),
      width: double.infinity,
      height: 350,
      child: ListView(
        scrollDirection: Axis.vertical,


        
          children: [
              Conceptos(data: Icons.call_made, cantidad: '\$321321', text: 'Soda'),
              Conceptos(data: Icons.call_received , cantidad: '\$321321', text: 'Soda'),
              Conceptos(data: Icons.call_made, cantidad: '\$321321', text: 'Soda'),
              Conceptos(data: Icons.call_received , cantidad: '\$321321', text: 'Soda'),
              Conceptos(data: Icons.call_made, cantidad: '\$321321', text: 'Soda'),
              Conceptos(data: Icons.call_received , cantidad: '\$321321', text: 'Soda'),
              Conceptos(data: Icons.call_made, cantidad: '\$321321', text: 'Soda'),
              Conceptos(data: Icons.call_made, cantidad: '\$321321', text: 'Soda'),
              Conceptos(data: Icons.call_made, cantidad: '\$321321', text: 'Soda'),


          ]
      )
    );
  }
}

class Conceptos extends StatelessWidget {
  final IconData data;
  final String cantidad;
  final String text;
  const Conceptos({super.key, required this.data, required this.cantidad, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey
      ),
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(data),
            Column(
              children: [
                
                 Text(text),
                Text('09/02/2022'),

              ],
            ),
            Text(cantidad),
           
          ],
        ),
      ),
    );
  }
}