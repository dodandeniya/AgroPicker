import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StocksTemplate extends StatefulWidget {
  final ProductStores productStores;
  final String vendorName;
  final bool isSelected;
  final Function selectStocks;
  final int index;
  StocksTemplate(this.productStores, this.vendorName, this.isSelected,
      this.selectStocks, this.index);

  @override
  State<StatefulWidget> createState() {
    return _StocksTemplate();
  }
}

class _StocksTemplate extends State<StocksTemplate> {
  final List<String> stocksAvailabiltyList = [
    StockAvailabilty.Available.splitString(),
    StockAvailabilty.Not_Available.splitString(),
    StockAvailabilty.Sold_Out.splitString(),
  ];
  String selectedStockAvailability;
  DashboardproductstockBloc dashboardproductstockBloc;

  @override
  void initState() {
    super.initState();
    dashboardproductstockBloc =
        BlocProvider.of<DashboardproductstockBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        selected: widget.isSelected,
        enabled: true,
        title: Text(
            '${widget.productStores.product.type.name} > ${widget.productStores.product.name}'),
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
          value: widget.productStores.status.splitString(),
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
            var selectedValue = StockAvailabilty.values
                .firstWhere((element) => element.splitString() == value);

            var updatedValue = {'status': selectedValue.asString()};
            dashboardproductstockBloc.add(
              UpdateStockItem(updatedValue, widget.productStores.storeId),
            );
          },
        ),
        onTap: () {
          widget.selectStocks(widget.index);
        },
      ),
    );
  }
}
