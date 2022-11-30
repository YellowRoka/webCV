import 'package:flutter/material.dart';

import 'support_locale.dart';

//singleton with provider

//https://codewithandrea.com/articles/flutter-singletons/
//https://medium.flutterdevs.com/singletons-in-flutter-f232865fdcb3

//https://medium.flutterdevs.com/localization-multi-language-in-flutter-5cedb6ff459b

class LocaleProvider with ChangeNotifier { 
  Locale? _locale = const Locale('en');

  Locale? get locale => _locale;

  void setLocale( Locale loc ){
    if( !L10n.support.contains( loc ) ) return;

    _locale = loc;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

}
