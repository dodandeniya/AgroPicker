import 'package:agro_picker_bloc/enums/enum.dart';
import 'package:agro_picker_bloc/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AgroprofileEvent extends Equatable {
  const AgroprofileEvent();
  @override
  List<Object> get props => [];
}

class CheckProfileState extends AgroprofileEvent {}

class ResetPrefileState extends AgroprofileEvent {}
