import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../data/export_datasource.dart';
import 'Products_event.dart';
import 'Products_state.dart';

// Bloc Class
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoading()) {
    on<LoadProducts>(_loadProducts);
  }

  Future<void> _loadProducts(LoadProducts event, Emitter<ProductsState> emit) async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('products').get();
      var products = snapshot.docs
          .map((doc) => ArchitectModel.fromMap(doc.data()))
          .toList();

      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError("Failed to load products"));
    }
  }
}