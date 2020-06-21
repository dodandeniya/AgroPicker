import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';
import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Registration();
  }
}

class _Registration extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: true,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(),
            child: RegistrationPage(),
          ),
        ),
      ),
    );
  }
}
