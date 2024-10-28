///
/// CDT (Compressed Date and Time) is a way of storing
/// date and time including milliseconds.
///
final class CDT {
  ///
  /// Generates a CDT from current Date/Time
  ///
  static String get() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    return _assembleCDT(timestamp);
  }

  ///
  /// Builds the final CDT string from a [timestamp in milliseconds]
  ///
  static String _assembleCDT(int millisecondsSinceEpoch) {
    final ts = (millisecondsSinceEpoch / 1000).toStringAsFixed(3);

    final parts = ts.split('.');

    final sec = int.parse(parts[0]).toRadixString(36).toUpperCase();
    final milli = int.parse(parts[1]).toRadixString(36).toUpperCase().padLeft(3, "0");

    return '$sec$milli';
  }

  ///
  /// Generates a CDT from a [timestamp in milliseconds]
  ///
  static String fromTimestamp(int millisecondsSinceEpoch) {
    return _assembleCDT(millisecondsSinceEpoch);
  }

  ///
  /// Generates a CDT from a [DateTime] object
  ///
  static String fromDateTime(DateTime dateTime) {
    return _assembleCDT(dateTime.millisecondsSinceEpoch);
  }

  ///
  /// Converts a CDT to [DateTime] object, returns [null] if CDT is invalid
  ///
  static DateTime? toDateTime(String cdt) {
    if (validateCDT(cdt) == false) {
      return null;
    }

    int timestamp = toMillisecondsSinceEpoch(cdt);
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  ///
  /// Validates a CDT string
  ///
  static bool validateCDT(String cdt) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9]{4,10}$');
    return regExp.hasMatch(cdt);
  }

  ///
  /// Converts a CDT to [timestamp in milliseconds], returns [zero] when CDT
  /// is invalid.
  ///
  static int toMillisecondsSinceEpoch(String cdt) {
    if (validateCDT(cdt) == false) {
      return 0;
    }

    final pos = cdt.length - 3;
    final str = '${cdt.substring(0, pos)}.${cdt.substring(pos)}';
    final parts = str.split('.');

    final sec = int.parse(parts[0], radix: 36).toString();
    final milli = int.parse(parts[1], radix: 36).toString().padLeft(3, '0');

    return int.parse('$sec$milli');
  }
}
