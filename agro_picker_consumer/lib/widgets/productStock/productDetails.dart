import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductDetails();
  }
}

class _ProductDetails extends State<ProductDetails> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Stock Details'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/carrot-on-white-vert.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.center,
              child: Text(
                'LKR 150 PER KG',
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
                                  child: Text('Carrot'),
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
                                  child: Text(
                                    'Dont buy from us. Our Products are not good. They are not edible. If you buy you will get poisoned.',
                                    softWrap: true,
                                  ),
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
                                  child: Text('Gowtham'),
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
                                  child: Text('0777123456'),
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
                                  child: Text('5 Kg'),
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
                                  child: Text('15/05/2020'),
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
                                  child: Text('Organic'),
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
                  await showDialog(context: context, child: purchaseDialog());
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

  Widget purchaseDialog() {
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
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter a Quantity';
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
                    if (formKey.currentState.validate()) {}
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
}
