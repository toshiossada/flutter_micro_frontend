import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_login/app/module/domain/entities/authenticate_entity.dart';
import 'package:module_login/app/module/domain/errors/errors.dart';
import 'package:module_login/app/module/domain/repositories/authenticate_repository_interface.dart';
import 'package:module_login/app/module/domain/usecases/post_authenticate_by_login.dart';
import 'package:dartz/dartz.dart';

import 'post_authenticate_by_login_test.mocks.dart';

@GenerateMocks([IAuthenticateRepository])
void main() {
  late PostAuthenticateByLogin _usecase;
  final _repository = MockIAuthenticateRepository();

  setUp(() {
    _usecase = PostAuthenticateByLogin(_repository);
  });

  group('Testes de sucesso', () {
    test('''
          Dado um login e senha validos
          Quando repository retornar usuario com sucesso
          Então deve retornar usuario valido
    ''', () async {
      //prepare
      var login = AuthenticateEntity(login: 'teste', password: '12345');
      when(_repository.authenticate(any))
          .thenAnswer((_) async => Right(AuthModel()));

      //execute
      final result = await _usecase(login);

      // assert
      expect(result.fold(id, id), isA<AuthModel>());
      verify(_repository.authenticate(any)).called(1);
      verifyNoMoreInteractions(_repository);
    });
  });

  group('Testes de Falhas', () {
    test('''
          Dado que o usuario
          Quando usuario ou senha não informado
          Então deve Retornar Falha
    ''', () async {
      //prepare
      var login = AuthenticateEntity(login: '', password: '');

      //execute
      final result = await _usecase(login);

      // assert
      expect(result.fold(id, id), isA<FailurePostAuthenticate>());
      verifyNever(_repository.authenticate(any));
    });
  });
}
