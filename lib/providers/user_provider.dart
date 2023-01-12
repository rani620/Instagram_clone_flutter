import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';

// using state management
class UserProvider with ChangeNotifier {
  User? _user;   
  //initialising the auth method class
  final Authmethods _authmethods = Authmethods();
  User get getUser => _user!;          

  Future<void> refreshuser() async {
    User user = await _authmethods.getUserDetails();
    _user = user;      
    notifyListeners();    
  }
}
