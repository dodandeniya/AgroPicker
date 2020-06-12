import 'package:agro_picker_bloc/models/models.dart';
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
  final String harvestDate;
  final String totalQuentity;
  final String availableQuentity;
  final String purchasedQuantity;
  final String maxPurchaseLimit;
  final String maxRetailPrice;
  final String sellingPrice;

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

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
