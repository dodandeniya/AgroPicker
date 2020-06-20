import 'package:agro_picker_bloc/enums/enum.dart';
import 'package:agro_picker_bloc/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'orders.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Orders {
  String orderId;
  final String venderId;
  final String consumerId;
  final Products orderItem;
  final OrderStatuses status;
  final Consumer consumer;
  @JsonKey(
      name: 'orderDateTime', fromJson: _dtDataFromJson, toJson: _dtDataToJson)
  final Timestamp orderDateTime;

  Orders(this.venderId, this.consumerId, this.orderItem, this.status,
      this.orderDateTime, this.consumer) {
    this.orderId = Uuid().v1();
  }

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
