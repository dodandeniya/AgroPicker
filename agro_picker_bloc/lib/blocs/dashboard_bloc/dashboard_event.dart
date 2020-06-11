import 'package:agro_picker_bloc/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class StartUpdateDashboard extends DashboardEvent {}

class UpdateDashboardEvent extends DashboardEvent {
  final UserModel user;
  const UpdateDashboardEvent(this.user);

  @override
  List<Object> get props => [user];
}
