import 'dart:convert';

import 'package:cars_flutter/models/ApiResponse.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:http/http.dart' as http;

import '../models/User.dart';

class TypeCar {
  static final String classics = "classicos";

  static final String sporting = "esportivos";

  static final String lux = "luxo";
}

class Api {
  static Future<ApiResponse> login(String email, String password) async {
    try {
      String loginURL = 'https://carros-springboot.herokuapp.com/api/v2/login';

      var response = await http.post(
        loginURL,
        headers: {"Content-Type": "application/json"},
        body: json.encode({'username': email, 'password': password}),
      );

      Map responseBody = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        //Caso ocorreu a requisição corretamente
        User user = User(responseBody);

        user.saveUserOnPreferences();

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(responseBody[
          'error']); //Caso não ocorreu corretamente, envio a mensagem da API

    } catch (error, exception) {
      print('ERROR REQUEST $error');
      return ApiResponse.error('Não foi possível completar a requisição');
    }
  }

  static Future<List<Car>> getCars(String type) async {
    User userPrefs = await User.getUserFromPreferences();

    String loginURL =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$type';

    print("Get car >  $loginURL");

    var response = await http.get(loginURL, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${userPrefs.token}"
    });

    print('RESPONSE ${userPrefs.token}');

    List responseBody = json.decode(response.body);

    List<Car> carsResponse =
        responseBody.map((car) => Car.fromMap(car)).toList();

    return carsResponse;
  }

  static Future<String> getLorem() async {
    String url = 'https://loripsum.net/api';

    var response = (await http.get(url)).body;

    var text = response.replaceAll('<p>', "");

    text = text.replaceAll('</p>', "");

    return text;
  }

  static Future<ApiResponse<bool>> save(Car c) async {
    User user = await User.getUserFromPreferences();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';

    print("POST > $url");

    String json = c.toJson();

    print("   JSON > $json");

    var response = await http.post(url, body: json, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      Map mapResponse = jsonDecode(response.body);

      Car carro = Car.fromMap(mapResponse);

      print("Novo carro: ${carro.id}");

      return ApiResponse.ok(true);
    }

    Map mapResponse = jsonDecode(response.body);
    return ApiResponse.error(mapResponse["error"]);
  }
}
