import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_pril/first_screen.dart';
import 'package:provider/provider.dart';

import 'object.dart';

class MainScreenCloth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0, 0.5, 0.9],
          colors: [
            Colors.black87,
            Colors.black26,
            Colors.black38,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          itemCount: Provider.of<Provide>(context).cloth.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Provider.of<Provide>(context, listen: false).clothIndex = index;
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => FirstScreen()));
              },
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 225,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            Provider.of<Provide>(context).cloth[index].img,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Container(
                      width: 300,
                      height: 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.0, 0.2, 0.9],
                            colors: [
                              Colors.black,
                              Colors.blue,
                              Colors.grey,
                            ],
                          ),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Positioned(
                    width: 100,
                    height: 25,
                    left: 15,
                    child: Container(
                      child: Text(
                        Provider.of<Provide>(context).cloth[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
