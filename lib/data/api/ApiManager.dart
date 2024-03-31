import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/data/api/ApiConstatnts.dart';
import 'package:flutter_e_commerce_c10_sun3/data/model/request/LoginRequest.dart';
import 'package:flutter_e_commerce_c10_sun3/data/model/request/RegisterRequest.dart';
import 'package:flutter_e_commerce_c10_sun3/data/model/response/LoginResponseDto.dart';
import 'package:flutter_e_commerce_c10_sun3/data/model/response/RegisterResponseDto.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance ;

  static ApiManager getInstance(){
    _instance??= ApiManager._();
    return _instance!;
  }
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password,
      String rePassword, String phone) async {
    var connectivityResult = await Connectivity()
        .checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoint.registerApi);
      var registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          phone: phone,
          rePassword: rePassword
      );
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse = RegisterResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(registerResponse);
      }else{
        return Left(ServerError(errorMessage: registerResponse.error!= null?
        registerResponse.error!.msg!:
            registerResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }


  Future<Either<Failures, LoginResponseDto>> login(String email, String password) async {
    var connectivityResult = await Connectivity()
        .checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoint.loginApi);
      var loginRequest = LoginRequest(
        email: email,
        password: password
      );
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = LoginResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(loginResponse);
      }else{
        return Left(ServerError(errorMessage: loginResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}