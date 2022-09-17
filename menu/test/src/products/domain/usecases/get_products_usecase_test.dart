import 'package:flutter_test/flutter_test.dart';
import 'package:menu/src/products/infrastructure/datasources/get_products_datasource.dart';
import 'package:menu/src/products/domain/repositories/get_products_repository.dart';
import 'package:menu/src/products/domain/usecases/get_products_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_products_usecase_test.mocks.dart';

@GenerateMocks([
  GetProductsRepository,
  GetProductsDatasource,
])
void main() {
  late MockGetProductsRepository repository;
  late GetProductsUsecase getProducts;

  List<String> produtos = ['prod 01', 'prod 02'];

  setUp(() {
    repository = MockGetProductsRepository();
    getProducts = GetProductsUsecase(repository);
  });

  test('Shold returna list of products', () async {
    when(repository()).thenAnswer((_) => Future.value(produtos));

    final result = await getProducts();
    expect(result, ['prod 01', 'prod 02']);
  });
}
