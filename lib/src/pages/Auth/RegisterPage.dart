// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gastos/src/components/loading.dart';
import 'package:gastos/src/pages/Auth/services/authservice.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 36, 84, 1),
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset('assets/logo.png', height: 200),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'REGISTER',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(child: Formulario()),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Text('Ingresa', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
            )
          ],
        ),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  //inal AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;

  //text field state
  String email = '';
  String name = '';

  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
    ? Loading() 
    : Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      
      child: Column(
        children: [
           const SizedBox(height: 30.0),
          Container(
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: "Nombre",
              ),
              autocorrect: false,
              
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: "Correo",
              ),
              autocorrect: false,
              validator: (val) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                
                return regExp.hasMatch(val ?? '')
                    ? null
                    : 'El correo no es correcto';
              },
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.black,
                ),
                
                hintText: "Contraseña",
              ),
              autocorrect: false,
              obscureText: true,
              validator: (val) {
                return (val != null && val.length >= 6)
                    ? null
                    : 'La contraseña debe ser de 6 caracteres';
              },
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
          ),
          SizedBox(height: 30.0),
          const SizedBox(height: 30.0),
          FloatingActionButton.extended(
            
            label: Text(
              'Registrar',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),

            onPressed: ()async{
              if(_formKey.currentState!.validate()){
                setState(() {
                      loading = true;
                    
                    });
                     dynamic result =
                                await _auth.registerWithEmail(email, password,name);
                            if (result == null) {
                              setState(() {
                                error = 'Ingresar un email valido';
                                loading = false;
                              });
                              }
              }
             
            },
          )
        ],
      ),
    );
  }
}
