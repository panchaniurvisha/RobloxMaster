import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roblox_master/model/boys_all_data_model.dart';

import '../../model/pet_model.dart';
import '../model/best_games_model.dart';
import '../model/games_code_model.dart';
import '../model/girls_all_data_model.dart';
import '../res/constant/api_constant.dart';

class ApiService {
  Future<PetModel> fetchPetModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/Robloxpet.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return PetModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load PetModel');
    }
  }

  Future<GamesCodeModel> fetchGamesCodeModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/code.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return GamesCodeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load GamesCodeModel');
    }
  }

  Future<BoysModel> fetchBoysModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/boy.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return BoysModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load BoysModel');
    }
  }

  Future<BoysClassicPants> fetchBoysPentsModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/BoysClassicPants.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return BoysClassicPants.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load BoysClassicPants');
    }
  }

  Future<BoysClassicShirts> fetchBoysClassicShirts() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/BoysClassicShirts.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return BoysClassicShirts.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load BoysClassicShirts');
    }
  }

  Future<BoysSweaterModel> fetchBoysSweaterModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/BoysSweaters.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return BoysSweaterModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load BoysSweaterModel');
    }
  }

  Future<BoysTShirtModel> fetchBoysTShirtsModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/BoysT-Shirt.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return BoysTShirtModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load BoysTShirtModel');
    }
  }

  Future<GirlsModel> fetchGirlsModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/girl.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return GirlsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load GirlsModel');
    }
  }

  Future<GirlsClassicShirtsModel> fetchGirlsClassicShirtModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/GirlsClassicShirts.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return GirlsClassicShirtsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load GirlsClassicShirtsModel');
    }
  }

  Future<GirlsClassicPantsModel> fetchGirlsPentsModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/GirlsClassicPants.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return GirlsClassicPantsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load GirlsClassicPantsModel');
    }
  }

  Future<GirlsSweaterModel> fetchGirlsSweaterModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/GirlsSweaters.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return GirlsSweaterModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load GirlsSweaterModel');
    }
  }

  Future<GirlsTShirtsModel> fetchGirlsTShirtsModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/GirlsT-Shirt.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return GirlsTShirtsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load GirlsTShirtsModel');
    }
  }

  Future<BestGamesModel> fetchBestGamesModel() async {
    final response = await http.get(Uri.parse(
      '${ApiConstant.baseUrl}/games.json',
    ));

    if (response.statusCode == 200) {
      debugPrint('Get data : ${response.statusCode}');
      return BestGamesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load BestGamesModel');
    }
  }
}
