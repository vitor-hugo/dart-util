# Dart Utility library <!-- omit in toc -->

Library with useful classes and methods.

# Table of Contents <!-- omit in toc -->

- [Requirements](#requirements)
- [Importing](#importing)
- [Utilities](#utilities)
  - [CDT (Compressed Date and Time)](#cdt-compressed-date-and-time)
    - [get](#get)
    - [fromTimestamp](#fromtimestamp)
    - [fromDateTime](#fromdatetime)
    - [toMillisecondsSinceEpoch](#tomillisecondssinceepoch)
    - [toDateTime](#todatetime)
    - [validate](#validate)
  - [TUID (Torugo Unique ID)](#tuid-torugo-unique-id)
    - [Generating](#generating)
    - [Validating](#validating)
    - [Getting Date and Time](#getting-date-and-time)
- [Contribute](#contribute)
- [License](#license)

# Requirements

- Dart >= 3.0.0

# Importing

```dart
import 'package:torugo_util/torugo_util.dart';
```

# Utilities

## CDT (Compressed Date and Time)

CDT is a way of storing date and time including milliseconds.

### get

Returns a CDT from current date/time.

```dart
String cdt = CDT.get(); // returns something like 'SGVU9Z2WV'
```

### fromTimestamp

Generates a CDT from a timestamp (millisecondsSinceEpoch).

```dart
String cdt = CDT.fromTimestamp(416421033123); // returns '6VXCIX03F'
```

### fromDateTime

Generates a CDT from a `DateTime` object

```dart
String cdt = CDT.fromDateTime(DateTime(2017, 8, 1, 14, 45, 17, 123));
```

### toMillisecondsSinceEpoch

Converts a CDT to a timestamp (millisecondsSinceEpoch),
returns `0` (zero) when CDT is invalid.

```dart
int timestamp = CDT.toMillisecondsSinceEpoch('6VXCIX03F');
```

### toDateTime

Converts a CDT to `DateTime` object, returns `null` if CDT is invalid.

```dart
DateTime? dt = CDT.toDateTime('6VXCIX03F');
```

### validate

Validates a CDT string.

```dart
bool validation = CDT.validate('6VXCIX03F');
```

---

## TUID (Torugo Unique ID)

Generates a randomic unique ID with date and time.

This tool can generate three types of IDs:

| Type   | Length | Sample                               |
| ------ | :----: | ------------------------------------ |
| Short  |   20   | QJLM77R-TS0SHULDI0SH                 |
| Medium |   26   | KMSEEBAN-NC7V-TM0SHULDI0U2           |
| Long   |   36   | PVA4M433-20L5-K1HVUPLQW-TL0SHULDI0VT |

### Generating

```dart
String short = TUID.short();
String medium = TUID.medium();
String long = TUID.long();
```
### Validating

```dart
final id = "PVA4M433-20L5-K1HVUPLQW-TL0SHULDI0VT";

if (TUID.validate(id) == false) {
  // Do something...
}
```

### Getting Date and Time

```dart
final id = "KMSEEBAN-NC7V-TM0SHULDI0U2";
TUID.getDateTime(id); // returns a DateTime object
```

# Contribute

It is currently not open to contributions, I intend to make it
available as soon as possible.

# License

This library is licensed under the MIT License - see the LICENSE
file for details.