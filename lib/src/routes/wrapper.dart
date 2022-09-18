


import 'package:flutter/material.dart';
import 'package:gastos/src/pages/Auth/LoginPage.dart';
import 'package:gastos/src/pages/home/homePage.dart';
import 'package:gastos/src/routes/menu.dart';
import 'package:provider/provider.dart';

import '../pages/Auth/models/clientes.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Clientes?>(context);
    


    if(user ==null){
      return LoginPage();
    }else{
      return Menu();
    }
    
  }
}