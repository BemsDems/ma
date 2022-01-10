import 'package:flutter/material.dart';
import 'package:manga/api/anime_api.dart';
import 'package:manga/models/anime_info.dart';

class AnimeMangaScreen extends StatefulWidget {
  AnimeMangaScreen({Key? key}) : super(key: key);

  _AnimeMangaScreenState createState() => _AnimeMangaScreenState();
}

class _AnimeMangaScreenState extends State<AnimeMangaScreen> {
  Future<AnimeInfo>? forecastObject;
  String animeTitle = 'Anime';

  @override
  void initState() {
    super.initState();
    forecastObject = AnimeApi().fetchAnimeWithAnime(animeTitle: animeTitle);
    // forecastObject?.then((value) {
    //   print('Sex');
    // },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<AnimeInfo>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                AnimeInfo? animeInfo = snapshot.data;
                return ListView.builder(
                    itemCount: animeInfo!.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Text(
                                '${snapshot.data!.data![index].attributes!.title!.en}'),
                            Text(
                                '${snapshot.data!.data![index].attributes!.description!.en}/n${snapshot.data!.data![index].attributes!.description!.ru}'),
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
