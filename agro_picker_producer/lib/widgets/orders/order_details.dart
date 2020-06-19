import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  final Orders order;
  OrderDetails(this.order);

  @override
  State<StatefulWidget> createState() {
    return _OrderDetails();
  }
}

class _OrderDetails extends State<OrderDetails> {
  List<bool> expansion = [false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextFormField(
                      initialValue: widget.order.orderId,
                      enabled: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorMaxLines: 20,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Order Id',
                        hintStyle: Theme.of(context).textTheme.caption,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 15),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextFormField(
                      initialValue:
                          widget.order.orderDateTime.toDate().toString(),
                      enabled: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorMaxLines: 20,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Order Date Time',
                        hintStyle: Theme.of(context).textTheme.caption,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 15),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextFormField(
                      initialValue: widget.order.status.splitString(),
                      enabled: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorMaxLines: 20,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Order Status',
                        hintStyle: Theme.of(context).textTheme.caption,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 15),
                      ),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            expansion.setAll(0, [false, false]);
                            expansion[index] = !isExpanded;
                          });
                        },
                        children: [
                          ExpansionPanel(
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text('Consumer Information'),
                                );
                              },
                              body: ListTile(
                                  title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        'Full Name - ${widget.order.consumer.consumerFirstName} ${widget.order.consumer.consumerLastName}'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        'Consumer Id - ${widget.order.consumer.consumerId}'),
                                  )
                                ],
                              )),
                              isExpanded: expansion[0]),
                          ExpansionPanel(
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text('Product Information'),
                                );
                              },
                              body: ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          'Product Name - ${widget.order.orderItem.name}'),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          'Purchasing Quantity - ${widget.order.orderItem.purchasedQuantity}'),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          'Available Quantity - ${widget.order.orderItem.availableQuantity}'),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          'Selling Price - ${widget.order.orderItem.sellingPrice}'),
                                    )
                                  ],
                                ),
                              ),
                              isExpanded: expansion[1])
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
