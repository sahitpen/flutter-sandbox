import 'package:flutter/material.dart';
import 'package:flutter_sandbox/models/news.dart';

class StockNewsCard extends StatelessWidget {
  final News news;

  const StockNewsCard({
    Key key,
    @required this.news,
  })  : assert(news != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('${news.source}'),
            Text('${news.date}'),
          ],
        ),
        Text('${news.title}'),
        Text('${news.text}'),
        Image.network('${news.imageUrl}'),
        Row(
          children: <Widget>[
            Text('${news.tickers}'),
            Text('${news.sentiment}')
          ],
        )
      ],
    );
  }
}
