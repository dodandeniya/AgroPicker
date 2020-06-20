import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StocksTemplate extends StatefulWidget {
  final ProductStores productStores;
  StocksTemplate(this.productStores);

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
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          backgroundImage: NetworkImage(widget.productStores.productImage),
        ),
        enabled: true,
        title: Text(
            '${widget.productStores.product.type.name.firstLetterCapital} > ${widget.productStores.product.name.firstLetterCapital}'),
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        isThreeLine: true,
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
      ),
    );
  }
}
