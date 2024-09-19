class CategoryModel {
  final String uid; // category uid
  final String category; // category

  CategoryModel({
    required this.uid,
    required this.category,
  });

  // tojson
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "category": category,
      };
}
