import 'package:agro_picker_bloc/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Orders {
  final String orderId;
  final String venderId;
  final String consumerId;
  final OrderStatus status;
  @JsonKey(
      name: 'orderDateTime', fromJson: _dtDataFromJson, toJson: _dtDataToJson)
  final Timestamp orderDateTime;

  const Orders(this.orderId, this.venderId, this.consumerId, this.status,
      this.orderDateTime);

  static Timestamp _dtDataFromJson(Timestamp jsonObj) {
    if (jsonObj != null) {
      return jsonObj;
    }

    return null;
  }

  static Timestamp _dtDataToJson(Timestamp instance) =>
      instance == null ? null : instance;

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}
