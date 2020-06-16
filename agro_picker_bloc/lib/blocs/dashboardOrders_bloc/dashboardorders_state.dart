import 'package:agro_picker_bloc/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardordersState extends Equatable {
  const DashboardordersState();

  @override
  List<Object> get props => [];
}

class DashboardordersInitial extends DashboardordersState {}

class DashboardLoading extends DashboardordersState {}

class UpdateDashboardOrdersScren extends DashboardordersState {}

class UpdateOrdersList extends DashboardordersState {
  final List<Orders> orderList;

  const UpdateOrdersList(this.orderList);

  @override
  List<Object> get props => [orderList];
}

class EmptyOrderList extends DashboardordersState {}

class OrderCreated extends DashboardordersState {}

class OrderCreationFailed extends DashboardordersState {}
