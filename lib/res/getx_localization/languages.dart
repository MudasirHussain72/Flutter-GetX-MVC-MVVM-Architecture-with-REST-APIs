import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
          "welcome_back": 'Welcome Back',
        },
        'ur_PK': {
          'email_hint': 'Enter ای میل',
          "welcome_back": 'خوش آمدید',
        },
      };
}
