import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyData {
  final String name;
  final String type;
  final String color;
  final String shop;
  final String size;
  final String transaction;
  final String quantity;
  final String price;
  final String processing;
  final String buyer;
  final String emails;

  MyData(
      {required this.name,
      required this.type,
      required this.color,
      required this.shop,
      required this.size,
      required this.transaction,
      required this.quantity,
      required this.price,
      required this.processing,
      required this.buyer,
      required this.emails});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      name: json['name'],
      type: json['type'],
      color: json['color'],
      shop: json['shop'],
      size: json['size'],
      transaction: json['transaction'],
      quantity: json['quantity'],
      price: json['price'],
      processing: json['processing'],
      buyer: json['buyer'],
      emails: json['emails'],
    );
  }
}

class ApiService {
  final String apiUrl;

  ApiService({required this.apiUrl});

  Future<MyData> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbxTAGRDPtaXoAZlnkjU-ZDM7AcE1PZCPwva3jz4pppW482HZpiRfGyR5kH7cb_DqrFfng/exec '));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return MyData.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load data');
    }
  }
}