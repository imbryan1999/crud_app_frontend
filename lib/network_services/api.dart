import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fullstack_flutter_app/network_services/network_constants.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  // add userdata
  static addUserDetails(
      String name, phone, address, ResponseHandler responseHandler) async {
    var url = Uri.parse(
        NetworkApiConstants.kBaseUrl + NetworkApiConstants.addUserEndpoint);
    var data = {
      "user_name": name,
      "user_number": phone,
      "user_address": address
    };
    try {
      final response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        responseHandler(true, data);
        print(data);
      } else {
        print('api failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // getUserData
  static getUserDetails(
      BuildContext context, ResponseHandler responseHandler) async {
    var url = Uri.parse(
        NetworkApiConstants.kBaseUrl + NetworkApiConstants.getUserEndpoint);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        if (map['data'] is List<dynamic>) {
          responseHandler(true, map['data']);
        }
      } else {
        print('api failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // update user data
  static updateUser(BuildContext context, String id, name, phone, address,
      ResponseHandler responseHandler) async {
    var url = Uri.parse("${NetworkApiConstants.kBaseUrl}update_user/$id");
    try {
      var data = {
        "user_name": name,
        "user_number": phone,
        "user_address": address
      };
      final response = await http.put(url, body: data);
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        responseHandler(true, map);
      } else {
        print('api failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // delete user
  static deleteUser(
      BuildContext context, int id, ResponseHandler responseHandler) async {
    var url = Uri.parse("${NetworkApiConstants.kBaseUrl}delete_user/$id");
    try{
      final response = await http.delete(url);
      if(response.statusCode == 200){
        var map = jsonDecode(response.body);
        responseHandler(true, map);
      } else {
        print('api failed');
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }
}
