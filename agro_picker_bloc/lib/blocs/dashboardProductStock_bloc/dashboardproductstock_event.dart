import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardproductstockEvent extends Equatable {
  const DashboardproductstockEvent();
  @override
  List<Object> get props => [];
}

class StartStockBoardUpdateEvent extends DashboardproductstockEvent {}

class StockBoardUpdateListner extends DashboardproductstockEvent {
  final List<DocumentSnapshot> docs;
  const StockBoardUpdateListner(this.docs);

  @override
  List<Object> get props => [docs];
}

class StartStockSearchEvent extends DashboardproductstockEvent {
  final String searchKey;

  const StartStockSearchEvent(this.searchKey);

  @override
  List<Object> get props => [searchKey];
}

class StockSearchListner extends DashboardproductstockEvent {
  final List<DocumentSnapshot> docs;
  const StockSearchListner(this.docs);

  @override
  List<Object> get props => [docs];
}

class CreateStockItem extends DashboardproductstockEvent {
  final ProductStores stockItem;
  const CreateStockItem(this.stockItem);

  @override
  List<Object> get props => [stockItem];
}

class UpdateStockItem extends DashboardproductstockEvent {
  final Map<dynamic, dynamic> updateItem;
  final String stockId;
  const UpdateStockItem(this.updateItem, this.stockId);

  @override
  List<Object> get props => [updateItem, stockId];
}

class DeleteStockItem extends DashboardproductstockEvent {
  final String stockId;
  const DeleteStockItem(this.stockId);

  @override
  List<Object> get props => [stockId];
}
