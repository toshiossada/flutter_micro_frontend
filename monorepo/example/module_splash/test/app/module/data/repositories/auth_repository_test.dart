import 'package:commons/shared/auth/local_storage/interfaces/auth_repository_interface.dart';
import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:module_splash/app/module/data/repositories/auth_repository.dart';
import 'package:module_splash/app/module/domain/errors/errors.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([IAuthLocalStorage])
void main() {
  late AuthenticateRepository _repository;
  final _localStorage = MockIAuthLocalStorage();

  setUp(() {
    _repository = AuthenticateRepository(_localStorage);
  });

  group('Testes de sucesso', () {
    test('''
          Dado a requisiçao de busca de usuario no banco de dados local
          Quando localstorage retornar pelo menos um usuario
          Então deve retornar usuario valido
    ''', () async {
      //prepare
      var auth = <AuthModel>[
        AuthModel(email: '', password: ''),
      ];
      when(_localStorage.getAll()).thenAnswer((_) async => auth);

      //execute
      final result = await _repository.get();

      // assert
      expect(result.fold(id, id), isA<AuthModel>());
      expect(result.fold(id, id), equals(auth.first));
      verify(_localStorage.getAll()).called(1);
      verifyNoMoreInteractions(_localStorage);
    });
  });

  group('Testes de Falhas', () {
    test('''
          Dado a requisiçao de busca de usuario no banco de dados local
          Quando localstorage retornar nenhum usuario
          Então deve retornar Erro
    ''', () async {
      //prepare
      var auth = <AuthModel>[];
      when(_localStorage.getAll()).thenAnswer((_) async => auth);

      //execute
      final result = await _repository.get();

      // assert
      expect(result.fold(id, id), isA<UserNotFound>());
      verify(_localStorage.getAll()).called(1);
      verifyNoMoreInteractions(_localStorage);
    });
  });
}
