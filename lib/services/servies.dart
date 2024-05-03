import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> registerVisit(Map<String, dynamic> requestBody) async {
  try {
    // Define the endpoint URL
    String url = 'http://54.234.163.158:5000/register_visit/';

    // Convert the request body to JSON
    String requestBodyJson = json.encode(requestBody);

    // Make the POST request
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBodyJson,
    );

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the response JSON
      Map<String, dynamic> responseData = json.decode(response.body);

      // Print the message
      print(responseData['message']);
    } else {
      // If the request was not successful, print the error message
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // If an error occurred during the request, print the error
    print('Error: $e');
  }
}
