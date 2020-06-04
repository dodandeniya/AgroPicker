import 'package:agro_picker_consumer/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: RegistrationPage()),
      ),
    );
  }
}
