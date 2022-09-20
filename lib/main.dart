import 'package:flutter/material.dart';
import 'package:gastos/src/pages/Auth/services/authservice.dart';
import 'package:gastos/src/routes/appRoute.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'src/pages/Auth/models/clientes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Clientes?>.value(
      catchError: (_,__) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gastar Gastar',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'wrapper',
      routes: appRoutes,
    ),
    );
    
    
  }
}

