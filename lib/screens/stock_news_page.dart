import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/models/news.dart';
import 'package:flutter_sandbox/repositories/stock_api_client.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/stocks_elements/stock_news_card.dart';
import 'package:flutter_sandbox/views/widget_elements/rounded_text_field.dart';

class StockNewsPage extends StatelessWidget {
  const StockNewsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testApi();
    final controller = TextEditingController();
    return DemoScaffold(
      isScrollable: false,
      title: 'Stock News',
      widgets: <Widget>[
        RoundedTextField(
          key: ValueKey('stock_search_field'),
          controller: controller,
          hintText: 'Search for a ticker symbol.',
          prefixIcon: Icon(Icons.search),
          onSubmitted: (String value) {},
        ),
        Expanded(
          child: ListView.builder(
            key: ValueKey('stock_list'),
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return StockNewsCard(
                news: News(
                  title: 'test',
                  text: 'test',
                  date: 'test',
                  source: 'test',
                  tickers: ['test'],
                  sentiment: Sentiment.Positive,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void testApi() async {
    final client = StockApiClient(httpClient: Dio());
    await client.authenticate();
    final news = await client.fetchNews(['AAPL']);
    print(news.toString());
  }
}
