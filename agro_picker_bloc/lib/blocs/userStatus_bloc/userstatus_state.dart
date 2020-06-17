import 'package:equatable/equatable.dart';

abstract class UserStatusState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserStatusInitial extends UserStatusState {}

class UserStatusOnline extends UserStatusState {}

class UserStatusOffline extends UserStatusState {}

class ProducerStatusOffline extends UserStatusState {}

class ProducerStatusOnline extends UserStatusState {}

class UserStatusError extends UserStatusState {}

class ProducerStatusError extends UserStatusState {}
