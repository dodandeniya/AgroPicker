import 'package:equatable/equatable.dart';

abstract class AgroprofileState extends Equatable {
  const AgroprofileState();

  @override
  List<Object> get props => [];
}

class AgroprofileInitial extends AgroprofileState {}

class Pending extends AgroprofileState {}

class Approved extends AgroprofileState {}

class Rejected extends AgroprofileState {}
