
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
class user {
  final String username;
  final String pwd;

  user({
     this.username,
     this.pwd,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': pwd,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Classe{ name: $username, pwd: $pwd}';
  }
}
