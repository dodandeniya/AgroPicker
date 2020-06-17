import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<String> _tabs = <String>["SUMMARY", "MY ORDERS", "MY STOCKS"];
  final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton.getInstance();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(userStatusSingleton.image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardsummaryBloc>(
          create: (c) => DashboardsummaryBloc(),
        ),
        BlocProvider<UserStatusBloc>(
          create: (c) => UserStatusBloc(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
            drawer: Container(
              width: 250,
              child: Drawer(
                child: HomeDrawer(),
              ),
            ),
            appBar: AppBar(
              title: Text('Agro Picker'),
              bottom: TabBar(
                controller: _tabController,
                tabs: _tabs
                    .map((e) => Tab(
                          child: Text(e),
                        ))
                    .toList(),
              ),
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: HomeScreen(
                tabController: _tabController,
              ),
            )),
      ),
    );
  }
}
