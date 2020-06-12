import 'package:json_annotation/json_annotation.dart';

part 'growthTypeModel.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class GrowthTypeModel {
  final int id;
  final String name;

  const GrowthTypeModel(this.id, this.name);

  factory GrowthTypeModel.fromJson(Map<String, dynamic> json) =>
      _$GrowthTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$GrowthTypeModelToJson(this);
}
