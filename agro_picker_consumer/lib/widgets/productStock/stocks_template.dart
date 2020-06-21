import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_consumer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StocksTemplate extends StatefulWidget {
  final ProductStores productStores;
  final DashboardordersBloc ordersBloc;

  StocksTemplate(this.productStores, this.ordersBloc);

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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          backgroundImage: NetworkImage(widget.productStores.productImage),
        ),
        enabled: checkAvailability(
            widget.productStores.isVenderOnline, widget.productStores.status),
        title: setTitle(widget.productStores.product.name.firstLetterCapital,
            widget.productStores.product.type.name.firstLetterCapital),
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        isThreeLine: true,
        subtitle: Container(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Date : ${formattedDate(widget.productStores.product.harvestDate.toDate())}'),
              Text('Type : ${widget.productStores.product.growthType.name}')
            ],
          ),
        ),
        trailing: priceWidget(widget.productStores.price,
            widget.productStores.isVenderOnline, widget.productStores.status),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductDetails(widget.productStores, widget.ordersBloc),
            ),
          );
        },
      ),
    );
  }

  Column setTitle(String productName, String typeName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          productName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        Text(
          '($typeName)',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 5,
        ),
        stateWidget(widget.productStores.status),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  String formattedDate(DateTime dateTime) =>
      DateFormat.yMMMd().format(dateTime);

  bool checkAvailability(bool isOnline, StockAvailabilty status) {
    if (!isOnline) return false;

    return (status == StockAvailabilty.Not_Available ||
            status == StockAvailabilty.Sold_Out)
        ? false
        : true;
  }

  Container stateWidget(StockAvailabilty status) {
    Container widget;
    widget = Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: getStatusColor(status),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(5.0),
            topRight: const Radius.circular(5.0),
            bottomLeft: const Radius.circular(5.0),
            bottomRight: const Radius.circular(5.0),
          ),
        ),
        child: setStatusText(status));

    return widget;
  }

  Color getStatusColor(StockAvailabilty status) {
    switch (status) {
      case StockAvailabilty.Available:
        return Colors.green[300];
      case StockAvailabilty.Not_Available:
        return Colors.red[300];
      default:
        return Colors.grey;
    }
  }

  Text setStatusText(StockAvailabilty status) {
    switch (status) {
      case StockAvailabilty.Not_Available:
      case StockAvailabilty.Sold_Out:
        return Text(
          status.splitString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        );
      default:
        return Text(status.asString(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold));
    }
  }

  Container priceWidget(dynamic price, bool isOnline, StockAvailabilty status) {
    Container widget;
    widget = Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(5.0),
        child: Text(
          'Rs $price',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: priceColor(isOnline, status)),
          textAlign: TextAlign.center,
        ));

    return widget;
  }

  Color priceColor(bool isOnline, StockAvailabilty status) {
    return (checkAvailability(isOnline, status)) ? Colors.green : Colors.grey;
  }
}
