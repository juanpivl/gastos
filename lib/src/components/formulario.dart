import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {

  final IconData data;
  final String text;
  final TextInputType keyboardType;
  final Color color;
  final Color letra;

  const Formulario({super.key, required this.data, required this.text, required this.keyboardType, required this.color, required this.letra });


 
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 300,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(19)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                
                  style:  TextStyle(color: letra),
                  decoration: InputDecoration(
                    
                    border: InputBorder.none,
                    icon: Icon(data,color: letra,),
                    
                    focusColor: Theme.of(context).primaryColor,
                    hintText: text,
                    hintStyle:  TextStyle(color: letra)
                    
                  ),
                  autocorrect: false,
                  keyboardType: keyboardType,
                  onChanged: (val) {
                    
                  },
                ),
              ),
            );
  }
}