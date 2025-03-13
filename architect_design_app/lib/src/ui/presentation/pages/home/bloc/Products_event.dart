import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
// Events
abstract class ProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductsEvent {}