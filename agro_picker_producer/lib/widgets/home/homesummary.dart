import 'package:flutter/material.dart';

class HomeSummary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeSummary();
  }
}

class _HomeSummary extends State<HomeSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
                title: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Active Order Count',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '150',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )),
            ListTile(
                title: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Available Stocks Count',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '150',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
