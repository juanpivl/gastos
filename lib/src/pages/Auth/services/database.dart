

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

//get list from snapshot
  List<Usuario?> _clientesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((document) {
      return Usuario(
        name: document.get('name'),
        total: document.get('total'),
        masmenos: document.get('masmenos'),
        concepto: document.get('concepto'),
        fecha: document.get('fecha'),
        cantidad: document.get('cantidad')

        
      );
    }).toList();
  
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
    
  

  //get clientes stream
  Stream<List<Usuario?>> get clientes {
    return clientesCollection.snapshots()
    .map(_clientesListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData>get userData{
    return clientesCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  //*********************************************************** */


}