import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'components/header/header_widget.dart';
import 'components/login_form/login_form_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: HeaderWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.35,
                left: size.height * 0.04,
                right: size.height * 0.04,
              ),
              child: TripleBuilder(
                store: controller.store,
                builder: (context, triple) {
                  return buildForm(
                      controller.store.error?.message, controller.store.state);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildForm(String? messageError, AuthModel model) {
    return LoginFormWidget(
      loading: false,
      emailChanged: controller.setEmail,
      errorMsg: messageError,
      passwordChanged: controller.setPassword,
      loginPressed: () =>
          controller.login(model.email, model.password, messageError),
    );
  }
}
