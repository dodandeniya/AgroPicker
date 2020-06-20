import 'dart:io';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/constants/constants.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class StocksCreationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StocksCreationScreen();
  }
}

class _StocksCreationScreen extends State<StocksCreationScreen> {
  List<Products> productsList = [];
  List<CategoryModel> categoryList = [];
  List<GrowthTypeModel> growthTypeList = [];
  List<MesureTypeModel> mesureTypeList = [];

  String selectedProductName;
  CategoryModel selectedCategory;
  GrowthTypeModel selectedGrowthType;
  MesureTypeModel selectedMesureType;
  TextEditingController availableQuantityController;
  TextEditingController harvestDateController;
  TextEditingController maxRetailPriceController;
  TextEditingController sellingPriceController;
  TextEditingController descriptionController;
  DateTime selectedDate;
  File stockImage;
  Products products;

  bool isLoading = false;
  String message = 'Loading Product Details';

  ProductsBloc productsBloc;
  DashboardproductstockBloc dashboardproductstockBloc;
  FileuploadBloc fileuploadBloc;

  final picker = ImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton.getInstance();

  @override
  void initState() {
    super.initState();
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    dashboardproductstockBloc =
        BlocProvider.of<DashboardproductstockBloc>(context);
    fileuploadBloc = BlocProvider.of<FileuploadBloc>(context);
    productsBloc.add(StartGettingProduct());
    growthTypeList.addAll(growthTypesList);
    mesureTypeList.addAll(mesureTypList);
    availableQuantityController = TextEditingController();
    harvestDateController = TextEditingController();
    maxRetailPriceController = TextEditingController();
    sellingPriceController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductsBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductLoaded) {
              productsList.clear();
              setState(
                () {
                  isLoading = false;
                  productsList.addAll(state.products);
                  categoryList.addAll(state.products.map((e) => e.category));
                },
              );
            }
            if (state is ProductLoading) {
              setState(
                () {
                  isLoading = true;
                  message = 'Loading Product Details';
                },
              );
            }
          },
        ),
        BlocListener<DashboardproductstockBloc, DashboardproductstockState>(
          listener: (context, state) {
            if (state is StockItemCreated) {
              setState(() {
                isLoading = false;
              });
              clearAll();
            }
            if (state is DashboardStockLoading) {
              setState(() {
                message = 'Stock is getting inserted';
              });
            }
          },
        ),
        BlocListener<FileuploadBloc, FileuploadState>(
          listener: (context, state) {
            if (state is FileuploadCompleted) {
              insertStockData(state.downloadableUrl);
            }
            if (state is Fileuploading) {
              setState(() {
                isLoading = true;
                message = 'File is getting uploaded';
              });
            }
          },
        ),
      ],
      child: getWidget(),
    );
  }

  Widget getWidget() {
    if (isLoading) {
      return SplashScreen(message);
    }
    return Container(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please Select Product Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Product Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                  iconSize: 24,
                  elevation: 24,
                  onChanged: (String newValue) {
                    FocusScope.of(context).nextFocus();
                    products = productsList
                        .firstWhere((element) => element.id == newValue);
                    setState(
                      () {
                        selectedCategory = products.category;
                        selectedGrowthType = products.growthType;
                        selectedMesureType = products.mesureType;
                        maxRetailPriceController.text =
                            products.maxRetailPrice.toString();
                      },
                    );
                  },
                  value: selectedProductName,
                  items: productsList
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                          value: e.id,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: IgnorePointer(
                  ignoring: true,
                  child: DropdownButtonFormField<CategoryModel>(
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
                    onChanged: (CategoryModel newValue) {
                      FocusScope.of(context).nextFocus();
                    },
                    value: selectedCategory,
                    items: categoryList
                        .map<DropdownMenuItem<CategoryModel>>(
                          (e) => DropdownMenuItem<CategoryModel>(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   child: DropdownButtonFormField<String>(
              //     validator: (value) {
              //       if (value == null) {
              //         return 'Please Select Sub Category';
              //       }
              //       return null;
              //     },
              //     decoration: InputDecoration(
              //       floatingLabelBehavior: FloatingLabelBehavior.auto,
              //       labelText: 'Sub Category',
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.white)),
              //       contentPadding: EdgeInsets.only(
              //           top: 0, bottom: 10, left: 10, right: 10),
              //     ),
              //     isExpanded: true,
              //     iconSize: 24,
              //     elevation: 24,
              //     onChanged: (String newValue) {
              //       FocusScope.of(context).nextFocus();
              //     },
              //     value: selectedProductCategory,
              //     items: productCategory
              //         .map<DropdownMenuItem<String>>(
              //           (e) => DropdownMenuItem<String>(
              //             value: e,
              //             child: Text(e),
              //           ),
              //         )
              //         .toList(),
              //   ),
              // ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<GrowthTypeModel>(
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
                  onChanged: (GrowthTypeModel newValue) {
                    setState(() {
                      selectedGrowthType = newValue;
                    });
                  },
                  value: selectedGrowthType,
                  items: growthTypeList
                      .map<DropdownMenuItem<GrowthTypeModel>>(
                        (e) => DropdownMenuItem<GrowthTypeModel>(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<MesureTypeModel>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please Select Measure Type';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Measure Type',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                  isExpanded: true,
                  iconSize: 24,
                  elevation: 24,
                  onChanged: (MesureTypeModel newValue) {
                    setState(() {
                      selectedMesureType = newValue;
                    });
                  },
                  value: selectedMesureType,
                  items: mesureTypeList
                      .map<DropdownMenuItem<MesureTypeModel>>(
                        (e) => DropdownMenuItem<MesureTypeModel>(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Available Quantity';
                    }
                    return null;
                  },
                  controller: availableQuantityController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a Harvest Date';
                          }
                          return null;
                        },
                        controller: harvestDateController,
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
                  controller: maxRetailPriceController,
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a Selling Price';
                    }
                    if (value != null || value.isNotEmpty) {
                      if (double.parse(value) >
                          double.parse(maxRetailPriceController.text)) {
                        return 'Selling Price should be less than Max Retail Price';
                      }
                    }
                    return null;
                  },
                  controller: sellingPriceController,
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
                  controller: descriptionController,
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
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: stockImage == null
                            ? CircleAvatar(
                                backgroundColor: Theme.of(context).accentColor,
                                child: Icon(
                                  Icons.photo,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Theme.of(context).accentColor,
                                backgroundImage: FileImage(stockImage),
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: IconButton(
                            tooltip: 'Add Stock Image',
                            icon: Icon(Icons.add_a_photo),
                            onPressed: getImage),
                      )
                    ],
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: RaisedButton(
                  textTheme: ButtonTextTheme.primary,
                  onPressed: addProductStocks,
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
    setState(
      () {
        selectedDate = selectedDateTime;
        harvestDateController.text =
            DateFormat().add_yMMMMd().format(selectedDateTime).toString();
      },
    );
  }

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(
        () {
          stockImage = File(pickedFile.path);
        },
      );
    }
  }

  void addProductStocks() {
    if (formKey.currentState.validate()) {
      if (stockImage == null) {
        Scaffold.of(context)
          ..showSnackBar(
            SnackBar(
              content: Text('Please upload a Stock Image'),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );
      } else {
        uploadPhoto();
      }
    }
  }

  void uploadPhoto() {
    fileuploadBloc
        .add(StartFileUploading(stockImage, FileUploadType.StockPhoto));
  }

  void insertStockData(String filePath) {
    var user = userStatusSingleton.user;
    var price = double.parse(sellingPriceController.text);
    var harvestDate = Timestamp.fromDate(selectedDate);
    var availableQuantity = int.parse(availableQuantityController.text);
    var description = descriptionController.text;
    var totalQuantity =
        products.totalQuantity + availableQuantity - products.purchasedQuantity;
    var vendor = VenderModel(
        user.userId, '${user.firstName} ${user.lastName}', user.mobileNumber);
    var product = Products(
        products.id,
        products.name,
        products.type,
        selectedCategory,
        selectedGrowthType,
        selectedMesureType,
        harvestDate,
        totalQuantity,
        availableQuantity,
        products.purchasedQuantity,
        products.maxPurchaseLimit,
        products.maxRetailPrice,
        price);
    ProductStores productStores = ProductStores(user.userId, vendor,
        user.isOnline, product, price, StockAvailabilty.Available,
        productImage: filePath, description: description);
    dashboardproductstockBloc.add(CreateStockItem(productStores));
  }

  void clearAll() {
    selectedProductName = null;
    selectedCategory = null;
    selectedGrowthType = null;
    selectedMesureType = null;
    availableQuantityController.clear();
    harvestDateController.clear();
    maxRetailPriceController.clear();
    sellingPriceController.clear();
    descriptionController.clear();
    selectedDate = null;
    stockImage = null;
    products = null;
  }
}
