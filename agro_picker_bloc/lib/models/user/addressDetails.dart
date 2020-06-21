import 'package:json_annotation/json_annotation.dart';

part 'addressDetails.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AddressDetails {
  final String address;
  final String city;
  final String district;
  final String province;
  final String postalCode;

  const AddressDetails(
      this.address, this.city, this.district, this.province, this.postalCode);

  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDetailsToJson(this);
}
