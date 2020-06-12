import 'package:agro_picker_bloc/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categoryModel.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CategoryModel {
  final String id;
  final TypeModel type;
  final String name;
  final String description;

  const CategoryModel(this.id, this.type, this.name, this.description);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
