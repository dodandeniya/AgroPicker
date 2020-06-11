import 'package:agro_picker_bloc/agri_picker_blocs.dart';

class UserStatusSingleton {
  static final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton._internal();
  static UserStatusSingleton getInstance() => userStatusSingleton;
  UserStatusSingleton._internal();
  Users user;

  void setUserStatus(Users user) {
    this.user = user;
  }
}
