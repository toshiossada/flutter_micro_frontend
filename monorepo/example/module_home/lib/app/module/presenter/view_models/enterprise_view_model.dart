import 'package:flutter/foundation.dart';

import '../../domain/entities/enterprises_entity.dart';

@immutable
class EnterpriseVM {
  final List<EnterpriseEntity> enterprises;
  final String filter;
  List<EnterpriseEntity> get enterpriseFiltered => enterprises
      .where(
          (e) => e.enterpriseName.toUpperCase().contains(filter.toUpperCase()))
      .toList();

  EnterpriseVM({
    this.enterprises = const <EnterpriseEntity>[],
    this.filter = '',
  });

  EnterpriseVM copyWith({
    List<EnterpriseEntity>? enterprises,
    String? filter,
  }) {
    return EnterpriseVM(
      enterprises: enterprises ?? this.enterprises,
      filter: filter ?? this.filter,
    );
  }
}
