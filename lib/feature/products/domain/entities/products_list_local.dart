import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_list_local.freezed.dart';
part 'products_list_local.g.dart';

@freezed
sealed class ProductListLocal with _$ProductListLocal {
  const factory ProductListLocal({
    required int? id,
    required String? title,
    required String? slug,
    required int? price,
    required String? description,
    required Category? category,
    required List<String>? images,
    required DateTime? creationAt,
    required DateTime? updatedAt,
    @Default(false) bool isSelected, // UI field, not from API
  }) = _ProductListLocal;

  factory ProductListLocal.fromJson(Map<String, dynamic> json) =>
      _$ProductListLocalFromJson(json);
}

@freezed
sealed class Category with _$Category {
  const factory Category({
    required int? id,
    required String? name,
    required String? slug,
    required String? image,
    required DateTime? creationAt,
    required DateTime? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

// class ProductListLocal {
//   ProductListLocal({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.images,
//     required this.creationAt,
//     required this.updatedAt,
//     this.isSelected = false,
//   });

//   final int? id;
//   final String? title;
//   final String? slug;
//   final int? price;
//   final String? description;
//   final Category? category;
//   final List<String> images;
//   final DateTime? creationAt;
//   final DateTime? updatedAt;
//   bool? isSelected;

//   factory ProductListLocal.fromJson(Map<String, dynamic> json) {
//     return ProductListLocal(
//       id: json["id"],
//       title: json["title"],
//       slug: json["slug"],
//       price: json["price"],
//       description: json["description"],
//       category:
//           json["category"] == null ? null : Category.fromJson(json["category"]),
//       images:
//           json["images"] == null
//               ? []
//               : List<String>.from(json["images"]!.map((x) => x)),
//       creationAt: DateTime.tryParse(json["creationAt"] ?? ""),
//       updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
//     );
//   }
// }

// class Category {
//   Category({
//     required this.id,
//     required this.name,
//     required this.slug,
//     required this.image,
//     required this.creationAt,
//     required this.updatedAt,
//   });

//   final int? id;
//   final String? name;
//   final String? slug;
//   final String? image;
//   final DateTime? creationAt;
//   final DateTime? updatedAt;

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json["id"],
//       name: json["name"],
//       slug: json["slug"],
//       image: json["image"],
//       creationAt: DateTime.tryParse(json["creationAt"] ?? ""),
//       updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
//     );
//   }
// }
