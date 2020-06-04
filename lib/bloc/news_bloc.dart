import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_sandbox/repositories/stock_api_client.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sandbox/models/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final StockApiClient apiClient;

  NewsBloc({
    @required this.apiClient,
  }) : assert(apiClient != null);

  @override
  NewsState get initialState => NewsEmpty();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      try {
        await apiClient.authenticate();
        final news = await apiClient.fetchNews(event.tickers);
        yield NewsLoaded(news: news);
      } catch (_) {
        yield NewsError();
      }
    }
  }
}
