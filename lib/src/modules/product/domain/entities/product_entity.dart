import '../value_objects/category.dart';

class ProductEntity {
  final int id;
  final String title;
  final num price;
  final Category category;

  ProductEntity({
    required this.id,
    required this.title,  
    required this.price,
    required this.category,
  });
}
