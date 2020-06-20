import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductEmpty extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Products> products;
  const ProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductListEmpty extends ProductState {}

class ProductError extends ProductState {}
