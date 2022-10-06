class Util {
  static String formatDate(
    String? date, {
    showTime = false,
  }) {
    if (date == null || date.isEmpty) {
      return "";
    }

    final local = DateTime.parse(date);

    final day = local.day.toString().length == 1
        ? "0${local.day.toString()}"
        : local.day.toString();
    final month = local.month.toString().length == 1
        ? "0${local.month.toString()}"
        : local.month.toString();

    String formatted = "$day/$month/${local.year}";

    return formatted;
  }
}
