import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StocksCreationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StocksCreationScreen();
  }
}

class _StocksCreationScreen extends State<StocksCreationScreen> {
  List<String> productCategory = ['C1'];
  String selectedProductCategory;
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    errorMaxLines: 20,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Product Name',
                    hintStyle: Theme.of(context).textTheme.caption,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 15),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please Select Product Category';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Product Category',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                  isExpanded: true,
                  iconSize: 24,
                  elevation: 24,
                  onChanged: (String newValue) {
                    FocusScope.of(context).nextFocus();
                  },
                  value: selectedProductCategory,
                  items: productCategory
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please Select Sub Category';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Sub Category',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                  isExpanded: true,
                  iconSize: 24,
                  elevation: 24,
                  onChanged: (String newValue) {
                    FocusScope.of(context).nextFocus();
                  },
                  value: selectedProductCategory,
                  items: productCategory
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please Select Growth Type';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Growth Type',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                  isExpanded: true,
                  iconSize: 24,
                  elevation: 24,
                  onChanged: (String newValue) {
                    FocusScope.of(context).nextFocus();
                  },
                  value: selectedProductCategory,
                  items: productCategory
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorMaxLines: 20,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Available Quantity',
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          errorMaxLines: 20,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'Harvest Date',
                          hintStyle: Theme.of(context).textTheme.caption,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 10, left: 10, right: 15),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 0,
                        child: IconButton(
                            tooltip: 'Select Harvest Date',
                            color: Theme.of(context).primaryColor,
                            icon: Icon(Icons.calendar_today),
                            onPressed: selectDate))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    errorMaxLines: 20,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Max Retail Price',
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
                  decoration: InputDecoration(
                    errorMaxLines: 20,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Selling Price',
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
                  maxLines: 5,
                  decoration: InputDecoration(
                    errorMaxLines: 20,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Description',
                    hintStyle: Theme.of(context).textTheme.caption,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 20, bottom: 0, left: 10, right: 15),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: RaisedButton(
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectDate() async {
    var selectedDateTime = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.input,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());

    if (selectedDateTime == null) {
      return;
    }
    setState(() {
      selectedDate = selectedDateTime;
    });
    print(selectedDate);
  }
}
