import 'package:agro_picker_bloc/enums/enum.dart';
import 'package:agro_picker_bloc/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Users {
  String userId;
  final int role;
  final String userName;
  final String firstName;
  final String lastName;
  final String initials;
  final String displayName;
  final Gender gender;
  String email;
  final String nic;
  final AddressDetails addressDetails;
  @JsonKey(name: 'location', fromJson: _geoDataFromJson, toJson: _geoDataToJson)
  final GeoPoint location;
  final String mobileNumber;
  final String profileImage;
  final AgroProfile agroProfile;
  final BankDetails bankDetails;
  @JsonKey(name: 'dateTime', fromJson: _dtDataFromJson, toJson: _dtDataToJson)
  final Timestamp dateTime;
  final bool isProfileCompleted;
  final bool isOnline;

  Users(
      {this.userId,
      this.role,
      this.userName,
      this.firstName,
      this.lastName,
      this.displayName,
      this.gender,
      this.mobileNumber,
      this.addressDetails,
      this.email,
      this.initials,
      this.location,
      this.profileImage,
      this.agroProfile,
      this.bankDetails,
      this.nic,
      this.dateTime,
      this.isOnline,
      this.isProfileCompleted});

  static GeoPoint _geoDataFromJson(GeoPoint jsonObj) {
    if (jsonObj != null) {
      return jsonObj;
    }

    return null;
  }

  static GeoPoint _geoDataToJson(GeoPoint instance) =>
      instance == null ? null : instance;

  static Timestamp _dtDataFromJson(Timestamp jsonObj) {
    if (jsonObj != null) {
      return jsonObj;
    }

    return null;
  }

  static Timestamp _dtDataToJson(Timestamp instance) =>
      instance == null ? null : instance;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
