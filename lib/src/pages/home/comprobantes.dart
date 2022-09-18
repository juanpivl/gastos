import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gastos/src/pages/add/ingresos.dart';

import '../Auth/services/firebase_crud.dart';

class Comprobantes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Comprobantes();
  }
}

class _Comprobantes extends State<Comprobantes> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readConcepto();
  //FirebaseFirestore.instance.collection('Employee').snapshots();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
     child: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding:  EdgeInsets.only(top: 8.0),
              child: ListView(
                
                children: snapshot.data!.docs.map((e) {
                  
                  return Card(
                      child: Column(children: [
                    ListTile(
                      title: Text(e["concepto"]),
                      subtitle: Container(
                        child: (Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e["cantidad"],
                                style: const TextStyle(fontSize: 14)),
                            Text(e["fecha"],
                                style: const TextStyle(fontSize: 12)),
                          ],
                        )),
                      ),
                    ),
                    
                  ]));
                }).toList(),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}