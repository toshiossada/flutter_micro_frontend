import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../auth/local_storage/interfaces/auth_repository_interface.dart';
import '../../../auth/stores/auth_store.dart';
import '../../errors.dart';

class CustomInterceptors extends InterceptorsWrapper {
  final AuthStore store;
  final IAuthLocalStorage authLocalStorage;

  CustomInterceptors({
    required this.store,
    required this.authLocalStorage,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    var token = store.state.apiToken;
    var client = store.state.client;
    var uid = store.state.uid;

    if (token.isNotEmpty) {
      var headerAuth = _genToken(token);
      options.headers['Authorization'] = headerAuth;

      options.headers.addAll({
        "Content-Type": "application/json",
        "access-token": token,
        "client": client,
        "uid": uid,
      });
    }
    //Imprimindo informações do request para debug
    if (kDebugMode) {
      debugPrint(json.encode("BaseURL: ${options.baseUrl}"));
      debugPrint(json.encode("Endpoint: ${options.path}"));
      if (options.headers['access-token'] != null) {
        debugPrint("access-token: ${options.headers['access-token']}");
      }
      if (options.data != null) {
        debugPrint("Payload ${json.encode(options.data)}");
      }
    }
    handler.next(options);
  }

  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint("response: ${json.encode(response.data)}");
    handler.next(response);
  }

  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    DioFailure failure;
    if (err.response?.statusCode == 401) {
      failure = DioFailure(
        err,
        msg: 'Falha ao realizar login.',
      );
      //Renovar o Token ou voltar para a tela de login
      authLocalStorage.clear();
      Modular.to.navigate('/login');
    } else {
      failure =
          DioFailure(err, msg: 'Ocorreu um erro na requisição com o servidor');
    }

    handler.next(failure);
  }

  String _genToken(String token) {
    return 'Bearer $token';
  }
}
