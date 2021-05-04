import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_home/app/module/domain/entities/enterprises_entity.dart';
import 'package:module_home/app/module/domain/repositories/enterprise_repository_interface.dart';
import 'package:module_home/app/module/domain/usecases/get_all_enterprise.dart';

import 'get_all_enterprise_test.mocks.dart';

@GenerateMocks([IEnterpriseRepository])
void main() {
  late GetAllEnterprise _usecase;
  final _repository = MockIEnterpriseRepository();

  setUp(() {
    _usecase = GetAllEnterprise(_repository);
  });

  group('Testes de sucesso', () {
    test('''
          Dado uma requisição para buscar empresas
          Quando retorno for sucesso
          Deve Retornar Lista de Empresas
    ''', () async {
      //prepare
      when(_repository.get())
          .thenAnswer((_) async => Right(<EnterpriseEntity>[]));

      //execute
      final result = await _usecase();

      // assert
      expect(result.fold(id, id), isA<List<EnterpriseEntity>>());
      verify(_repository.get()).called(1);
      verifyNoMoreInteractions(_repository);
    });
  });
}
