import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardUpdateEmpty extends DashboardState {}

class UpdateDashboardLoading extends DashboardState {}

class UpdateDashboard extends DashboardState {
  final Users user;
  const UpdateDashboard(this.user);

  @override
  List<Object> get props => [user];
}
