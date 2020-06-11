import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_consumer/agro_picker_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPage();
  }
}

class _RegistrationPage extends State<RegistrationPage> {
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state.isSuccess) {
          return RegistrationSucess();
        }
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Card(
            child: RegistrationEmail(
              emailController: _emailEditingController,
              formKey: formKey,
              passwordController: _passwordEditingController,
              confirmPasswordController: _confirmPasswordEditingController,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _confirmPasswordEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }
}
