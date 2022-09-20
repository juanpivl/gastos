

// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastos/src/components/loading.dart';
import 'package:gastos/src/pages/Auth/RegisterPage.dart';

import '../../components/formulario.dart';
import 'services/authservice.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromRGBO(16, 36, 84, 1),
      body: SingleChildScrollView(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:  [
            const SizedBox(height: 50,),
            Image.asset('assets/logo.png',height: 200),
            const SizedBox(height: 20,),
            const Text('LOGIN',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Center(child: Formulario()),SizedBox(height: 20,),
           
            SizedBox(height: 10,),
            GestureDetector(child: Text('Registrate',style: TextStyle(color: Colors.white),), onTap: (){
               Navigator.pushReplacementNamed(context, 'register');
            } ,)
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
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';

  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return  loading ? Loading() :Form(
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
              'Ingresar',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () async {
              if(_formKey.currentState!.validate()){
                    setState(() {
                      loading = true;
                    
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {

                        error = 'Credenciales incorrectas';
                        loading =false;
                      });
                    }
              }}
          )
        ],
      ),
    );
  }
}

