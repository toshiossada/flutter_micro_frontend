import 'dart:convert';

import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:commons/shared/helpers/errors.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_login/app/module/infra/external/datasources/authenticate_datasource.dart';
import 'package:module_login/app/module/infra/models/authenticate_model.dart';

import 'authenticate_datasource_test.mocks.dart';
import 'mocks/response_auth_mock.dart';

@GenerateMocks([DioForNative])
void main() {
  late AuthenticateDatasource _datasource;
  final _dio = MockDioForNative();

  setUp(() {
    _datasource = AuthenticateDatasource(_dio);
  });

  group('Testes de sucesso', () {
    test('''
          Dado um login e senha validos
          Quando endpoint retorna 200
          Então Retornar desserializar usuario e retornar
    ''', () async {
      //prepare
      var login = AuthenticateModel(login: 'teste', password: '12345');
      var response = {
        'email': ['testeapple@ioasys.com.br'],
        'password': ['12341234'],
        'access-token': ['bla'],
        'client': ['blabla'],
        'uid': ['blablabla']
      };
      var header = Headers.fromMap(response);
      var data = {"email": login.login, "password": login.password};
      when(_dio.post(any, queryParameters: data))
          .thenAnswer((_) async => Response(
                data: json.decode(responseAuthOk),
                headers: header,
                statusCode: 200,
                requestOptions: RequestOptions(path: '/users/auth/sign_in'),
              ));

      //execute
      final result = await _datasource.authenticate(login);

      // assert
      verify(_dio.post(any, queryParameters: data)).called(1);
      expect(result, isA<AuthModel>());
      equals(result.email == response['email']![0]);
      equals(result.password == response['password']![0]);
      equals(result.apiToken == response['access-token']![0]);
    });
  });
  group('''
          Dado um login e senha validos
          Quando Dio lançar uma excessão
          Então deve lançar um DioFailure
    ''', () {
    test('should return a DioFalure from API', () async {
      //arrange
      var login = AuthenticateModel(login: 'teste', password: '12345');
      var data = {"email": login.login, "password": login.password};

      var err = DioError(requestOptions: RequestOptions(path: ''));
      when(_dio.post(any, queryParameters: data))
          .thenThrow(DioFailure(err, msg: 'message'));

      //act
      final result = _datasource.authenticate(login);

      //assert
      verify(_dio.post(any, queryParameters: data)).called(1);
      expect(result, throwsA(isA<DioFailure>()));
    });
  });
}
