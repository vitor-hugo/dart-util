import 'dart:math';

import 'package:torugo_util/src/cdt/cdt.dart';

///
/// TUID (Torugo Unique Identifier) generates a random unique ID with date and time.
/// - **short:** 20 char long id
/// - **medium:** 26 char long id
/// - **long:** 36 char long id
///
class TUID {
  static final String _patternShort = r'^[A-Z][A-Z0-9]{6}-TS[A-Z0-9]{10}$';
  static final String _patternMedium = r'^[A-Z][A-Z0-9]{7}-[A-Z0-9]{4}-TM[A-Z0-9]{10}$';
  static final String _patternLong = r'^[A-Z][A-Z0-9]{7}-[A-Z0-9]{4}-[A-Z0-9]{9}-TL[A-Z0-9]{10}$';

  ///
  /// Generates a 20 char long ID
  ///
  static String short() {
    String a = _rand(7, true);
    String b = _getCDT();
    return '$a-TS$b';
  }

  ///
  /// Generates a 26 char long ID
  ///
  static String medium() {
    String a = _rand(8, true);
    String b = _rand(4);
    String c = _getCDT();
    return '$a-$b-TM$c';
  }

  ///
  /// Generates a 36 char long ID
  ///
  static String long() {
    String a = _rand(8, true);
    String b = _rand(4);
    String c = _rand(9);
    String d = _getCDT();
    return '$a-$b-$c-TL$d';
  }

  ///
  /// Generates a random string with a given [length]. If [initWithAlpha] is
  /// [`true`] the random string will start with a alphabetical letter.
  ///
  static String _rand(int length, [bool initWithAlpha = false]) {
    String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();

    String str = '';
    for (int i = 0; i < length; i++) {
      str += chars[random.nextInt((i == 0 && initWithAlpha) ? 26 : 36)];
    }

    return str;
  }

  static String _getCDT() {
    return CDT.get().padLeft(10, '0');
  }

  ///
  /// Validates a TUID
  /// - [tuid] to be validated
  ///
  static bool validate(String tuid) {
    String source = '';
    switch (tuid.length) {
      case 20:
        source = _patternShort;
        break;

      case 26:
        source = _patternMedium;
        break;

      case 36:
        source = _patternLong;
        break;

      default:
        return false;
    }

    RegExp regExp = RegExp(source);
    return regExp.hasMatch(tuid);
  }

  ///
  /// Returns a [DateTime] object from a [TUID], returns [null] when
  /// TUID is invalid.
  ///
  static DateTime? getDateTime(String tuid) {
    if (validate(tuid) == false) return null;
    final cdt = tuid.substring(tuid.length - 10).replaceFirst(RegExp(r'^0'), '');
    if (CDT.validateCDT(cdt) == false) return null;
    return CDT.toDateTime(cdt);
  }
}
