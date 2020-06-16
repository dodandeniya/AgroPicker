import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  final String orderId;
  OrderDetails(this.orderId);

  @override
  State<StatefulWidget> createState() {
    return _OrderDetails();
  }
}

class _OrderDetails extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Center(
        child: Text(widget.orderId),
      ),
    ));
  }
}
