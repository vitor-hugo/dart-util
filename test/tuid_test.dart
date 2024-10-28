import 'package:torugo_util/torugo_util.dart';
import 'package:test/test.dart';

void main() {
  group('TUID', () {
    test('Shuold generate a short TUID', () {
      String tuid = TUID.short();
      expect(tuid.length, 20);
    });

    test('Should generate a medium TUID', () {
      String tuid = TUID.medium();
      expect(tuid.length, 26);
    });

    test('Should generate a long TUID', () {
      String tuid = TUID.long();
      expect(tuid.length, 36);
    });

    test('Should validate all TUID sizes', () {
      String short = TUID.short();
      String medium = TUID.medium();
      String long = TUID.long();

      expect(TUID.validate(short), isTrue);
      expect(TUID.validate(medium), isTrue);
      expect(TUID.validate(long), isTrue);
    });

    test('Should extract DateTime object from TUID', () {
      String short = TUID.short();
      String medium = TUID.medium();
      String long = TUID.long();

      final dt1 = TUID.getDateTime(short);
      final dt2 = TUID.getDateTime(medium);
      final dt3 = TUID.getDateTime(long);

      assert(dt1 is DateTime);
      assert(dt2 is DateTime);
      assert(dt3 is DateTime);
    });
  });
}
