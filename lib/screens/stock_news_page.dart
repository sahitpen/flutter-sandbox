import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox/bloc/news_bloc.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/stocks_elements/stock_news_card.dart';
import 'package:flutter_sandbox/views/widget_elements/rounded_text_field.dart';

class StockNewsPage extends StatelessWidget {
  const StockNewsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsBloc = BlocProvider.of<NewsBloc>(context);
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
          onSubmitted: (String value) => newsBloc.add(
            FetchNews(tickers: value.split(', ')),
          ),
        ),
        SizedBox(height: 8.0),
        Expanded(
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) => _handleState(state),
          ),
        ),
      ],
    );
  }

  Widget _handleState(NewsState state) {
    if (state is NewsEmpty) {
      return Center(child: Text('There is no news available.'));
    } else if (state is NewsLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is NewsLoaded) {
      final news = state.news;
      return ListView.builder(
        key: ValueKey('stock_list'),
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return StockNewsCard(news: news[index]);
        },
      );
    } else {
      return Center(child: Text('Could not retrieve news.'));
    }
  }
}
