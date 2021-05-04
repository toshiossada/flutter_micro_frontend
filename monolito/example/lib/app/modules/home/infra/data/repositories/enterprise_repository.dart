import 'package:dartz/dartz.dart';

import '../../../../../../shared/helpers/errors.dart';
import '../../../domain/entities/enterprises_entity.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/enterprise_repository_interface.dart';
import '../datasources/enterprise_datasource_interface.dart';

class EnterpriseRepository implements IEnterpriseRepository {
  final IEnterpriseDatasource _datasource;

  EnterpriseRepository(this._datasource);

  @override
  Future<Either<Failure, List<EnterpriseEntity>>> get() async {
    try {
      var result = <EnterpriseEntity>[];
      var listEnterprise = await _datasource.get();

      result = listEnterprise
          .map((e) => EnterpriseEntity(
                id: e.id,
                enterpriseName: e.enterpriseName.toUpperCase(),
                description: e.description,
                photo: e.photo,
              ))
          .toList();

      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    } on Exception catch (error) {
      return Left(FailureGetEnterprises(message: error.toString()));
    }
  }
}
