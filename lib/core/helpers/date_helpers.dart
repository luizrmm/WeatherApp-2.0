import 'package:intl/intl.dart';

String formatDateAmPm(String stringDate) {
  final date = DateTime.parse(stringDate);
  return DateFormat('hh:mm a').format(date);
}
