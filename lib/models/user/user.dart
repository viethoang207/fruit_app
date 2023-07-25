import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class UserInfo with _$UserInfo {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
  const factory UserInfo({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'age') required int age,
    @JsonKey(name: 'imageURL') String? imageURL,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, Object?> json) => _$UserInfoFromJson(json);
}
