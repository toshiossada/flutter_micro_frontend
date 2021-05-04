import 'package:commons/shared/components/header_clipper/header_clipper.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 10),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipPath(
            clipper: HeaderClipper(_controller.value),
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFF8325BB),
                          Color(0xFFAF1A7D),
                          Color(0xFFCB2E6C),
                          Color(0xFFDE94BC),
                        ]),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo_home.png",
                            scale: 1.0,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Seja bem vindo ao empresas!",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .024,
                                color: Colors.white),
                          ),
                        ]),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
