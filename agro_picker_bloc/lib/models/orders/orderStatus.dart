import 'package:json_annotation/json_annotation.dart';

part 'orderStatus.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class OrderStatus {
  final int id;
  final String status;

  const OrderStatus(this.id, this.status);

  factory OrderStatus.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatusToJson(this);
}
