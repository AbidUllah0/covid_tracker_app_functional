import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Data/models/WorldStatedModel.dart';
import '../Utils/App_Url/app_url.dart';

class StatesServices {
  Future<WorldStateModel> fetchWorldStatedModel() async {
    final responce = await http.get(
      Uri.parse(AppUrl.worldStatedApi),
    );

    var data = jsonDecode(responce.body);

    if (responce.statusCode == 200) {
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> getCountryList() async {
    // var data;
    final responce = await http.get(
      Uri.parse(AppUrl.countriesList),
    );

    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      return data;
    } else {
      throw Exception('Exception');
    }
  }
}
