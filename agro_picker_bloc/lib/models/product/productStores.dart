import 'package:agro_picker_bloc/enums/enum.dart';
import 'package:agro_picker_bloc/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'productStores.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductStores {
  String storeId;
  final String venderId;
  final bool isVenderOnline;
  final Products product;
  final dynamic price;
  StockAvailabilty status;
  final String productImage;

  ProductStores(
      this.venderId, this.isVenderOnline, this.product, this.price, this.status,
      {this.productImage}) {
    this.storeId = Uuid().v1();
  }

  factory ProductStores.fromJson(Map<String, dynamic> json) =>
      _$ProductStoresFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStoresToJson(this);
}
