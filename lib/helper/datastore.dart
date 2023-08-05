import 'dart:convert';
import 'dart:io';

Future<void> writeDataToJson(Map<String, dynamic> data, String filePath) async {
  // Convert data to JSON string
  String jsonString = json.encode(data);

  // Get the file reference
  File file = File('assets/json/chat.json');

  try {
    // Write the JSON string to the file
    await file.writeAsString(jsonString);
    print('Data written to the JSON file successfully.');
  } catch (e) {
    print('Error writing data to the JSON file: $e');
  }
}
