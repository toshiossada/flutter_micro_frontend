import 'package:flutter/material.dart';

import '../../../../../../../../shared/components/default_flat_button/default_flat_button_widget.dart';
import '../../../../../../../../shared/components/default_text_field/default_text_field_widget.dart';
import '../../../../../../../../shared/components/password_text_form_field/password_text_form_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  final bool loading;
  final VoidCallback loginPressed;
  final Function(String) emailChanged;
  final Function(String) passwordChanged;
  final String? errorMsg;
  const LoginFormWidget({
    Key? key,
    required this.loading,
    required this.loginPressed,
    required this.emailChanged,
    required this.passwordChanged,
    this.errorMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DefaultTextFieldWidget(
                labelText: 'Email',
                fontColor: Colors.black.withOpacity(0.8),
                backgroundColor: Colors.transparent,
                onChanged: emailChanged,
                errorMessage: errorMsg),
            SizedBox(height: 40),
            PasswordTextFormFieldWidget(
                fontColor: Colors.black.withOpacity(0.8),
                backgroundColor: Colors.transparent,
                onChanged: passwordChanged,
                validator: () => {},
                label: 'Senha',
                errorMessage: errorMsg),
            Visibility(
              visible: (errorMsg?.length ?? 0) != 0,
              child: Align(
                alignment: Alignment.topRight,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: size.height * 0.3,
                  ),
                  child: Text(
                    errorMsg ?? '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DefaultFlatButtonWidget(
                    label: "ENTRAR",
                    onPressed: loginPressed,
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
