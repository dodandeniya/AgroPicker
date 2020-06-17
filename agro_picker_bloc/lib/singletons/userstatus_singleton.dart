import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';

class UserStatusSingleton {
  static final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton._internal();
  static UserStatusSingleton getInstance() => userStatusSingleton;
  UserStatusSingleton._internal();
  Users user;
  Image image;

  void setUserStatus(Users user) {
    this.user = user;
    image = Image.network(user.profileImage);
  }
}
