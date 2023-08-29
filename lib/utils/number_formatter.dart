import 'package:intl/intl.dart';

class NumberFormatter {
  static String compact(num value) => NumberFormat.compact().format(value);
}
