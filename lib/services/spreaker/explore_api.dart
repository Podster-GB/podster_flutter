import '../networking.dart';

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

const String baseUrl = 'https://api.spreaker.com';
const String version = 'v2';
const String endpointName = 'explore';
const String contentFormat = 'lists';
const String country = 'GB'; // must be an ISO 3166-1 country code

class ExploreAPI {


  Future<Map<String, dynamic>> getCuratedLists() async {
    String _endpointUrl = '$baseUrl/$version/$endpointName/$contentFormat?country=$country';
    NetworkProvider _networkProvider = NetworkProvider(_endpointUrl);
    dynamic _response = await _networkProvider.getData();
    return _response;
  }

  Future<dynamic> getCuratedListItems(int listId) async {
    String _endpointUrl = '$baseUrl/$version/$endpointName/$contentFormat/$listId/items';
    NetworkProvider _networkProvider = NetworkProvider(_endpointUrl);
    dynamic _response = await _networkProvider.getData();
    List<dynamic> _items = _response['response']['items'];

    return _items;
  }
}