import 'package:flutter/material.dart';
import '../../helpers/custom_colors.dart';

class DefaultFlatButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const DefaultFlatButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            label,
            style: TextStyle(color: CustomColors.whisper),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          backgroundColor: MaterialStateProperty.all<Color>(CustomColors.ruby),
        ),
      ),
    );
  }
}
