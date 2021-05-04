import 'dart:convert';

import '../../domain/entities/enterprises_entity.dart';

class EnterpriseModel extends EnterpriseEntity{


  const EnterpriseModel({
    int id = 0,
    String enterpriseName = '',
    String description = '',
    String photo = '',
  }): super(
    id: id, 
    enterpriseName: enterpriseName,
    description: description,
    photo: photo
  );

  factory EnterpriseModel.fromMap(Map<String, dynamic>? json) {
    if (json == null) return EnterpriseModel();

    return EnterpriseModel(
      id: json['id'] ?? 0,
      enterpriseName: json['enterprise_name'] ?? '',
      description: json['description'] ?? '',
      photo: json['photo'] ?? '',
    );
  }

  factory EnterpriseModel.fromJson(String source) =>
      EnterpriseModel.fromMap(json.decode(source));
}
