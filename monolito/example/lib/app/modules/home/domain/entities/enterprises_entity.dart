import 'package:flutter/foundation.dart';

@immutable
class EnterpriseEntity {
  final int id;
  final String enterpriseName;
  final String description;
  final String photo;

  String get urlImage => 'https://empresas.ioasys.com.br/$photo';

  const EnterpriseEntity({
    this.id = 0,
    this.enterpriseName = '',
    this.description = '',
    this.photo = '',
  });

  EnterpriseEntity copyWith({
    int? id,
    String? enterpriseName,
    String? description,
    String? photo,
  }) {
    return EnterpriseEntity(
      id: id ?? this.id,
      enterpriseName: enterpriseName ?? this.enterpriseName,
      description: description ?? this.description,
      photo: photo ?? this.photo,
    );
  }
}
