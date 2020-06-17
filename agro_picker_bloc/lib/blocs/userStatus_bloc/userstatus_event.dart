import 'package:equatable/equatable.dart';

abstract class UserStatusEvent extends Equatable {
  @override
  List<Object> get props => [];
  const UserStatusEvent();
}

class ChangeUserStatus extends UserStatusEvent {
  final bool isOnline;
  const ChangeUserStatus(this.isOnline);

  @override
  List<Object> get props => [isOnline];
}

class StartCheckProducerStatus extends UserStatusEvent {}

class GetProducerStatus extends UserStatusEvent {}
