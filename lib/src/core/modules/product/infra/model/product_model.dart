import '../../domain/entities/product_entity.dart';
import '../../domain/value_objects/category.dart';

class ProductModel extends ProductEntity {
  final String image;
  ProductModel({
    required int id,
    required String title,
    required String description,
    required num price,
    required Category category,
    required this.image,
  }) : super(
            id: id.toString(),
            title: title,
            price: price,
            category: category,
            description: description);
}
