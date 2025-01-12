import 'dart:convert';
import 'dart:math';

String getMonthName(int index) {
  // seasonMonths['winter']?.forEach((month) {
//     // Format the integer month to a readable string
//     String monthName = DateFormat.MMMM().format(DateTime(0, month));
//     print(monthName);
//   });
  return '';
}

// Map season to their corresponding months
final Map<String, List<int>> seasonMonths = {
  'winter': [1, 2, 3],
  'spring': [4, 5, 6],
  'summer': [7, 8, 9],
  'fall': [10, 11, 12]
};

// Get season from month using the map
String getSeasonByMonth(int month) {
  for (final entry in seasonMonths.entries) {
    if (entry.value.contains(month)) {
      return entry.key;
    }
  }
  throw ArgumentError('Invalid month: $month.');
}

// Get months for a season directly from the map
List<int> getSeasonMonths(String season) {
  return seasonMonths[season] ?? [];
}

/// Generates a random string for the code verifier.
String generateCodeVerifier() {
  final random = Random.secure();
  final code = List<int>.generate(64, (index) => random.nextInt(256)); // Length: 64
  return base64UrlEncode(code).replaceAll('=', ''); // Ensure no padding
}