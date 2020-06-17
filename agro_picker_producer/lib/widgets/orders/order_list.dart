import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderList();
  }
}

class _OrderList extends State<OrderList> {
  List<bool> selected = [false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBar('Search Order', searchOrder, clearOrder),
          ListTile(
            title: Text('Pending Orders'),
            subtitle: Text('Count : 16'),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return OrderTemplate(
                      '34005698',
                      'June 15, 2020 at 9:46:14 PM',
                      selected[index],
                      selectOrder,
                      index);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 2),
          ),
        ],
      ),
    );
  }

  void searchOrder(String orderName) {
    print(orderName);
  }

  void selectOrder(int index) {
    setState(() {
      selected = selected.map((e) => e = false).toList();
      selected[index] = true;
    });
  }

  void clearOrder() {}
}
