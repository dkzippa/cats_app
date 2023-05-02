import 'dart:io';
import 'package:intl/intl.dart';

String formatDateIntl(hiveDateStr, context) {
  final dateTime = DateTime.parse(hiveDateStr);
  final locale = Platform.localeName;
  return DateFormat.yMMMMd(locale).format(dateTime).toString();
}
