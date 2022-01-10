import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_pril/cloth.dart';

class Provide extends ChangeNotifier {
  late int clothIndex;
  late Cloth clothsecond;
  List<ClothCategory> cloth = [
    ClothCategory(
        name: 'T-shirt',
        img:
            'https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/3c2065133026139.61b4b7f1cab2b.png',
        id: 1),
    ClothCategory(
        name: 'Hoodie',
        img: 'https://mega.ru/megastyle/upload/iblock/8ee/Tolstovka.png',
        id: 2),
    ClothCategory(
        name: 'Sweater',
        img:
            'https://images.wallpaperscraft.ru/image/single/klen_sviter_osen_186255_1920x1080.jpg',
        id: 3),
    ClothCategory(
        name: 'Undershirt',
        img:
            'https://images.wallpaperscraft.ru/image/single/majka_nadpis_zheltyj_163787_1920x1080.jpg',
        id: 4),
  ];

  ClothClass tShirt = ClothClass(clothList: [
    Cloth(
      name: 'Im',
      img:
          'https://img.mysku-st.ru/uploads/images/00/53/98/2015/11/10/a8504a.jpg',
    ),
    Cloth(
      name: 'Classic',
      img:
          'https://63pokupki.fra1.cdn.digitaloceanspaces.com/item/x512/4ff860b07c7321ac27cfdd2a69781da8dyu8tw1kx39a9ia.jpg',
    ),
    Cloth(
      name: 'Russia',
      img:
          'https://img.joomcdn.net/2a71dcb66dfe3763e4fa015de862507bddce5a4d_original.jpeg',
    ),
    Cloth(
      name: 'E-not',
      img:
          'https://63pokupki.fra1.cdn.digitaloceanspaces.com/item/x512/3cc1a0646ce78a7b710811306081f492cpy5kfwskfi5xe7q.jpg',
    ),
  ]);

  ClothClass hoodie = ClothClass(clothList: [
    Cloth(
      name: 'Black',
      img:
          'https://www.reserved.com/media/catalog/product/cache/1200/a4e40ebdc3e371adff845072e1c73f37/3/6/3694C-99X-040-1_2.jpg',
    ),
    Cloth(
      name: 'Raptor',
      img: 'https://kosmo-shop.com/25232/khudi-offline.jpg',
    ),
    Cloth(
      name: 'GAP',
      img:
          'https://gap.ru/upload/iblock/5fe/5fe7414ed310227fcbe83d6151017d46.jpg',
    ),
    Cloth(
      name: 'Cat :3',
      img:
          'https://static-sl.insales.ru/images/products/1/5540/481080740/%D0%BC%D0%B5%D0%B4%D1%83%D0%B7%D0%B0-%D1%85%D1%83%D0%B4%D0%B8-%D0%BA%D0%B8%D1%80%D0%BF%D0%B8%D1%87%D0%BD%D1%8B%D0%B9.jpg',
    ),
  ]);

  ClothClass sweater = ClothClass(clothList: [
    Cloth(
      name: 'Fire',
      img: 'https://ae01.alicdn.com/kf/Hac28e96421f64f2f9c216d91219fa84eq.jpg',
    ),
    Cloth(
      name: 'Woman',
      img:
          'https://static-sl.insales.ru/images/products/1/8/336347144/%D0%9B%D0%B0%D0%B8%CC%86%D1%84_%D0%98%D1%80%D0%B5%D0%BD_04_0203888.jpg',
    ),
    Cloth(
      name: 'Gay?',
      img:
          'https://ae01.alicdn.com/kf/HTB16zh6KuySBuNjy1zdq6xPxFXaj/Simenual.jpg',
    ),
    Cloth(
      name: 'Aggressive',
      img:
          'https://static-sl.insales.ru/images/products/1/2680/418523768/%D0%BD%D0%BE%D1%80%D0%BC%D0%B0_%D1%81%D0%B2%D0%B8%D1%82%D0%B5%D1%80_%D0%BA%D1%80%D0%B0%D1%81%D0%BD%D1%8B%D0%B9.jpg',
    ),
  ]);

  ClothClass undershirt = ClothClass(clothList: [
    Cloth(
      name: 'White',
      img:
          'https://storage-cdn5.gloria-jeans.ru/medias/BTN001665-1-01-300Wx300H.jpg?context=bWFzdGVyfHByb2R1Y3R8NjkxMXxpbWFnZS9qcGVnfGhjZS9oYzUvOTI1MDQ5NDgwODA5NC9CVE4wMDE2NjUtMS0wMV8zMDBXeDMwMEguanBnfDcyNjBkMWIxYzgyMTZhM2JkNTY0NmQ3ZDhjYTY1N2FmYzc2MzlmNjU5OTNkMjc5NzRjZDQwNGVmODUyYzE3NmQ',
    ),
    Cloth(
      name: 'VDV',
      img:
          'https://voensklad.su/image/cache/catalog/telnlashka-majka-vdv-1-800x800.jpg',
    ),
    Cloth(
      name: 'Basketball',
      img:
          'https://www.formabasket.com/wa-data/public/shop/products/90/47/4790/images/14695/14695.970.jpg',
    ),
    Cloth(
      name: 'Sport',
      img:
          'https://static-sl.insales.ru/r/8Q-V5ZHenMk/rs:fit:420:420:1/plain/images/products/1/1261/254698733/large_%D0%9C%D0%B0%D0%B8%CC%86%D0%BA%D0%B0_%D0%B1%D0%B0%D1%81%D0%BA%D0%B5%D1%82%D0%B1%D0%BE%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F_%D0%BA%D1%83%D0%BF%D0%B8%D1%82%D1%8C_06.jpeg',
    ),
  ]);

  navigateCloth(ClothCategory cloth1) {
    if (cloth1.id == 1) {
      return tShirt;
    } else if (cloth1.id == 2) {
      return hoodie;
    } else if (cloth1.id == 3) {
      return sweater;
    } else if (cloth1.id == 4) {
      return undershirt;
    }
    notifyListeners();
  }

  openaligmen(index) {}
}

class ClothClass {
  List<Cloth> clothList;
  ClothClass({required this.clothList});
}
