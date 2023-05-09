import 'package:flutter/material.dart';

//
class Admin {
  final String username;
  final String password;

  Admin({required this.username, required this.password});
}

class Users with ChangeNotifier {

  final List<Admin> _users = [
    Admin(username: "walid", password: "walid10"),
    Admin(username: "redouane", password: "walid10"),
  ];

   /// Getter to get the users list
   List<Admin> get getUsers {
    return _users;
  }

  /// Check if the user infos are valid
  bool checkUsername(String username) {
     return _users.any((user) => user.username == username);
  }
  bool checkUPassword(String password) {
     return _users.any((user) => user.password == password);
  }
  
}