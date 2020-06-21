import 'package:equatable/equatable.dart';

abstract class DashboardsummaryState extends Equatable {
  const DashboardsummaryState();

  @override
  List<Object> get props => [];
}

class DashboardsummaryInitial extends DashboardsummaryState {}

class UpdateSummaryScreen extends DashboardsummaryState {}

class UpdateNewOrdersCount extends DashboardsummaryState {
  final int count;

  const UpdateNewOrdersCount(this.count);
  @override
  List<Object> get props => [count];
}

class UpdateIncomeCount extends DashboardsummaryState {}

class UpdatePendingCount extends DashboardsummaryState {
  final int count;

  const UpdatePendingCount(this.count);
  @override
  List<Object> get props => [count];
}

class UpdateCompletedCount extends DashboardsummaryState {
  final int count;

  const UpdateCompletedCount(this.count);
  @override
  List<Object> get props => [count];
}
