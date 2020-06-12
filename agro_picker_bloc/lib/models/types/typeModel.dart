import 'package:json_annotation/json_annotation.dart';

part 'typeModel.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class TypeModel {
  final int id;
  final String name;

  const TypeModel(this.id, this.name);

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);
}
