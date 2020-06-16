import 'package:flutter/material.dart';

class StocksAvailable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StocksAvailable();
  }
}

class _StocksAvailable extends State<StocksAvailable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('data'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 1),
    );
  }
}
