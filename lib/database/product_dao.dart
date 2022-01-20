import 'package:floor/floor.dart';
import 'productDB.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM ProductDB')
  Future<List<ProductDB>> findAllProducts();

  @Query('DELETE * FROM ProductDB')
  Future<String> deleteAllProducts();

  @insert
  Future<void> insertProduct(ProductDB productDB);
}
