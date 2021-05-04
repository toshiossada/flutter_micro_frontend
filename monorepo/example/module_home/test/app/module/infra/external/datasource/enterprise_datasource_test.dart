import 'dart:convert';

import 'package:commons/shared/helpers/errors.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_home/app/module/infra/external/datasources/enterprise_datasource.dart';
import 'package:module_home/app/module/infra/models/enterprise_model.dart';

import 'enterprise_datasource_test.mocks.dart';
import 'mocks/response_enterprise_mock.dart';

@GenerateMocks([DioForNative])
void main() {
  late EnterpriseDatasource _datasource;
  final _dio = MockDioForNative();

  setUp(() {
    _datasource = EnterpriseDatasource(_dio);
  });

  group('Testes de sucesso', () {
    test('''
          Dado uma requisição de busca de empresas
          Quando o retorno for 200
          Deve Retornar Lista de empresas
    ''', () async {
      //prepare
      when(_dio.get(any)).thenAnswer((_) async => Response(
            data: json.decode(responseOk),
            statusCode: 200,
            requestOptions: RequestOptions(path: '/enterprises'),
          ));

      //execute
      final result = await _datasource.get();

      // assert
      verify(_dio.get(any)).called(1);
      expect(result, isA<List<EnterpriseModel>>());
      equals(result.isNotEmpty);
      equals(result.length == 1);
    });
  });
  group('Testes de Falha', () {
    test('''
          Dado uma requisição de busca de empresas
          Quando Dio lançar uma excessão
          Então deve lançar um DioFailure
    ''', () async {
      //arrange
      var err = DioError(requestOptions: RequestOptions(path: ''));
      when(_dio.get(any)).thenThrow(DioFailure(err, msg: 'message'));

      //act
      final result = _datasource.get();

      //assert
      verify(_dio.get(any)).called(1);
      expect(result, throwsA(isA<DioFailure>()));
    });
  });
}
