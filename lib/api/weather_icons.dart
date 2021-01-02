import 'package:flutter/widgets.dart';

class WeatherIcons {
  WeatherIcons._();

  static const _kFontFam = 'WeatherIcons';
  static const _kFontPkg = null;

  static const IconData thunderstorm =
      IconData(0xF033, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData drizzle =
      IconData(0xF037, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData rain =
      IconData(0xF036, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData snow =
      IconData(0xF038, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData clear =
      IconData(0xF00D, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData clouds =
      IconData(0xF013, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData none =
      IconData(0xF03E, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
