import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_borders.dart';
import 'package:flutter_sandbox/common/constants/app_padding.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class StockNewsCard extends StatelessWidget {
  final News news;

  const StockNewsCard({
    Key key,
    @required this.news,
  })  : assert(news != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.padding16Top,
      child: InkWell(
        onTap: () => _openArticle(news.newsUrl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${news.source}',
                  style: AppText.subtitleDark,
                ),
                Text(
                  _simplifyDateString(news.date),
                  style: AppText.subtitle,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              '${news.title}',
              style: AppText.header,
            ),
            SizedBox(height: 8.0),
            ClipRRect(
              child: Image.network('${news.imageUrl}'),
              borderRadius: AppBorders.rounded,
            ),
            SizedBox(height: 16.0),
            Text(
              news.tickers.join(', '),
              style: AppText.subtitleAccent,
            ),
            Divider(height: 30),
          ],
        ),
      ),
    );
  }

  String _simplifyDateString(String date) {
    final components = date.split(' ');
    if (components.length < 3) {
      return date;
    }
    return components.sublist(0, 3).join(' ');
  }

  void _openArticle(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw Exception('Could not open article.');
    }
  }
}
