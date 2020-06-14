import 'package:agro_picker_bloc/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'productStores.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductStores {
  final String storeId;
  final String venderId;
  final bool isVenderOnline;
  final Products product;
  final String price;
  final StoreStatus status;

  const ProductStores(this.storeId, this.venderId, this.isVenderOnline,
      this.product, this.price, this.status);

  factory ProductStores.fromJson(Map<String, dynamic> json) =>
      _$ProductStoresFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStoresToJson(this);
}
