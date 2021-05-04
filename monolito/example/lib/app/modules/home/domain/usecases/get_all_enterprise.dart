import 'package:dartz/dartz.dart';

import '../../../../../shared/helpers/errors.dart';
import '../entities/enterprises_entity.dart';
import '../repositories/enterprise_repository_interface.dart';
import 'interfaces/get_all_enterprise_interface.dart';

class GetAllEnterprise implements IGetAllEnterprise {
  final IEnterpriseRepository _enterpriseRepository;

  GetAllEnterprise(this._enterpriseRepository);
  @override
  Future<Either<Failure, List<EnterpriseEntity>>> call() async {
    var result = await _enterpriseRepository.get();

    return result;
  }
}
