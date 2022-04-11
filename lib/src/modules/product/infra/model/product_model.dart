import '../../domain/entities/product_entity.dart';
import '../../domain/value_objects/category.dart';

class ProductModel extends ProductEntity {
  final String description;
  final String image;
  ProductModel(
      {required this.description,
      required this.image,
      required int id,
      required String title,
      required num price,
      required Category category})
      : super(id: id, title: title, price: price, category: category);
}
