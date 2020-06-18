import 'package:json_annotation/json_annotation.dart';

part 'venderModel.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class VenderModel {
  final String venderId;
  final String venderName;
  final String mobileNo;

  const VenderModel(this.venderId, this.venderName, this.mobileNo);

  factory VenderModel.fromJson(Map<String, dynamic> json) =>
      _$VenderModelFromJson(json);

  Map<String, dynamic> toJson() => _$VenderModelToJson(this);
}
