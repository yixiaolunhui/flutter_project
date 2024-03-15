import 'package:flutter_project/res/intl/string_res_key.dart';

class Language {
  String defName = '';
  String name = '';
  String language = '';
  String country = '';

  Language(this.defName, this.name, this.language, this.country);

  Language.fromJson(Map<String, dynamic> json)
      : defName = json['defName'],
        name = json['name'],
        language = json['language'],
        country = json['country'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'defName': defName,
        'language': language,
        'country': country,
      };

  @override
  String toString() {
    return 'Language{defName: $defName, name: $name, language: $language, country: $country}';
  }
}

final defLanguage = Language('English', RS.english, 'en', 'US');

final languageList = [
  Language('English（US）', RS.english, 'en', 'US'),
  Language('English（UK）', RS.english, 'en', 'UK'),
  Language('中文', RS.chinese, 'zh', 'cn'),
  Language('日本語', RS.japanese, 'ja', 'JP'),
];
