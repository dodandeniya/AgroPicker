part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class InsertProfile extends ProfileEvent {
  final Users user;

  const InsertProfile({this.user});

  @override
  List<Object> get props => [user];
}

class GetProfile extends ProfileEvent {
  final String userId;

  const GetProfile({this.userId});

  @override
  List<Object> get props => [userId];
}
