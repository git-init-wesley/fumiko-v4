import 'package:intl/intl.dart';

class NumberFormatter {
  static NumberFormat formatter = NumberFormat.compact();

  static String compact(num value) => formatter.format(value);
//static String compact(num value) => formatter.format(num.tryParse(value.toStringAsPrecision(2)) ?? 0);
}
