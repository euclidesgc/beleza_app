import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:menu/src/products/infrastructure/datasources/get_products_datasource.dart';

class GetProductsDatasourceImpl implements GetProductsDatasource {
  @override
  Future<List<String>> call() {
    try {
      return Future.value([
        'Produto 01',
        'Produto 02',
        'Produto 03',
      ]);
    } catch (error, stack) {
      if (kDebugMode) {
        log('📛 Error', error: error, stackTrace: stack);
      }
      rethrow;
    }
  }
}
