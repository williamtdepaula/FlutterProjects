import 'dart:convert';

import 'package:cars_flutter/models/ApiResponse.dart';
import 'package:cars_flutter/models/Cars.dart';
import 'package:http/http.dart' as http;

import '../models/User.dart';

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
      print('Response body: ${responseBody}');

      if (response.statusCode == 200) {
        //Caso ocorreu a requisição corretamente
        return ApiResponse.ok(User(responseBody));
      }

      return ApiResponse.error(responseBody[
          'error']); //Caso não ocorreu corretamente, envio a mensagem da API

    } catch (error, exception) {
      print('ERROR REQUEST $error');
      return ApiResponse.error('Não foi possível completar a requisição');
    }
  }

  static List<Car> getCars() {
    //try {

    String loginURL = 'https://carros-springboot.herokuapp.com/api/v2/login';

    List<Car> cars = [];

    cars.add(Car(
      nome: 'Ferrari FF',
      urlFoto:
          'http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png',
      descricao: 'Carro ferrari',
    ));
    cars.add(Car(
      nome: 'Porsche Panamera',
      urlFoto:
          "http://www.livroandroid.com.br/livro/carros/esportivos/Porsche_Panamera.png",
      descricao: 'Carro ferrari',
    ));
    cars.add(Car(
      nome: 'Lamborghini Aventador',
      urlFoto:
          'http://www.livroandroid.com.br/livro/carros/esportivos/Lamborghini_Aventador.png',
      descricao: 'Carro ferrari',
    ));

    return cars;
    /*} catch (error, exception) {
      print('ERROR REQUEST $error');
      return Car();
      //return ApiResponse.error('Não foi possível completar a requisição');
    }*/
  }
}
