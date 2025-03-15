import 'package:equatable/equatable.dart';

import '../../../../data/export_datasource.dart';

// States
abstract class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ArchitectModel> products;
  ProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);

  @override
  List<Object?> get props => [message];
}