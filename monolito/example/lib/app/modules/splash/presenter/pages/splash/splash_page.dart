import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'components/ioasys_logo_widget.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.50),
                  child: IoasysLogoWidget(
                    size: screenHeight * 0.11,
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
