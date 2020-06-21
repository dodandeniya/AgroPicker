import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderTemplate extends StatefulWidget {
  final Orders order;

  OrderTemplate(
    this.order,
  );

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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        enabled: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Order ID : '),
            Text('${widget.order.orderId}'),
            SizedBox(
              height: 15,
            ),
            Text(
                'Ordered Item : ${widget.order.orderItem.name.firstLetterCapital}'),
            SizedBox(
              height: 15,
            )
          ],
        ),
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Ordered Time'),
                SizedBox(
                  height: 15,
                ),
                Text('Order Status')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(' : '),
                SizedBox(
                  height: 15,
                ),
                Text(' : ')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${formattedDate(widget.order.orderDateTime.toDate())}',
                ),
                SizedBox(
                  height: 15,
                ),
                checkState(widget.order.status),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formattedDate(DateTime dateTime) =>
      DateFormat.yMd().add_jms().format(dateTime);

  Text checkState(OrderStatuses status) {
    Text text;

    if ((status == OrderStatuses.New_Order) ||
        (status == OrderStatuses.On_Route)) {
      if (status == OrderStatuses.New_Order) {
        text = Text(status.splitString(),
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.lime));
      } else {
        text = Text(status.splitString(),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent));
      }
    } else {
      text = Text(status.asString(),
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent));
    }

    return text;
  }
}
