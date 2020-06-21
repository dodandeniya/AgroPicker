import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_consumer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  final TabController tabController;
  DashboardPage({this.tabController});

  @override
  State<StatefulWidget> createState() {
    return _DashBoardPageState();
  }
}

class _DashBoardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [ProductStockList(), OrderList()],
    );
  }
}
