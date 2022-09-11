import 'package:flutter/material.dart';
import 'package:gastos/src/pages/home/components.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 250, 3, 3),
      child: Padding(
        
        padding: const EdgeInsets.all(10.0),
      
        child: ListView(
          children: [
            Column(
            
            children: const [
              SizedBox(height: 20,),
              Encabezado(),
              SizedBox(height: 20,),
              Masmenos(),
              SizedBox(height: 20,),
              Comprobantes(),
              SizedBox(height: 20,),
            ],
          ),
          ],
          
        ),
      ),
    );
  }
}