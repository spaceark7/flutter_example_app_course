import 'package:dicoding_news_app/common/Style.dart';
import 'package:dicoding_news_app/common/navigation.dart';
import 'package:dicoding_news_app/data/model/article.dart';
import 'package:dicoding_news_app/provider/database_provider.dart';
import 'package:dicoding_news_app/ui/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  final VoidCallback? onPress;

  const CardArticle({Key? key, required this.article, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
        future: provider.isBookmarked(article.url),
        builder: (context, snapshot) {
          var isBookmarked = snapshot.data ?? false;
          return Material(
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              leading: Hero(
                tag: article.urlToImage!,
                child: Image.network(
                  article.urlToImage!,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              trailing: isBookmarked ?
              IconButton(
                  icon: Icon(Icons.bookmark),
                  color: Theme.of(context).accentColor,
                  onPressed: () => provider.removeBookmark(article.url),
                )
              : IconButton(
                  icon: Icon(Icons.bookmark_border),
                  color: Theme.of(context).accentColor,
                  onPressed: () => provider.addBookmark(article),
      ),
              title: Text(
                article.title,
                maxLines: 3,
              ),
              subtitle: Text(article.author!),
              onTap: () {
                Navigation.intentWithData(ArticleDetailPage.routeName, article);
              },
            ),
          );
        },
      );
    });
  }
}
