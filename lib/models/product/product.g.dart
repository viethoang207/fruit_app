// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      unit: json['unit'] as String,
      dolar: (json['dolar'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'unit': instance.unit,
      'dolar': instance.dolar,
      'images': instance.images,
    };
