part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNews extends NewsEvent {
  final List<String> tickers;

  const FetchNews({
    @required this.tickers,
  }) : assert(tickers != null);

  @override
  List<Object> get props => [tickers];
}
