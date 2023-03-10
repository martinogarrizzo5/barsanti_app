import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Formatters {
  static String formatDate(BuildContext context, DateTime? date) {
    if (date == null) return "TBA";

    return DateFormat(
      "dd MMMM yyyy",
      Localizations.localeOf(context).languageCode,
    ).format(
      date.toLocal(),
    );
  }
}
