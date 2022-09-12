import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {

  final IconData data;
  final String text;

  const Formulario({super.key, required this.data, required this.text});


 
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 300,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(16, 36, 84, 1), borderRadius: BorderRadius.circular(19)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    
                    border: InputBorder.none,
                    icon: Icon(data,color: Colors.white,),
                    
                    focusColor: Theme.of(context).primaryColor,
                    hintText: text,
                    hintStyle: const TextStyle(color: Colors.white)
                    
                  ),
                  autocorrect: false,
                  
                  onChanged: (val) {
                    
                  },
                ),
              ),
            );
  }
}