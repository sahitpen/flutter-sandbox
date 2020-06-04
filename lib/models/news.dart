import 'package:equatable/equatable.dart';

enum Sentiment { Positive, Neutral, Negative }

class News extends Equatable {
  final String newsUrl;
  final String imageUrl;
  final String title;
  final String text;
  final String source;
  final DateTime date;
  final Sentiment sentiment;
  final List<String> tickers;

  const News({
    this.newsUrl,
    this.imageUrl,
    this.title,
    this.text,
    this.source,
    this.date,
    this.sentiment,
    this.tickers,
  });

  @override
  List<Object> get props => [
        newsUrl,
        imageUrl,
        title,
        text,
        source,
        date,
        sentiment,
        tickers,
      ];

  static News fromJson(dynamic json) {
    return News(
      newsUrl: json['news_url'],
      imageUrl: json['image_url'],
      title: json['title'],
      text: json['text'],
      source: json['source_name'],
      date: DateTime.parse(json['date']),
      sentiment: _mapStringToSentiment(json['sentiment']),
      tickers: json['tickers'],
    );
  }

  static Sentiment _mapStringToSentiment(String input) {
    Sentiment sentiment;
    switch (input) {
      case 'Positive':
        sentiment = Sentiment.Positive;
        break;
      case 'Negative':
        sentiment = Sentiment.Negative;
        break;
      case 'Neutral':
        sentiment = Sentiment.Neutral;
        break;
    }
    return sentiment;
  }
}
