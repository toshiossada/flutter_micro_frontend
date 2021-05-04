import 'package:commons/shared/auth/local_storage/interfaces/auth_repository_interface.dart';
import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_login/app/module/domain/entities/authenticate_entity.dart';
import 'package:module_login/app/module/infra/data/datasources/authenticate_datasource_interface.dart';
import 'package:module_login/app/module/infra/data/repositories/authenticate_repository.dart';

import 'authenticate_repository_test.mocks.dart';

@GenerateMocks([IAuthenticateDatasource, IAuthLocalStorage])
void main() {
  late AuthenticateRepository _repository;
  final _datasource = MockIAuthenticateDatasource();
  final _localStorage = MockIAuthLocalStorage();

  setUp(() {
    _repository = AuthenticateRepository(_datasource, _localStorage);
  });

  group('Testes de sucesso', () {
    test('''
          Dado um login e senha validos
          Quando datasource retornar sucesso no login
          Deve então Retornar Usuario
    ''', () async {
      //prepare
      var login = AuthenticateEntity(login: 'teste', password: '12345');
      when(_datasource.authenticate(any)).thenAnswer((_) async => AuthModel());
      when(_localStorage.add(any)).thenAnswer((_) async => null);

      //execute
      final result = await _repository.authenticate(login);

      // assert
      expect(result.fold(id, id), isA<AuthModel>());
      verify(_datasource.authenticate(any)).called(1);
      verify(_localStorage.add(any)).called(1);
      verifyNoMoreInteractions(_datasource);
      verifyNoMoreInteractions(_localStorage);
    });
  });

  group('Testes de Falhas', () {
    test('''
          Dado um login e senha validos
          Quando datasource lançar uma Falha
          Então deve retornar Falha
    ''', () async {
      //prepare
      var login = AuthenticateEntity(login: 'teste', password: '12345');
      var err = DioError(requestOptions: RequestOptions(path: ''));
      when(_datasource.authenticate(any))
          .thenThrow(DioFailure(err, msg: 'message'));
      when(_localStorage.add(any)).thenAnswer((_) async => null);
      
      //execute
      final result = await _repository.authenticate(login);

      // assert
      expect(result.fold(id, id), isA<DioFailure>());
      verify(_datasource.authenticate(any)).called(1);
      verifyNoMoreInteractions(_datasource);
    });
  });
}
