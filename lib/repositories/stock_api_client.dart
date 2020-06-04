import 'package:dio/dio.dart';
import 'package:flutter_sandbox/authorization/secret_loader.dart';
import 'package:flutter_sandbox/models/news.dart';
import 'package:meta/meta.dart';

class StockApiClient {
  static const baseUrl = 'https://stocknewsapi.com/api/v1';
  final Map<String, dynamic> queryParameters = {
    'items': 10,
  };
  final Dio httpClient;

  StockApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null) {}

  Future<bool> authenticate() async {
    final apiKey = await SecretLoader.getStocksApiKey();
    queryParameters['token'] = apiKey;
    return true;
  }

  Future<List<News>> fetchNews(List<String> tickers) async {
    queryParameters['tickers'] = tickers.toString();
    final newsResponse = await httpClient.get(
      baseUrl,
      queryParameters: queryParameters,
    );

    if (newsResponse.statusCode != 200) {
      throw Exception('Error getting stock news!');
    }

    final newsList = newsResponse.data['data'] as List;
    return newsList.map((newsObj) {
      return News.fromJson(newsObj);
    }).toList();
  }
}
