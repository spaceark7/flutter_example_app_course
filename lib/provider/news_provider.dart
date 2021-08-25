import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:dicoding_news_app/data/model/article.dart';
import 'package:dicoding_news_app/utils/result_state.dart';
import 'package:flutter/cupertino.dart';



class NewsProvider with ChangeNotifier {
  final ApiService apiService;

  NewsProvider({required this.apiService}) {
    _fetchAllArticles();
  }

  late ArticlesResult _articlesResult;
  String _message = '';
  late ResultState _state;

  ArticlesResult get result => _articlesResult;
  String get message => _message;
  ResultState get state => _state;

  Future<dynamic> _fetchAllArticles() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final article = await apiService.topHeadlines();

      if (article.articles.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error -> $e";
    }
  }
}
