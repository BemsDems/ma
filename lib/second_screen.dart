import 'dart:developer';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:mini_pril/cloth.dart';
import 'package:mini_pril/object.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  int status = 0;
  SnackBar snackbar = SnackBar(content: Text('empty'));
  @override
  Widget build(BuildContext context) {
    String image = Provider.of<Provide>(context, listen: false).clothsecond.img;
    log(Provider.of<Provide>(context).clothsecond.name + " second screen hero");
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(
            context,
            Provider.of<ColorFilters>(context, listen: false)
                .colorswap(Filteres.defoult));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ckachai suka eto photo"),
          backgroundColor: Colors.brown[100],
          actions: [
            IconButton(
                onPressed: () async {
                  await imgdold(url: image);
                  if (status == 1) {
                    snackbar = SnackBar(content: Text("Downloaded"));
                  } else {
                    snackbar = SnackBar(content: Text("Fail"));
                  }
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                icon: Icon(Icons.download_rounded)),
          ],
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            ColorFiltered(
              colorFilter: Provider.of<ColorFilters>(context).lol,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: image,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator())),
              ),
            ),
            Container(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: Provider.of<ColorFilters>(context).lol,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: Hero(
                      tag: Provider.of<Provide>(context).clothsecond.name,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: image,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator())),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 115,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          child: FloatingActionButton(
                            heroTag: '1',
                            backgroundColor: Colors.white12,
                            onPressed: () {
                              Provider.of<ColorFilters>(context, listen: false)
                                  .colorswap(Filteres.defoult);
                            },
                          ),
                        ),
                        Container(
                          child: FloatingActionButton(
                            heroTag: '2',
                            backgroundColor: Colors.grey[400],
                            onPressed: () {
                              Provider.of<ColorFilters>(context, listen: false)
                                  .colorswap(Filteres.greyScale);
                            },
                          ),
                        ),
                        Container(
                          child: FloatingActionButton(
                            heroTag: '3',
                            backgroundColor: Colors.indigo[700],
                            onPressed: () {
                              Provider.of<ColorFilters>(context, listen: false)
                                  .colorswap(Filteres.inver);
                            },
                          ),
                        ),
                        Container(
                          child: FloatingActionButton(
                            heroTag: '4',
                            backgroundColor: Colors.yellow[200],
                            onPressed: () {
                              Provider.of<ColorFilters>(context, listen: false)
                                  .colorswap(Filteres.sepia);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> imgdold({required String url}) async {
    try {
      var imageId = await ImageDownloader.downloadImage(url,
          destination: AndroidDestinationType.directoryDownloads);
      if (imageId == null) {
        return;
      }

      // ignore: unused_local_variable
      var fileName = await ImageDownloader.findName(imageId);
      // ignore: unused_local_variable
      var path = await ImageDownloader.findPath(imageId);
      // ignore: unused_local_variable
      var size = await ImageDownloader.findByteSize(imageId);
      // ignore: unused_local_variable
      var mimeType = await ImageDownloader.findMimeType(imageId);
      status = 1;
      print('ok');
    } on PlatformException catch (error) {
      print(error);
      status = 0;
    }
  }
}
