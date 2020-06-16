import 'package:agro_picker_bloc/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardordersEvent extends Equatable {
  const DashboardordersEvent();

  @override
  List<Object> get props => [];
}

class StartOrderBoardUpdateEvent extends DashboardordersEvent {}

class OrderBoardUpdateListner extends DashboardordersEvent {
  final List<DocumentSnapshot> docs;
  const OrderBoardUpdateListner(this.docs);

  @override
  List<Object> get props => [docs];
}

class StartOrderSearchEvent extends DashboardordersEvent {
  final String searchKey;

  const StartOrderSearchEvent(this.searchKey);

  @override
  List<Object> get props => [searchKey];
}

class OrderSearchListner extends DashboardordersEvent {
  final List<DocumentSnapshot> docs;
  const OrderSearchListner(this.docs);

  @override
  List<Object> get props => [docs];
}

class CreateOrder extends DashboardordersEvent {
  final Orders order;
  const CreateOrder(this.order);

  @override
  List<Object> get props => [order];
}
