import 'package:json_annotation/json_annotation.dart';

part 'userLocation.g.dart';

@JsonSerializable()
class UserLocation{
  double lat;
  double lon;

  UserLocation(this.lat,this.lon);
  
  factory UserLocation.fromJson(Map<String, dynamic> json) => _$UserLocationFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationToJson(this);
}