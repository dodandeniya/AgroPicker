import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashBoardPageState();
  }
}

class _DashBoardPageState extends State<DashboardPage> {
  Users user;
  String name = '';
  DashboardBloc _dashboardBloc;

  @override
  void initState() {
    super.initState();
    _dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    _dashboardBloc..add(StartUpdateDashboard());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is UpdateDashboard) {
          setState(() {
            user = state.user;
            name = user.displayName;
          });
        }
      },
      child: Scaffold(
        body: _buildTest(context),
      ),
    );
  }

  Widget _buildTest(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(child: Text('Welcome $name!')),
      ],
    );
  }
}
