part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileCreationLoading extends ProfileState {}

class ProfileCreationLoaded extends ProfileState {}

class ProfileCreationError extends ProfileState {}
