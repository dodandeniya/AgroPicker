import 'package:agro_picker_bloc/enums/enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agroProfile.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AgroProfile {
  final ProfileType profileType;
  final String regNumber;
  final List<String> album;
  final List<String> attachments;
  String businessRegistrationDoc;

  AgroProfile(
      {this.profileType,
      this.regNumber,
      this.album,
      this.attachments,
      this.businessRegistrationDoc});
  factory AgroProfile.fromJson(Map<String, dynamic> json) =>
      _$AgroProfileFromJson(json);

  Map<String, dynamic> toJson() => _$AgroProfileToJson(this);
}
