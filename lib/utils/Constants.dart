const String malLisAPI = 'as';

const Map<String, List<int>> seasonMonths = <String, List<int>>{
  'winter': <int>[DateTime.january, DateTime.february, DateTime.march],
  'spring': <int>[DateTime.april, DateTime.may, DateTime.june],
  'summer': <int>[DateTime.july, DateTime.august, DateTime.september],
  'fall': <int>[DateTime.october, DateTime.november, DateTime.december],
};

// seasonMonths['winter']?.forEach((month) {
//     // Format the integer month to a readable string
//     String monthName = DateFormat.MMMM().format(DateTime(0, month));
//     print(monthName);
//   });
