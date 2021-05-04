import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../../shared/helpers/custom_colors.dart';
import '../../../../../domain/entities/enterprises_entity.dart';

class EnterpriseTile extends StatelessWidget {
  final EnterpriseEntity enterprise;
  final int number;

  EnterpriseTile({
    Key? key,
    required this.enterprise,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed('enterprise/$number', arguments: enterprise);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Row(
            children: [
              Expanded(
                child: Hero(
                  tag: 'enterprise$number',
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.red,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/loading.gif',
                            image: enterprise.urlImage,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          color: CustomColors.blue.withOpacity(0.8),
                        ),
                        Center(
                            child: Text(
                          enterprise.enterpriseName,
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
