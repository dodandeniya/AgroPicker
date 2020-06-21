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

class _DashboardView extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton.getInstance();
  TabController _tabController;

  final List<String> _tabs = <String>["PRODUCT STORE", "MY ORDERS"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (userStatusSingleton.image != null) {
      precacheImage(userStatusSingleton.image.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardordersBloc>(
          create: (c) => DashboardordersBloc(),
        ),
        BlocProvider<DashboardproductstockBloc>(
          create: (c) => DashboardproductstockBloc(),
        ),
      ],
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
              drawer: Container(
                width: 250,
                child: Drawer(
                  child: DashboardDrawer(),
                ),
              ),
              appBar: AppBar(
                title: Text('Agro Picker Dashboard'),
                bottom: TabBar(
                  onTap: (ind) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: _tabController,
                  tabs: _tabs
                      .map((e) => Tab(
                            child: Text(e),
                          ))
                      .toList(),
                ),
              ),
              body: DashboardPage(
                tabController: _tabController,
              )),
        ),
      ),
    );
  }
}
