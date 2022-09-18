import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/usuario.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('clientes');

class FirebaseCrud {
//CRUD method here

//CREATE
  static Future<Usuario?> crearConcepto({
    required String name,
    required String total,
    required String masmenos,
    required String concepto,
    required String fecha,
    required String cantidad,
  }) async {
    Usuario usuario = Usuario();
    DocumentReference documentReference = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nombre": name,
      "total": total,
      "masmenos": masmenos,
      "concepto": concepto,
      "fecha": fecha,
      "cantidad": cantidad
    };

    var result = await documentReference.set(data).whenComplete(() {
      usuario.code = 200;
      usuario.message = "Sucessfully added to database";
    });
  }

  //READ
  static Stream <QuerySnapshot> readConcepto(){
    CollectionReference conceptosCollection = _Collection;
    return conceptosCollection.snapshots();
  }

  //UPDATE
  static Future<Usuario> updateEmployee({
     required String name,
    required String total,
    required String masmenos,
    required String concepto,
    required String fecha,
    required String cantidad,
    required String docId,
  }) async {
    Usuario usuario = Usuario();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
     "nombre": name,
      "total": total,
      "masmenos": masmenos,
      "concepto": concepto,
      "fecha": fecha,
      "cantidad": cantidad
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           usuario.code = 200;
          usuario.message = "Sucessfully updated ";
        })
        .catchError((e) {
            usuario.code = 500;
           usuario.message = e;
        });

        return usuario;
  }


  //DELETE
  static Future<Usuario> deleteConcept({
    required String docId,
  }) async {
     Usuario usuario = Usuario();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
          usuario.code = 200;
          usuario.message = "Sucessfully Deleted concepte";
        })
        .catchError((e) {
           usuario.code = 500;
            usuario.message = e;
        });

   return usuario;
  }
}
