import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<String> _tabs = <String>["SUMMARY", "MY ORDERS", "MY STOCKS"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: HomeDrawer(),
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
          body: HomeScreen(
            tabController: _tabController,
          )),
    );
  }
}
