import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_home/app/module/domain/entities/enterprises_entity.dart';
import 'package:module_home/app/module/infra/data/datasources/enterprise_datasource_interface.dart';
import 'package:module_home/app/module/infra/data/repositories/enterprise_repository.dart';
import 'package:module_home/app/module/infra/models/enterprise_model.dart';

import 'enterprise_repository_test.mocks.dart';

@GenerateMocks([IEnterpriseDatasource])
void main() {
  late EnterpriseRepository _repository;
  final _datasource = MockIEnterpriseDatasource();

  setUp(() {
    _repository = EnterpriseRepository(_datasource);
  });

  group('Testes de sucesso', () {
    test('''
          Dado uma requisição para buscar empresas
          Quando retorno for sucesso
          Então deve retornar Lista de Empresas
    ''', () async {
      //prepare
      when(_datasource.get()).thenAnswer((_) async => <EnterpriseModel>[]);

      //execute
      final result = await _repository.get();

      // assert
      expect(result.fold(id, id), isA<List<EnterpriseEntity>>());
      verify(_datasource.get()).called(1);
      verifyNoMoreInteractions(_datasource);
    });
  });

  group('Testes de Falhas', () {
    test('''
          Dado uma requisição para buscar empresas
          Quando datasource lançar excessão
          Deve retornar Falha
    ''', () async {
      //prepare
      var err = DioError(requestOptions: RequestOptions(path: ''));
      when(_datasource.get()).thenThrow(DioFailure(err, msg: 'message'));

      //execute
      final result = await _repository.get();

      // assert
      expect(result.fold(id, id), isA<DioFailure>());
      verify(_datasource.get()).called(1);
      verifyNoMoreInteractions(_datasource);
    });
  });
}
