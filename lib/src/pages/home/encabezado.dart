import 'package:flutter/material.dart';

class Encabezado extends StatelessWidget {
  const Encabezado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'TOTAL BALANCE',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '\$43 154',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          const Text(
            '+ \$554 today',
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          
        ],
      ),
    );
  }
}
