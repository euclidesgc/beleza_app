import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:menu/src/products/domain/repositories/get_products_repository.dart';

class GetProductsUsecase {
  final GetProductsRepository getProductsRepository;

  GetProductsUsecase(this.getProductsRepository);

  Future<List<String>> call() {
    try {
      return getProductsRepository();
    } catch (error, stack) {
      if (kDebugMode) {
        log('📛 Error', error: error, stackTrace: stack);
      }
      rethrow;
    }
  }
}
