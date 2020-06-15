import 'package:flutter/material.dart';

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
    return TabBarView(
      controller: widget.tabController,
      children: [
        ListView(
          children: <Widget>[
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            ),
            ListTile(
              title: Text('Data1'),
            )
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(
              title: Text('Data1'),
            )
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(
              title: Text('Data1'),
            )
          ],
        ),
      ],
    );
  }
}
