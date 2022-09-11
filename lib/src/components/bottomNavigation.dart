import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gastos/src/pages/add/ingresos.dart';
import 'package:gastos/src/pages/egresos/egresosPage.dart';
import 'package:gastos/src/pages/home/homePage.dart';

class BottomNavitation extends StatefulWidget {
  const BottomNavitation({super.key});

  @override
  State<BottomNavitation> createState() => _BottomNavitationState();
}

class _BottomNavitationState extends State<BottomNavitation> {

  int pageindex = 1;
  
  final HomePage _homePage = HomePage();
  final IngresosPage _ingresosPage = IngresosPage();
  final EgresosPage _egresosPage = EgresosPage();

  Widget _showPage = HomePage();

  Widget _pageChooser(int page){
    switch (page){
      case 0:
         return _ingresosPage;
      case 1:
        return  _homePage; 
      case 2:
        return _egresosPage;
      
      default:
      return const HomePage();   
         
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: pageindex,
        backgroundColor: Color.fromARGB(255, 250, 3, 3),
        color: Color.fromARGB(255, 69, 50, 239),
        items: const <Widget>[
          Icon(Icons.add_card , size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.cancel_presentation_outlined , size: 30),
        ],
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
          
        },
      ),
       body: Center(child: _showPage,)
    
    );
  }
}