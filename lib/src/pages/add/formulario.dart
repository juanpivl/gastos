import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  const Formulario({super.key});


 
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 300,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(16, 36, 84, 1), borderRadius: BorderRadius.circular(19)),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.account_balance_wallet_rounded,
                    color: Colors.white,
                  ),
                  focusColor: Theme.of(context).primaryColor,
                  hintText: "Concepto",
                  hintStyle: const TextStyle(color: Colors.white)
                  
                ),
                autocorrect: false,
                
                onChanged: (val) {
                  
                },
              ),
            );
  }
}