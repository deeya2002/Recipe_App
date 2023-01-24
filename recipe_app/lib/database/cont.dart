import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:recipe_app/model/User.dart';

class Connection {
  var settings = ConnectionSettings(
      host: '10.0.2.2', port: 3306, user: 'root', db: 'Recipe');
  var con;

  Future<void> dataCon() async {
    con = await MySqlConnection.connect(settings);
  }

  Future<void> getData() async {
    var results = await con.query('select * from user');
    debugPrint('ello');
    for (var row in results) {
      debugPrint('Name: ${row[0]}, email: ${row[1]}');
    }
  }

  Future<void> insertUser(UserModel user) async {
    print(user.email);
    var result = await con.query(
        'insert into user (full_name,user_name,phone_number,email,password) values (?, ?, ?,?,?)',
        [user.fullname, user.username, user.number, user.email, user.password]);
    debugPrint('Inserted row id=${result.insertId}');
  }

  Future<bool> verifyPass(String email, String password) async {
   
    var results = await con.query(
        'select uid from user where email = ? and password = ?',
        [email, password]);
        
  if(results.length > 0)
    return true;
  else
    return false;

}
}