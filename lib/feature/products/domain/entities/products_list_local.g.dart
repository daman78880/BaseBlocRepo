// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list_local.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductListLocal _$ProductListLocalFromJson(Map<String, dynamic> json) =>
    _ProductListLocal(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      category:
          json['category'] == null
              ? null
              : Category.fromJson(json['category'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      creationAt:
          json['creationAt'] == null
              ? null
              : DateTime.parse(json['creationAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductListLocalToJson(_ProductListLocal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'images': instance.images,
      'creationAt': instance.creationAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isSelected': instance.isSelected,
    };

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
  creationAt:
      json['creationAt'] == null
          ? null
          : DateTime.parse(json['creationAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
  'creationAt': instance.creationAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
