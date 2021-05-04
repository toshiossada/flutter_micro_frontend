import 'package:dio/native_imp.dart';

import '../../../../../../shared/helpers/errors.dart';
import '../../data/datasources/enterprise_datasource_interface.dart';
import '../../models/enterprise_model.dart';

class EnterpriseDatasource implements IEnterpriseDatasource {
  final DioForNative _client;

  EnterpriseDatasource(this._client);

  @override
  Future<List<EnterpriseModel>> get() async {
    final response = await _client.get("/enterprises");
    var listEnterprise = <EnterpriseModel>[];
    if (response.statusCode == 200) {
      if (response.data.containsKey("enterprises") &&
          response.data["enterprises"].isNotEmpty) {
        listEnterprise = (response.data["enterprises"] as List)
            .map((e) => EnterpriseModel.fromMap(e))
            .toList();
      }

      return listEnterprise;
    } else {
      throw DatasourceError(message: "Falha");
    }
  }
}
