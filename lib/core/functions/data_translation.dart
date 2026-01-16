import 'package:get/utils.dart';

String dataTranslation(String? arabic, String? english) {
  if (Get.locale?.languageCode == 'en') {
    return english ?? '';
  } else {
    return arabic ?? '';
  }
}
