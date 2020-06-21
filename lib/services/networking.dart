import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 30, // width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false // Should each log print contain a timestamp
  ),
);

/// An interface for making http requests.
/// 
/// Takes a [url] which is the target address of all member functions.
class NetworkProvider {
  final String url;

  /// Destination [url] for http requests.
  NetworkProvider(this.url);

  /// Makes a http GET request using the [client].
  /// 
  /// Returns [json] body if the response code was 200 or
  /// [null] otherwise.
  Future getData(http.Client client) async {
    http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      String responseBody = response.body;
      return convert.jsonDecode(responseBody);
    }
    logger.e('Response code: ${response.statusCode}');
    return null;
  }
}
