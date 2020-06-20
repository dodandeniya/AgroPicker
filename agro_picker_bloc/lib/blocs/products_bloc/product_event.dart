import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class StartGettingProduct extends ProductEvent {}

class GetAllProducts extends ProductEvent {
  final List<DocumentSnapshot> docs;
  const GetAllProducts(this.docs);

  @override
  List<Object> get props => [docs];
}
