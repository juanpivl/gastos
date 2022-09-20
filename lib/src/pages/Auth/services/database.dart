

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/clientes.dart';
import '../models/usuario.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection reference usuarios
  final CollectionReference clientesCollection =
      FirebaseFirestore.instance.collection('clientes');
      

 

  Future updateUserData(String name,String total,String masmenos,String concepto,String fecha, String cantidad) async {
    return await clientesCollection.doc(uid).set({
      'name': name,
      'total': total,
      'masmenos': masmenos,
      'concepto': concepto,
      'fecha': fecha,
      'cantidad': cantidad,

      
    });
  }



  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot['name'],
      total: snapshot['total'],
      masmenos: snapshot['masmenos'],
      concepto: snapshot['concepto'],
      fecha: snapshot['fecha'],
      cantidad: snapshot['cantidad'],
    );
  }
    
  

  

  //get user doc stream
  Stream<UserData>get userData{
    return clientesCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  //*********************************************************** */


}