import 'dart:convert';

import 'package:flutter_application_3/model/user.dart';
import 'package:http/http.dart' as http;
class Database{
  static List<AppUser> userData=[];


    static Future<List<AppUser>> fetchAppUser() async {
    try {
      final param = {
        "query": "select * from user;",
      };
      final response = await http.post(
      Uri.parse('https://shopybest.app.mezyapps.com/run-query'),
        body: param,
      );
      //print(response.body.toString());
      var responseData = json.decode(response.body) as List;
      print(responseData.length);
      
      userData=[];
      for(int i=0;i<responseData.length;i++)
      {
        //print(responseData[i]);
        // responseData[i];
        userData.add(AppUser(
          name: responseData[i]['name'],
          email: responseData[i]['email'],
          id: responseData[i]['uid'],
          password: responseData[i]['password'],
          phone: responseData[i]['mobileNo'],
        ));
        // userData.add(AppUser.fromJson(responseData[i]));

      }
      
      return userData;
    } catch (e) {
      return [];
    }
  }

    static Future<bool> insertUser(String name, String phone, String email, String password) async {
    try {
      final param = {
        "query": "insert into user(name, mobileNo, email, password) values('$name', '$phone', '$email', $password);",
      };
      final response = await http.post(
      Uri.parse('https://shopybest.app.mezyapps.com/run-query'),
        body: param,
      );
      print(response.body.toString());
      return true;
    } catch (e) {
      return false;
    }
    }

    static Future<bool> updateUser(String name, String phone, String email, String password, String id) async {
    try {
      final param = {
        "query": "update user set name='$name', mobileNo='$phone', email='$email', password='$password' where uid=$id",
      };
      final response = await http.post(
      Uri.parse('https://shopybest.app.mezyapps.com/run-query'),
        body: param,
      );
      print(response.body.toString());
      return true;
    } catch (e) {
      return false;
    }
    }

    static Future<bool> deleteUser(String id) async {
    try {
      final param = {
        "query": "delete from user where uid='$id'",
      };
      final response = await http.post(
      Uri.parse('https://shopybest.app.mezyapps.com/run-query'),
        body: param,
      );
      print(response.body.toString());
      return true;
    } catch (e) {
      return false;
    }
    }



}