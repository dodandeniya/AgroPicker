import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';

class StocksTemplate extends StatefulWidget {
  final String stockName;
  final String vendorName;
  final bool isSelected;
  final Function selectStocks;
  final int index;
  StocksTemplate(this.stockName, this.vendorName, this.isSelected,
      this.selectStocks, this.index);

  @override
  State<StatefulWidget> createState() {
    return _StocksTemplate();
  }
}

class _StocksTemplate extends State<StocksTemplate> {
  final List<String> stocksAvailabiltyList = [
    StockAvailabilty.Available.asString(),
    StockAvailabilty.Not_Available.splitString(),
    StockAvailabilty.Sold_Out.splitString(),
  ];
  String selectedStockAvailability = StockAvailabilty.Available.asString();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        selected: widget.isSelected,
        enabled: true,
        title: Text('${widget.stockName}'),
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        isThreeLine: true,
        subtitle: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Text('${widget.vendorName}'),
            ],
          ),
        ),
        trailing: DropdownButton(
          value: selectedStockAvailability,
          underline: Container(),
          items: stocksAvailabiltyList
              .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedStockAvailability = value;
            });
            print(value);
          },
        ),
        onTap: () {
          widget.selectStocks(widget.index);
        },
      ),
    );
  }
}
