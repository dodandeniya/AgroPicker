import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardproductstockState extends Equatable {
  const DashboardproductstockState();

  @override
  List<Object> get props => [];
}

class DashboardproductstockInitial extends DashboardproductstockState {}

class DashboardStockLoading extends DashboardproductstockState {}

class UpdateDashboardStockScren extends DashboardproductstockState {}

class UpdateStocksList extends DashboardproductstockState {
  final List<ProductStores> orderList;

  const UpdateStocksList(this.orderList);

  @override
  List<Object> get props => [orderList];
}

class EmptyStockList extends DashboardproductstockState {}

class StockItemCreated extends DashboardproductstockState {}

class StockItemCreationFailed extends DashboardproductstockState {}

class StockItemSucessfullyUpdated extends DashboardproductstockState {}

class StockItemUpdataionFailed extends DashboardproductstockState {}

class StockItemDeleted extends DashboardproductstockState {}

class StockItemDeletionFailed extends DashboardproductstockState {}
