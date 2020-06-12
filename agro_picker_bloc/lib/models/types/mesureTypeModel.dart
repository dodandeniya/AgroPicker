import 'package:json_annotation/json_annotation.dart';

part 'mesureTypeModel.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class MesureTypeModel {
  final int id;
  final String name;

  const MesureTypeModel(this.id, this.name);

  factory MesureTypeModel.fromJson(Map<String, dynamic> json) =>
      _$MesureTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$MesureTypeModelToJson(this);
}
