import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashBoardPageState createState() {
    return _DashBoardPageState();
  }
}

class _DashBoardPageState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
              },
            )
          ],
        ),
        body: _dashboardBody(context),
    );
  }

  Widget _dashboardBody(BuildContext context) {
    UserRepository _userRepository = UserRepository();
    return StreamBuilder(
      stream: _userRepository.getUserDataStream(),
      builder: (context, snapshot) {
       if (!snapshot.hasData) return LinearProgressIndicator();

       return _buildTest(context, snapshot.data);
     },
    );
  }

   Widget _buildTest(BuildContext context, DocumentSnapshot snapshot) {
     final record = UserModel.fromJson(snapshot.data);
     String name = record.displayName;
     return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(child: Text('Welcome $name!')),
              ],
            );
   }

}
