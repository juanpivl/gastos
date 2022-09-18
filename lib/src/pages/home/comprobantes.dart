import 'package:flutter/material.dart';

class Comprobantes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        width: double.infinity,
        height: 400,
        child: ListView(scrollDirection: Axis.vertical, children: const [
          Conceptos(
            data: Icons.call_made,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.red,
          ),
          Conceptos(
            data: Icons.call_received,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.green,
          ),
          Conceptos(
            data: Icons.call_made,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.red,
          ),
          Conceptos(
            data: Icons.call_received,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.green,
          ),
          Conceptos(
            data: Icons.call_made,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.red,
          ),
          Conceptos(
            data: Icons.call_received,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.green,
          ),
          Conceptos(
            data: Icons.call_made,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.red,
          ),
          Conceptos(
            data: Icons.call_received,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.green,
          ),
          Conceptos(
            data: Icons.call_made,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.red,
          ),
          Conceptos(
            data: Icons.call_received,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.green,
          ),
          Conceptos(
            data: Icons.call_made,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.red,
          ),
          Conceptos(
            data: Icons.call_received,
            cantidad: '\$321321',
            text: 'Soda',
            masmenos: Colors.green,
          ),
        ]));
  }
}

class Conceptos extends StatelessWidget {
  final IconData data;
  final String cantidad;
  final String text;
  final Color masmenos;

  const Conceptos(
      {super.key,
      required this.data,
      required this.cantidad,
      required this.text,
      required this.masmenos});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(16, 36, 84, .4)),
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(data, color: masmenos),
            Column(
              children: [
                Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                Text('09/02/2022',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),
            Text(cantidad,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
