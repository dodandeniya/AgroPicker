import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'mesureTypeModel.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class MesureTypeModel extends Equatable {
  final int id;
  final String name;

  const MesureTypeModel(this.id, this.name);

  factory MesureTypeModel.fromJson(Map<String, dynamic> json) =>
      _$MesureTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$MesureTypeModelToJson(this);

  @override
  String toString() {
    return 'mesureType';
  }

  @override
  List<Object> get props => [id, name];
}
