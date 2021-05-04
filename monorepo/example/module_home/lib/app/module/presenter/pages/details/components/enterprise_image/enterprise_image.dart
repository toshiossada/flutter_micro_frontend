import 'package:flutter/material.dart';
import '../../../../../domain/entities/enterprises_entity.dart';

class EnterpriseImageWidget extends StatelessWidget {
  final EnterpriseEntity enterprise;
  final List<EnterpriseEntity> enterprises;
  final Function(int) onPageChanged;
  final int index;

  const EnterpriseImageWidget({
    Key? key,
    required this.enterprise,
    required this.enterprises,
    required this.onPageChanged,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.08,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            controller:
                PageController(initialPage: index, viewportFraction: 0.5),
            onPageChanged: onPageChanged,
            itemCount: enterprises.length,
            itemBuilder: (_, index) {
              var enterprise = enterprises[index];
              return Hero(
                tag: 'enterprise${enterprise.id}',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage.assetNetwork(
                      fadeInDuration: Duration(seconds: 2),
                      fadeInCurve: Curves.bounceIn,
                      placeholder: 'assets/loading.gif',
                      image: enterprise.urlImage,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
