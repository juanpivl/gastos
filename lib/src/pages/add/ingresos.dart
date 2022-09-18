// ignore_for_file: prefer_const_constructors


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gastos/src/components/background.dart';
import 'package:gastos/src/pages/Auth/models/usuario.dart';
import 'package:gastos/src/pages/add/componentes.dart';

import '../../components/loading.dart';
import '../Auth/services/authservice.dart';

class IngresosPage extends StatefulWidget {
  @override
  State<IngresosPage> createState() => _IngresosPageState();
}

class _IngresosPageState extends State<IngresosPage> {
  final db = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> conceptosStream = FirebaseFirestore.instance.collection('clientes').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Background(),
        ListView(children: [
          Column(
            children: [
              EncabezadoIn(),
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Text(
                'Movimientos',
                style: TextStyle(
                    fontSize: 25, color: Color.fromRGBO(16, 36, 84, 1)),
              )),
              SizedBox(
                height: 30,
              ),
              Formulario(),
             
            ],
          ),
        ]),
      ]),
    ));
  }
}

class Formulario extends StatefulWidget {
  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String concepto = '';

  String cantidad = '';

  String fecha = '';
  

  final  _concepto = TextEditingController();
  final  _cantidad = TextEditingController();
  final  _fecha = TextEditingController();


  @override
  Widget build(BuildContext context) {
  

      return Form(
            key: _formKey,
            child: Column(
              children: [
                
                const SizedBox(height: 30.0),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(16, 36, 84, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _concepto,
                     style: TextStyle(color: Colors.white),
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.text_decrease,
                        color: Colors.white,
                      ),
                      focusColor: Colors.white,
                      
                      hintText: "Concepto",
                      hintStyle: TextStyle(color: Colors.white),
                      
                    ),
                    
                    autocorrect: false,
                    
                    onChanged: (val) {
                      setState(() {
                        concepto = val;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(16, 36, 84, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      
                      focusColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                      ),
                      hintText: "Cantidad",
                      hintStyle: TextStyle(color: Colors.white)
                    ),
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    controller: _cantidad,
                    onChanged: (valor) {
                      setState(() {
                        cantidad = '';
                      });
                    },
                  ),
                ),
const SizedBox(height: 30.0),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(16, 36, 84, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                     style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                      focusColor: Colors.white,
                      
                      hintText: "Fecha",
                      hintStyle: TextStyle(color: Colors.white),
                      
                    ),
                    
                    autocorrect: false,
                    controller: _fecha,
                    onChanged: (val) {
                      setState(() {
                        fecha = val;
                      });
                    },
                  ),
                ),
                
                SizedBox(height: 30.0),
                const SizedBox(height: 30.0),
                FloatingActionButton.extended(
                    label: Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color.fromRGBO(16, 36, 84, 1),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      fecha = _fecha.text;
                      concepto = _concepto.text;
                      cantidad = _cantidad.text;
                      print(fecha+''+concepto);
                      print(cantidad);
                    
                     _concepto.text = '';
                     _fecha.text= '';
                     _cantidad.text = '';

                    })
              ],
            ),
          );
    } 


   
}
