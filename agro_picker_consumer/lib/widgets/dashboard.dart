import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_consumer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardView();
  }
}

class _DashboardView extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: BlocProvider<DashboardBloc>(
              create: (c) => DashboardBloc(),
              child: DashboardPage(),
            )),
      ),
    );
  }
}
