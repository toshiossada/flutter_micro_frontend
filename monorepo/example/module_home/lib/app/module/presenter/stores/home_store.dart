import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/enterprises_entity.dart';
import '../view_models/enterprise_view_model.dart';

class HomeStore extends NotifierStore<Failure, EnterpriseVM> {
  HomeStore() : super(EnterpriseVM());

  void setFilter(String value) {
    var newState = state.copyWith(filter: value);
    execute(() async => newState);
  }

  void setEnterprises(
      Future<Either<Failure, List<EnterpriseEntity>>> value) async {
    setLoading(true);
    var result = await value;

    result.fold(
      setError,
      (r) {
        var newState = state.copyWith(enterprises: r);
        update(newState);
      },
    );
    setLoading(false);
  }
}
