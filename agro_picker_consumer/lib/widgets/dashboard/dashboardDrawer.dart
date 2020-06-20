import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardDrawer();
  }
}

class _DashboardDrawer extends State<DashboardDrawer> {
  final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton.getInstance();
  Users user;

  @override
  void initState() {
    super.initState();
    user = userStatusSingleton.user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
            child: Column(
              children: <Widget>[
                userStatusSingleton.image == null
                    ? Icon(
                        Icons.person,
                        size: 75,
                      )
                    : CircleAvatar(
                        backgroundColor: Theme.of(context).accentColor,
                        radius: 50,
                        backgroundImage: userStatusSingleton.image.image,
                      ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.topCenter,
                  child: Text('${user.firstName} ${user.lastName}'),
                )
              ],
            ),
          ),
          ListTile(
            title: Text('Settings'),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          ),
        ],
      ),
    );
  }
}
