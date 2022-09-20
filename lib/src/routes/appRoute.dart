import 'package:flutter/material.dart';
import 'package:gastos/src/pages/Auth/LoginPage.dart';
import 'package:gastos/src/pages/Auth/RegisterPage.dart';
import 'package:gastos/src/pages/home/homePage.dart';
import 'package:gastos/src/routes/menu.dart';
import 'package:gastos/src/routes/wrapper.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

  
  'menu' : ( _ ) => Menu(),
  'home' : ( _) => HomePage(),
  'login' : (_) => LoginPage(),
  'register' : (_) => RegisterPage(),
  'wrapper' : (_) => Wrapper()

};