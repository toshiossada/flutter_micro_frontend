import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../shared/components/rounded_text_field/rounded_text_field_widget.dart';
import '../../../../../../shared/helpers/custom_colors.dart';
import '../../../../../../shared/helpers/errors.dart';
import '../../../../../../shared/helpers/utils.dart';
import '../../stores/home_store.dart';
import '../../view_models/enterprise_view_model.dart';
import 'components/drawer/drawer_widget.dart';
import 'components/enterprises_tile/enterprises_tile_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .1),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF8325BB),
                    Color(0xFFAF1A7D),
                    Color(0xFFCB2E6C),
                    Color(0xFFDE94BC),
                  ]),
            ),
          ),
          title: RoundedTextFieldWidget(
            prefixIcon: Icon(
              Icons.search,
              color: CustomColors.grey40,
            ),
            showBorder: false,
            backgroundColor: Colors.white.withOpacity(0.7),
            hintText: 'Encontre uma empresa',
            onChanged: (v) {
              controller.store.setFilter(v!);
            },
          ),
          elevation: 1,
        ),
      ),
      drawer: DrawerWidget(
        logOut: controller.logout,
      ),
      body: Column(
        children: [
          Expanded(
            child: ScopedBuilder<HomeStore, Failure, EnterpriseVM>(
              store: controller.store,
              onLoading: (_) => Center(child: CircularProgressIndicator()),
              onError: (_, error) => Utils.buildError(
                  'Erro ao realizar busca: ${error?.message ?? ''}'),
              onState: (_, state) {
                if (state.enterprises.length == 0) {
                  return Center(
                    child: Container(
                      child: Text('Nada encontrado'),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.enterpriseFiltered.length,
                  itemBuilder: (_, index) {
                    var enterprise = state.enterpriseFiltered[index];
                    var number = enterprise.id;

                    return EnterpriseTile(
                      enterprise: enterprise,
                      number: number,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
