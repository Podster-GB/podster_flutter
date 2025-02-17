import 'package:http/http.dart' as http;
import 'package:podster_flutter/services/networking.dart';

const String baseUrl = 'https://api.spreaker.com';
const String version = 'v2';
const String endpointName = 'explore';
const String contentFormat = 'lists';
const String country = 'GB'; // must be an ISO 3166-1 country code

class ExploreAPI {
  Future<List<dynamic>> getCuratedLists(http.Client client) async {
    String _endpointUrl = '$baseUrl/$version/$endpointName/$contentFormat?country=$country';
    NetworkProvider _networkProvider = NetworkProvider(_endpointUrl);
    dynamic _body = await _networkProvider.getData(client);
    List<dynamic> _curatedLists = _body['response']['items'];
    return _curatedLists;
  }

  Future<List<dynamic>> getCuratedListItems(http.Client client, int listId) async {
    String _endpointUrl = '$baseUrl/$version/$endpointName/$contentFormat/$listId/items';
    NetworkProvider _networkProvider = NetworkProvider(_endpointUrl);
    dynamic _response = await _networkProvider.getData(client);
    List<dynamic> _items = _response['response']['items'];
    return _items;
  }
}