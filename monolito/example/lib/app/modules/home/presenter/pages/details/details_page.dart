import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../shared/helpers/custom_colors.dart';
import '../../../../../../shared/helpers/errors.dart';
import '../../../../../../shared/helpers/utils.dart';
import '../../view_models/enterprise_details_view_model.dart';
import 'components/description/description_widget.dart';
import 'components/enterprise_image/enterprise_image.dart';
import 'details_controller.dart';
import 'details_store.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  const DetailsPage({
    Key? key,
    this.title = "Detail",
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailsPage, DetailsController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<DetailsStore, Failure, EnterpriseDetailsVM>(
      store: controller.detailsStore,
      onLoading: (_) => Container(),
      onError: (_, error) => Utils.buildError('Erro'),
      onState: (_, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(''),
            flexibleSpace: Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF8325BB),
                  Color(0xFFAF1A7D),
                  Color(0xFFCB2E6C),
                  Color(0xFFDE94BC),
                ],
              ),
            )),
          ),
          body: Stack(
            children: [
              Container(color: CustomColors.whisper),
              DescriptionWidget(
                description:
                    controller.detailsStore.state.enterprise.description,
                enterpriseName:
                    controller.detailsStore.state.enterprise.enterpriseName,
              ),
              EnterpriseImageWidget(
                enterprise: controller.detailsStore.state.enterprise,
                enterprises: controller.homeStore.state.enterprises,
                onPageChanged: controller.setPage,
                index: controller.index,
              ),
            ],
          ),
        );
      },
    );
  }
}
