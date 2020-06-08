//for build : 'flutter pub run build_runner build'

import 'package:agro_picker_bloc/models/user/userLocation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  String userId;
  String userName;
  String firstName;
  String lastName;
  String displayName;
  String address;
  UserLocation location;
  String email;
  String nic;
  int role;

  UserModel(this.userId, this.userName, this.firstName, this.lastName, this.displayName, 
    this.email, this.role, { this.address, this.location, this.nic});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}