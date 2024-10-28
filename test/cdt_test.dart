import 'package:torugo_util/torugo_util.dart';
import 'package:test/test.dart';

void main() {
  group('CDT', () {
    test('Should generate a CDT from current Date/Time', () {
      String cdt = CDT.get();
      expect(cdt.length >= 9, isTrue);
    });

    test('Should generate a CDT from a timestamp in milliseconds', () {
      final cdt = CDT.fromTimestamp(416421033123);
      assert(CDT.validateCDT(cdt));
      expect(cdt.length, 9);
    });

    test('Should generate a CDT from a DateTime object', () {
      final cdt = CDT.fromDateTime(DateTime(2017, 8, 1, 14, 45, 17, 123));
      assert(CDT.validateCDT(cdt));
      expect(cdt.length, 9);
    });

    test('Should convert a CDT to a DateTime object', () {
      String cdt = CDT.get();
      DateTime? dt = CDT.toDateTime(cdt);
      assert(dt is DateTime);
    });

    test('Should convert a CDT to timestamp in milliseconds', () {
      final timestamp = CDT.toMillisecondsSinceEpoch('6VXCIX03F');
      expect(timestamp, 416421033123);
    });

    test('Should return null when getting DateTime from an invalid cdt', () {
      final timestamp = CDT.toDateTime('NOT_A_CDT');
      expect(timestamp, null);
    });

    test('Should return zero when getting timestamp from an invalid cdt', () {
      final timestamp = CDT.toMillisecondsSinceEpoch('NOT_A_CDT');
      expect(timestamp, 0);
    });
  });
}
