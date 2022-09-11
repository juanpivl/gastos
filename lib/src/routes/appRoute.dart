import 'package:flutter/material.dart';
import 'package:gastos/src/pages/home/homePage.dart';
import 'package:gastos/src/routes/menu.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

  
  'menu' : ( _ ) => Menu(),
  'home' : ( _) => HomePage(),

};