import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:menu/src/products/infrastructure/datasources/get_products_datasource.dart';
import 'package:menu/src/products/domain/repositories/get_products_repository.dart';

class GetProductsRepositoryImpl implements GetProductsRepository {
  final GetProductsDatasource getProductsDatasource;

  const GetProductsRepositoryImpl(this.getProductsDatasource);

  @override
  Future<List<String>> call() {
    try {
      return getProductsDatasource();
    } catch (error, stack) {
      if (kDebugMode) {
        log('📛 Error', error: error, stackTrace: stack);
      }
      rethrow;
    }
  }
}
