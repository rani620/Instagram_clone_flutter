import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:instagram_flutter/resources/storage_method.dart';

class Authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// method for storing data using state managemnet
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              username.isNotEmpty ||
              bio.isNotEmpty
          //  || file != null
          ) {
        //register the user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilepic', file, false);
        // Add user to our database

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
//
        // await _firestore.collection('users').add({
        //    'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'followers': [],
        // });

        res = "success";
      }
    }
    // on FirebaseAuthException catch (err) {
    //   if (err.code == 'inavlid-email') {
    //     res = 'the email is badly formated.';
    //   } else if (err.code == 'weak-password') {
    //     res = 'password should be at atleast 6 character';
    //   }
    // }
    catch (err) {
      res = err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = " please enter all the field ";
      }
    }
    // on FirebaseAuthException catch(e){
    //   if(e.code == 'user-not-found'){

    //   }
    // }
    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
