import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:module_splash/app/module/domain/errors/errors.dart';
import 'package:module_splash/app/module/domain/repositories/auth_repository_interface.dart';
import 'package:module_splash/app/module/domain/usecases/get_logged_user.dart';

import 'get_logged_user_test.mocks.dart';

@GenerateMocks([IAuthenticateRepository])
void main() {
  late GetLoggedUser _usecase;
  final _repository = MockIAuthenticateRepository();

  setUp(() {
    _usecase = GetLoggedUser(_repository);
  });

  group('Testes de sucesso', () {
    test('''
          Dado a requisiçao de busca de usuario no banco de dados local
          Quando localstorage retornar pelo menos um usuario
          Então deve retornar usuario valido
    ''', () async {
      //prepare
      var auth = AuthModel(email: '', password: '');
      when(_repository.get()).thenAnswer((_) async => Right(auth));

      //execute
      final result = await _usecase();

      // assert
      expect(result.fold(id, id), isA<AuthModel>());
      expect(result.fold(id, id), equals(auth));
      verify(_repository.get()).called(1);
      verifyNoMoreInteractions(_repository);
    });
  });

  group('Testes de Falhas', () {
    test('''
          Dado a requisiçao de busca de usuario no banco de dados local
          Quando localstorage retornar nenhum usuario
          Então deve retornar Erro
    ''', () async {
      //prepare
      when(_repository.get()).thenAnswer(
          (_) async => Left(UserNotFound(message: 'Usuario não esta logado')));

      //execute
      final result = await _usecase();

      // assert
      expect(result.fold(id, id), isA<UserNotFound>());
      verify(_repository.get()).called(1);
      verifyNoMoreInteractions(_repository);
    });
  });
}
