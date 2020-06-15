import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';

class OrderTemplate extends StatefulWidget {
  final String orderId;
  final String time;

  OrderTemplate(this.orderId, this.time);

  @override
  State<StatefulWidget> createState() {
    return _OrderTemplate();
  }
}

class _OrderTemplate extends State<OrderTemplate> {
  final List<String> orderStatuses = [
    OrderStatuses.New_Order.splitString(),
    OrderStatuses.Confirmed.asString(),
    OrderStatuses.Preparing.asString(),
    OrderStatuses.Packaging.asString(),
    OrderStatuses.Collection.asString(),
    OrderStatuses.On_Route.splitString(),
    OrderStatuses.Payment.asString(),
    OrderStatuses.Completed.asString()
  ];
  String selectedStatus = OrderStatuses.New_Order.splitString();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        enabled: true,
        title: Text('Order ID : ${widget.orderId}'),
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        isThreeLine: true,
        subtitle: Text('Time : ${widget.time}'),
        trailing: DropdownButton(
          value: selectedStatus,
          underline: Container(),
          items: orderStatuses
              .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedStatus = value;
            });
            print(value);
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetails(widget.orderId),
            ),
          );
        },
      ),
    );
  }
}
