import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';

class StocksList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StocksList();
  }
}

class _StocksList extends State<StocksList> {
  List<bool> selected = [false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBar('Search for an Item', searchOrder),
          Container(
            alignment: Alignment.topCenter,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StockCreation(),
                  ),
                );
              },
              child: Text('ADD STOCKS'),
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return StocksTemplate('Vegetable>Greens>Exotic', 'Wal-Penera',
                      selected[index], selectStock, index);
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

  void selectStock(int index) {
    setState(() {
      selected = selected.map((e) => e = false).toList();
      selected[index] = true;
    });
  }
}
