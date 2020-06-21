import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    OrderStatuses.Confirmed.splitString(),
    OrderStatuses.Preparing.splitString(),
    OrderStatuses.Packaging.splitString(),
    OrderStatuses.Collection.splitString(),
    OrderStatuses.On_Route.splitString(),
    OrderStatuses.Payment.splitString(),
    OrderStatuses.Completed.splitString()
  ];
  DashboardordersBloc dashboardordersBloc;

  @override
  void initState() {
    super.initState();
    dashboardordersBloc = BlocProvider.of<DashboardordersBloc>(context);
  }

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
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Ordered Time : ${formattedDate(widget.order.orderDateTime.toDate())}'),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: DropdownButton(
                value: widget.order.status.splitString(),
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
                  var selectedValue = OrderStatuses.values
                      .firstWhere((element) => element.splitString() == value);

                  var updatedValue = {'status': selectedValue.asString()};
                  dashboardordersBloc
                      .add(UpdateOrder(updatedValue, widget.order.orderId));
                },
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetails(widget.order),
            ),
          );
        },
      ),
    );
  }

  String formattedDate(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().add_jms().format(dateTime);
}
