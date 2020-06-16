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
  Image img;
  bool isOnline = true;
  final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton.getInstance();
  Users user;

  @override
  void initState() {
    super.initState();
    user = userStatusSingleton.user;
    img = Image.network(
      user.profileImage,
    );
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
                CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  radius: 50,
                  child: ClipOval(
                    child: img,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.topCenter,
                  child: Text('${user.firstName} ${user.lastName}'),
                )
              ],
            ),
          ),
          SwitchListTile(
            title: Text('Status'),
            subtitle: isOnline ? Text('Online') : Text('Offline'),
            value: isOnline,
            onChanged: (val) {
              setState(() {
                isOnline = val;
              });
            },
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
