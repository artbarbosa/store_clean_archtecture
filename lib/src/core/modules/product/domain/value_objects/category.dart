class Category {
  final int? id;
  final String name;

  Category({required this.name, this.id});

  bool isValidCategory() => name.isNotEmpty;
}
