// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      username: json['username'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      imageURL: json['imageURL'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'age': instance.age,
      'imageURL': instance.imageURL,
      'address': instance.address,
      'phone': instance.phone,
    };
