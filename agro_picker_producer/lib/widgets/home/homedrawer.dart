import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeDrawer();
  }
}

class _HomeDrawer extends State<HomeDrawer> {
  bool isOnline;
  final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton.getInstance();
  Users user;
  UserStatusBloc userStatusBloc;

  @override
  void initState() {
    super.initState();
    user = userStatusSingleton.user;
    isOnline = user.isOnline;
    userStatusBloc = BlocProvider.of<UserStatusBloc>(context);
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
          BlocListener<UserStatusBloc, UserStatusState>(
            listener: (context, state) {
              if (state is UserStatusOffline) {
                setState(() {
                  isOnline = false;
                });
              }
              if (state is UserStatusOnline) {
                setState(() {
                  isOnline = true;
                });
              }
            },
            child: SwitchListTile(
              title: Text('Status'),
              subtitle: isOnline ? Text('Online') : Text('Offline'),
              value: isOnline,
              onChanged: (val) {
                userStatusBloc.add(ChangeUserStatus(val));
              },
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
