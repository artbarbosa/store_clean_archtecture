import '../../domain/value_objects/category.dart';

class JsonToCategory {
  static Category fromMap(dynamic json) {
    return Category(
      name: json['name'],
    );
  }

  static Map<String, dynamic> toMap(Category category) {
    return {
      'category': category.name,
    };
  }
}
