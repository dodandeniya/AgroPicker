import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetails extends StatefulWidget {
  final ProductStores productItem;
  final DashboardordersBloc ordersBloc;

  ProductDetails(this.productItem, this.ordersBloc);

  @override
  State<StatefulWidget> createState() {
    return _ProductDetails();
  }
}

class _ProductDetails extends State<ProductDetails> {
  final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton.getInstance();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int purchasedQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Item Details'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    widget.productItem.productImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.center,
              child: Text(
                'Rs ${widget.productItem.price} PER ${widget.productItem.product.mesureType.name}',
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              flex: 2,
              child: Card(
                child: Container(
                    child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topRight,
                                  child: Text('Item Name : '),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      '${widget.productItem.product.name.firstLetterCapital}'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topRight,
                                  child: Text('Description : '),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    alignment: Alignment.topLeft,
                                    child: getDiscription(
                                        widget.productItem.description)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topRight,
                                  child: Text('Vendor Name : '),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      widget.productItem.vender.venderName),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topRight,
                                  child: Text('Contact Number : '),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topLeft,
                                  child:
                                      Text(widget.productItem.vender.mobileNo),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topRight,
                                  child: Text('Available Quantity : '),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(widget
                                      .productItem.product.availableQuantity
                                      .toString()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topRight,
                                  child: Text('Harvest Date : '),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      '${formattedDate(widget.productItem.product.harvestDate.toDate())}'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topRight,
                                  child: Text('Growth Type : '),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      '${widget.productItem.product.growthType.name}'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: RaisedButton.icon(
                textTheme: ButtonTextTheme.primary,
                onPressed: () async {
                  var result = await showDialog(
                      context: context, child: purchaseDialog());

                  if (result) {
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.shopping_cart),
                label: Text('Buy Now'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text getDiscription(String discription) {
    return (discription.isNotEmpty)
        ? Text(discription, softWrap: true)
        : Text('-', softWrap: true);
  }

  String formattedDate(DateTime dateTime) =>
      DateFormat.yMMMd().format(dateTime);

  Widget purchaseDialog() {
    TextEditingController qty = TextEditingController();
    return SimpleDialog(
      title: Text('Purchase Order'),
      children: <Widget>[
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  controller: qty,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter a Quantity';
                    }

                    if (int.parse(value) >
                        widget.productItem.product.availableQuantity) {
                      return 'Quantity must be below or equal to available quantity';
                    }

                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    errorMaxLines: 20,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Purchase Quantity',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      this.purchasedQuantity = int.parse(qty.text.trim());
                      createOrder();
                      Navigator.pop(context, true);
                    }
                  },
                  child: Text(
                    'Order Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void createOrder() {
    var user = this.userStatusSingleton.user;
    var consumer = Consumer(user.userId, user.firstName, user.lastName);
    var productItem = widget.productItem.product;
    var product = Products(
        productItem.id,
        productItem.name.toLowerCase(),
        productItem.type,
        productItem.category,
        productItem.growthType,
        productItem.mesureType,
        productItem.harvestDate,
        productItem.totalQuantity,
        productItem.availableQuantity,
        this.purchasedQuantity,
        productItem.maxPurchaseLimit,
        productItem.maxRetailPrice,
        productItem.sellingPrice);

    Orders newOrder = Orders(widget.productItem.venderId, user.userId, product,
        OrderStatuses.New_Order, Timestamp.now(), consumer);

    widget.ordersBloc.add(CreateOrder(newOrder));
  }
}
