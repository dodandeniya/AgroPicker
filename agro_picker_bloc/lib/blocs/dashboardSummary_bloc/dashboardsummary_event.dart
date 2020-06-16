import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardsummaryEvent extends Equatable {
  const DashboardsummaryEvent();
  @override
  List<Object> get props => [];
}

class StartSummryBoardUpdateEvent extends DashboardsummaryEvent {}

class StartListner extends DashboardsummaryEvent {
  final List<DocumentSnapshot> docs;
  const StartListner(this.docs);

  @override
  List<Object> get props => [docs];
}
