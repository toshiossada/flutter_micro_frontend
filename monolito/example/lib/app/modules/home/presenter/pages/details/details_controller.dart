import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../domain/entities/enterprises_entity.dart';
import '../../stores/home_store.dart';
import 'details_store.dart';

class DetailsController {
  final EnterpriseEntity enterprise;
  final HomeStore homeStore;
  final DetailsStore detailsStore;
  int index = 0;
  DetailsController(this.homeStore, this.detailsStore,
      {@Data required this.enterprise}) {
    index = homeStore.state.enterprises.indexOf(enterprise);
    setPage(index);
  }

  void setPage(int value) {
    var enterprise = homeStore.state.enterprises[value];
    detailsStore.setPage(enterprise: enterprise, page: value);
  }
}
