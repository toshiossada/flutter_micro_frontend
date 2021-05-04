import 'package:flutter/material.dart';

import 'animated_radial_progress/animated_radial_progress_widget.dart';

class LoadingProgressIndicatorWidget extends StatelessWidget {
  final bool isCustom;
  final double opacity;
  final bool dismissibles;
  final Color color;
  final String loadingTxt;
  const LoadingProgressIndicatorWidget(
      {Key? key,
      this.opacity = 0.7,
      this.isCustom = false,
      this.dismissibles = false,
      this.color = Colors.black,
      this.loadingTxt = ''})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: opacity,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: isCustom
                  ? Stack(children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: AnimatedRadialProgressWidget(
                            size: 40,
                            animationConstant: 2,
                            assetPath: "assets/images/loading_sprite_2.png",
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: AnimatedRadialProgressWidget(
                            size: 85,
                            animationConstant: -2,
                            assetPath: "assets/images/loading_sprite_1.png",
                          ),
                        ),
                      ),
                    ])
                  : Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 10),
                      child: CircularProgressIndicator(),
                    ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(loadingTxt,
                  style: TextStyle(color: Colors.white70, fontSize: 18)),
            ),
          ],
        )),
      ],
    );
  }
}
