import 'package:flutter/material.dart';
import 'package:gastos/src/pages/Auth/services/database.dart';
import 'package:provider/provider.dart';

import '../../components/loading.dart';
import '../Auth/models/clientes.dart';
import '../Auth/services/authservice.dart';

class Encabezado extends StatefulWidget {
  const Encabezado({super.key});

  @override
  State<Encabezado> createState() => _EncabezadoState();
}

class _EncabezadoState extends State<Encabezado> {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bienvenido yoo} ',style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Text(
                      'TOTAL BALANCE',
                      style: TextStyle(fontSize: 20,
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed:  () async{
                        //_auth.signOut();
                      }, icon: Icon(Icons.logout,color: Colors.white,))
                    
                    
                    
                  ],
                ),
                
                 Text(
                  '\$1233}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                 Text(
                  '+ \$ 3142',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          
    );
  }
}
