import '../value_objects/category.dart';

class ProductEntity {
  final String id;
  final String title;
  final String description;
  final num price;
  final Category category;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
  });

  bool isValidProduct() {
    return title.isNotEmpty &&
        description.isNotEmpty &&
        !price.isNegative &&
        category.isValidCategory();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductEntity &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        category.hashCode;
  }
}
