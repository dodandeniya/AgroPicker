import 'package:agro_picker_bloc/models/models.dart';

const List<TypeModel> typeList = [
  TypeModel(1, "Vegetable"),
  TypeModel(2, "Fruit")
];

const List<MesureTypeModel> mesureTypList = [
  MesureTypeModel(1, "kg"),
  MesureTypeModel(2, "g"),
  MesureTypeModel(3, "ml"),
  MesureTypeModel(4, "l")
];

const List<GrowthTypeModel> growthTypesList = [
  GrowthTypeModel(1, "Organic"),
  GrowthTypeModel(2, "Non Organic")
];

const List<StoreStatus> storeStatusList = [
  StoreStatus(1, "Available"),
  StoreStatus(2, "Sold Out"),
  StoreStatus(3, "Not Available")
];

const List<OrderStatus> orderStatusList = [
  OrderStatus(1, "New Order"),
  OrderStatus(2, "Confirmed"),
  OrderStatus(3, "Preparing"),
  OrderStatus(4, "Packaging"),
  OrderStatus(5, "Collecting"),
  OrderStatus(6, "On Route"),
  OrderStatus(7, "Payment"),
  OrderStatus(8, "Completed")
];
