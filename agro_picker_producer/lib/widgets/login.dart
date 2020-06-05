import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: BlocProvider<LoginBloc>(
              create: (c) => LoginBloc(),
              child: LoginPage(),
            )),
      ),
    );
  }
}
