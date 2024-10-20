String getMonthName(int index) {
  // seasonMonths['winter']?.forEach((month) {
//     // Format the integer month to a readable string
//     String monthName = DateFormat.MMMM().format(DateTime(0, month));
//     print(monthName);
//   });
  return '';
}

String getSeasonByMonth(int month) {
  if (month >= 1 && month <= 3) {
    return 'winter';
  } else if (month >= 4 && month <= 6) {
    return 'spring';
  } else if (month >= 7 && month <= 9) {
    return 'summer';
  } else if (month >= 10 && month <= 12) {
    return 'fall';
  }

  throw ArgumentError('Invalid month: $month.');
}
