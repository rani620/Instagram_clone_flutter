import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  // String username = " ";
//   @override
//   void initState() {
 //   // TODO: implement initState
//     super.initState();
//     // creating a method
//     getUsername();
//   }
// // it is our one time read   start point 
//   // creating a function
//   void getUsername() async {
//     // method to get the data from the firestore .
//     // whuen uid is known the use doc. method for  this  and inside the doc we put the user id
//     DocumentSnapshot snap = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     setState(() {
//       username = (snap.data() as Map<String,dynamic> ) ['username'];
//     });
//   }
// one time read ended here  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('This is mobil')),
    );
  }
}
