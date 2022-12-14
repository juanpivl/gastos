import 'package:firebase_auth/firebase_auth.dart';

import '../models/clientes.dart';
import 'database.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
 
  //create user object based on firebase user
  Clientes? _userFromFirebaseUser (User user){
    return user != null ? Clientes(uid: user.uid) : null;
  }

  //auth change user stream
 Stream<Clientes?> get user  {  
    return  _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
   }
  

  //sign in anonimus
  Future signInAnon() async{
    try{
     UserCredential result = await _auth.signInAnonymously();
     User? user = result.user;
     return _userFromFirebaseUser(user!);

    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in with email
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email
  Future registerWithEmail(String email, String password,String name) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData(name,'', '','','','' );
      

      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}
