import 'package:json_annotation/json_annotation.dart';

part 'storeStatus.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class StoreStatus {
  final int id;
  final String status;

  const StoreStatus(this.id, this.status);

  factory StoreStatus.fromJson(Map<String, dynamic> json) =>
      _$StoreStatusFromJson(json);

  Map<String, dynamic> toJson() => _$StoreStatusToJson(this);
}
