// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "language": "Language",
  "mainTitle": "Discover Seasonal Fruits and Vegetables",
  "signIn": "Sign In",
  "email": "Email",
  "password": "Password",
  "confirmPW": "Confirm Password",
  "createAccount": "Create your account",
  "or": "or",
  "invalidEmail": "Email is invalid",
  "invalidPW": "Password is invalid",
  "pwNotMatch": "The password you entered do not match",
  "fruit": "Fruit"
};
static const Map<String,dynamic> vi = {
  "language": "Ngôn ngữ",
  "mainTitle": "Khám phá các loại rau và hoa quả theo mùa",
  "signIn": "Đăng nhập",
  "email": "Email",
  "password": "Mật khẩu",
  "confirmPW": "Xác nhận mật khẩu",
  "createAccount": "Tạo tài khoản",
  "or": "hoặc",
  "invalidEmail": "Email không hợp lệ",
  "invalidPW": "Mật khẩu không hợp lệ",
  "pwNotMatch": "Mật khẩu xác nhận không trùng nhau",
  "fruit": "Quả"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "vi": vi};
}
