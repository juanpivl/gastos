import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gastos/src/pages/Auth/services/authservice.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Container(
      color: Colors.black,
      child: Column(
        children: [


          Text('Solo disponible para usuarios'),
         
          
          
          IconButton(
            icon: const Icon(
              Icons.exit_to_app_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
