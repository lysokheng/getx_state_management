import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'username': 'Username',
      'password': 'Password',
      'login': 'Login',
    },
    'kh_KH': {
      'username': 'ឈ្មោះអ្នកប្រើប្រាស់',
      'password': 'ពាក្យសំងាត់',
      'login': 'ចូល',
    }
  };
}