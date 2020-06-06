class UserStatusSingleton{
  static final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton._internal();
  static UserStatusSingleton getInstance() => userStatusSingleton;
  UserStatusSingleton._internal();
  String userEmail; // will replase with usermodel object

  void setUserStatus(String userID )  {
    userEmail = userID;
  }
}