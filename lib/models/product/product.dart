import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@JsonSerializable()
@freezed
abstract class Product with _$Product{
  const Product._();

  const factory Product({
    required String id,
    required String name,
    required String category,
    required String title,
    required String description,
    required String unit,
    required double dolar,
    required List<String> images
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}