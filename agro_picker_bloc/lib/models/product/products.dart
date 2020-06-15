import 'dart:ffi';

import 'package:agro_picker_bloc/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Products {
  final String id;
  final String name;
  final TypeModel type;
  final CategoryModel category;
  final GrowthTypeModel growthType;
  final MesureTypeModel mesureType;
  @JsonKey(
      name: 'harvestDate', fromJson: _dtDataFromJson, toJson: _dtDataToJson)
  final Timestamp harvestDate;
  @JsonKey(
      name: 'totalQuentity', fromJson: _doubleFromJson, toJson: _doubleToJson)
  final Double totalQuentity;
  @JsonKey(
      name: 'availableQuentity',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson)
  final Double availableQuentity;
  @JsonKey(
      name: 'purchasedQuantity',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson)
  final Double purchasedQuantity;
  @JsonKey(
      name: 'maxPurchaseLimit',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson)
  final Double maxPurchaseLimit;
  @JsonKey(
      name: 'maxRetailPrice', fromJson: _doubleFromJson, toJson: _doubleToJson)
  final Double maxRetailPrice;
  @JsonKey(
      name: 'sellingPrice', fromJson: _doubleFromJson, toJson: _doubleToJson)
  final Double sellingPrice;

  const Products(
      this.id,
      this.name,
      this.type,
      this.category,
      this.growthType,
      this.mesureType,
      this.harvestDate,
      this.totalQuentity,
      this.availableQuentity,
      this.purchasedQuantity,
      this.maxPurchaseLimit,
      this.maxRetailPrice,
      this.sellingPrice);

  static Timestamp _dtDataFromJson(Timestamp jsonObj) {
    if (jsonObj != null) {
      return jsonObj;
    }

    return null;
  }

  static Timestamp _dtDataToJson(Timestamp instance) =>
      instance == null ? null : instance;

  static Double _doubleFromJson(Double jsonObj) {
    if (jsonObj != null) {
      return jsonObj;
    }

    return null;
  }

  static Double _doubleToJson(Double instance) =>
      instance == null ? null : instance;

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
