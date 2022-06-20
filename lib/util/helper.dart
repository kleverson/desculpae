import 'dart:ui';

class Helper {
  Color getColorFromColorCode(String code) {
    return Color(int.parse("0xFF" + code.substring(1, 7)));
  }
}