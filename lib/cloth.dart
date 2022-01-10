import 'package:flutter/cupertino.dart';

class ClothCategory {
  String name;
  String img;
  int id;
  ClothCategory({required this.name, required this.img, required this.id});
}

class Cloth {
  String img;
  String name;

  // String price;
  Cloth({
    required this.img,
    required this.name,
  });
}

enum Filteres { defoult, greyScale, sepia, inver }

class ColorFilters extends ChangeNotifier {
  var lol = defoult;
  var de = defoult;
  static var defoult = ColorFilter.matrix(<double>[
    /// matrix
    1.0, 0, 0, 0, 0,
    0, 1.0, 0, 0, 0,
    0, 0, 1.0, 0, 0,
    0, 0, 0, 1, 0
  ]);

  static var greyscale = ColorFilter.matrix(<double>[
    /// matrix
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0, 0, 0, 1, 0
  ]);

  static const sepia = ColorFilter.matrix(<double>[
    /// matrix
    0.393, 0.769, 0.189, 0, 0,
    0.349, 0.686, 0.168, 0, 0,
    0.272, 0.534, 0.131, 0, 0,
    0, 0, 0, 1, 0,
  ]);

  static const invert = ColorFilter.matrix(<double>[
    /// matrix
    -1, 0, 0, 0, 255,
    0, -1, 0, 0, 255,
    0, 0, -1, 0, 255,
    0, 0, 0, 1, 0,
  ]);
  colorswap(Filteres filter) {
    if (filter == Filteres.defoult) {
      lol = defoult;
    }
    if (filter == Filteres.greyScale) {
      lol = greyscale;
    } else if (filter == Filteres.sepia) {
      lol = sepia;
    } else if (filter == Filteres.inver) lol = invert;

    notifyListeners();
  }
}
