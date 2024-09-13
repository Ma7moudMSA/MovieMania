import 'package:firebase_auth/firebase_auth.dart';

class FireBaseService{
  FirebaseAuth _auth=FirebaseAuth.instance;
  Future<dynamic>signup(String email,String password,String username)async{
    try{
     UserCredential user= await  _auth.createUserWithEmailAndPassword(email: email, password: password);
     await _auth.currentUser!.updateDisplayName(username);
     await _auth.currentUser!.reload();
     return user.user;
    } on FirebaseAuthException catch(e){

      return e.code;
    }
  }

  Future<dynamic>signin(String email,String password)async{
    try{
      UserCredential user= await  _auth.createUserWithEmailAndPassword(email: email, password: password);
      return user.user;
    } on FirebaseAuthException catch(e){

      return e.code;
    }
  }


  Future<dynamic> signout() async{
    await _auth.signOut();
  }


}