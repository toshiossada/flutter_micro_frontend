import '../../models/enterprise_model.dart';

abstract class IEnterpriseDatasource {
  Future<List<EnterpriseModel>> get();
}
