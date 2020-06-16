import 'package:agro_picker_bloc/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final TabController tabController;
  HomeScreen({this.tabController});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardsummaryBloc>(
            create: (c) => DashboardsummaryBloc()),
      ],
      child: TabBarView(
        controller: widget.tabController,
        children: [
          HomeSummary(),
          OrderList(),
          StocksList(),
        ],
      ),
    );
  }
}
