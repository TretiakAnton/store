import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/models/product.dart';
import 'package:store/networking/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());
  final StoreRepository _repository = StoreRepository();
  List<Product>? _products;

  List<Product>? get products => _products;
//TODO add favourites feature
  Future<void> getProducts() async {
    emit(StoreInProgress());
    final List<Product> result = await _repository.getProducts();
    if (result.isEmpty) {
      emit(StoreFailed());
    } else {
      _products = result;
      emit(StoreCompleted());
    }
  }
}
