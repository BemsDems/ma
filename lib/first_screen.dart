import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_pril/object.dart';
import 'package:mini_pril/second_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ClothClass clothclass = Provider.of<Provide>(context).navigateCloth(
        Provider.of<Provide>(context)
            .cloth[Provider.of<Provide>(context).clothIndex]);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0, 0.2, 0.9],
          colors: [
            Colors.white,
            Colors.blue,
            Colors.red,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(Provider.of<Provide>(context)
              .cloth[Provider.of<Provide>(context).clothIndex]
              .name),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: clothclass.clothList.length,
          itemBuilder: (context, index) {
            log(clothclass.clothList[index].name + " first screen hero");
            return GestureDetector(
              onTap: () {
                Provider.of<Provide>(context, listen: false).clothsecond =
                    clothclass.clothList[index];
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => SecondScreen()));
              },
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Hero(
                        tag: clothclass.clothList[index].name,
                        child: CachedNetworkImage(
                            imageUrl: clothclass.clothList[index].img,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator())),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 0.2, 0.9],
                        colors: [
                          Colors.white,
                          Colors.white12,
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Text(
                        clothclass.clothList[index].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(3),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     gradient: LinearGradient(
                  //       begin: Alignment.topRight,
                  //       end: Alignment.bottomLeft,
                  //       stops: [0.0, 0.2, 0.9],
                  //       colors: [
                  //         Colors.white,
                  //         Colors.white12,
                  //         Colors.white,
                  //       ],
                  //     ),
                  //   ),
                  //   child: Text(
                  //     Provider.of<Provide>(context)
                  //         .actualClothPictures[index]
                  //         .price,
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w400),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
