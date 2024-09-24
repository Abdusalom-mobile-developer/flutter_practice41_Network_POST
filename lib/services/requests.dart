// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter_practice41_network_post/database/network_data.dart';
import 'package:flutter_practice41_network_post/screens/home.dart';
import 'package:flutter_practice41_network_post/services/logger.dart';
import 'package:http/http.dart';

//todo: HTTP requests

class NetworkRequests {
  //todo: POST
  static Future<void> POST(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    final response = await post(Uri.parse("https://fakestoreapi.com/products"),
        body: jsonEncode({
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category,
        }),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      LoggerClass.d("POST Operation");
      LoggerClass.d(response.statusCode.toString());
      LoggerClass.d(response.body);
      NetworkData.listOfNetworkData.add(jsonDecode(response.body));
    } else {
      LoggerClass.e(
          "POST operator failed. Status code: ${response.statusCode.toString()}");
    }
  }

  //todo: GET
  static Future<dynamic> GET() async {
    final response =
        await get(Uri.parse("https://fakestoreapi.com/products"), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      LoggerClass.d("GET Operation");
      LoggerClass.d(response.statusCode.toString());
      if(!HomeScreen.worked){
        NetworkData.listOfNetworkData.addAll(jsonDecode(response.body));
      }
      // LoggerClass.d(response.body);
      // LoggerClass.d(NetworkData.listOfNetworkData.toString());
    } else {
      LoggerClass.e(
          "GET operator failed. Status code: ${response.statusCode.toString()}");
    }
  }
}
