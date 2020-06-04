part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  @override
  List<Object> get props => [];
}

class NewsEmpty extends NewsState {}

class NewsError extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;

  const NewsLoaded({
    @required this.news,
  }) : assert(news != null);

  @override
  List<Object> get props => [news];
}
