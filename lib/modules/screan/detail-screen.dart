// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:foodsapp/model/size.dart';
import 'package:foodsapp/modules/utils/dimensions.dart';
import 'package:foodsapp/modules/utils/theme.dart';
import 'package:foodsapp/widgets/size_card.dart';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  int id;
  String image;
  String name;
  int price;
  int pricePromo;
  String note;
  bool isPromo;

  DetailScreen(
    Key? key,
    this.id,
    this.image,
    this.name,
    this.price,
    this.pricePromo,
    this.note,
    this.isPromo,
  ) : super(key: key);

  @override
  State<DetailScreen> createState() =>
      // ignore: no_logic_in_create_state
      _DetailScreen(id, image, name, price, pricePromo, note, isPromo);
}

class _DetailScreen extends State<DetailScreen> {
  // ignore: unused_field
  final int _id;
  final String _image;
  final String _name;
  final int _price;
  final int _pricePromo;
  final String _note;
  final bool _isPromo;

  _DetailScreen(
    this._id,
    this._image,
    this._name,
    this._price,
    this._pricePromo,
    this._note,
    this._isPromo,
  );

  late int dataPrice = _price; // data dari firebase
  late int dataPricePromo = _pricePromo; // data dari firebase

  int price = 00000;
  int pricePromo = 00000;

  int i = 1;
  bool isMini = true; // harga tetap
  bool isSedang = false; // harga sedang + 2000
  bool isBesar = false; // harga besar + 4000
  bool isSuperBesar = false; // harga super besar + 6000

  void _minus() {
    if (i > 1) {
      setState(() {
        i--;
        if (isMini == true) {
          price = dataPrice * i;
          pricePromo = dataPricePromo * i;
        } else if (isSedang == true) {
          price = (dataPrice + 2000) * i;
          pricePromo = (dataPricePromo + 2000) * i;
        } else if (isBesar == true) {
          price = (dataPrice + 4000) * i;
          pricePromo = (dataPricePromo + 4000) * i;
        } else if (isSuperBesar == true) {
          price = (dataPrice + 6000) * i;
          pricePromo = (dataPricePromo + 6000) * i;
        }
      });
    }
  }

  void _plus() {
    setState(() {
      i++;
      if (isMini == true) {
        price = dataPrice * i;
        pricePromo = dataPricePromo * i;
      } else if (isSedang == true) {
        price = (dataPrice + 2000) * i;
        pricePromo = (dataPricePromo + 2000) * i;
      } else if (isBesar == true) {
        price = (dataPrice + 4000) * i;
        pricePromo = (dataPricePromo + 4000) * i;
      } else if (isSuperBesar == true) {
        price = (dataPrice + 6000) * i;
        pricePromo = (dataPricePromo + 6000) * i;
      }
    });
  }

  void _clickMini() {
    setState(() {
      price = dataPrice * i;
      pricePromo = dataPricePromo * i;
      isMini = true;
      isSedang = false;
      isBesar = false;
      isSuperBesar = false;
    });
  }

  void _clickSedang() {
    setState(() {
      price = (dataPrice + 2000) * i;
      pricePromo = (dataPricePromo + 2000) * i;
      isMini = false;
      isSedang = true;
      isBesar = false;
      isSuperBesar = false;
    });
  }

  void _clickBesar() {
    setState(() {
      price = (dataPrice + 4000) * i;
      pricePromo = (dataPricePromo + 4000) * i;
      isMini = false;
      isSedang = false;
      isBesar = true;
      isSuperBesar = false;
    });
  }

  void _clickSuperBesar() {
    setState(() {
      price = (dataPrice + 6000) * i;
      pricePromo = (dataPricePromo + 6000) * i;
      isMini = false;
      isSedang = false;
      isBesar = false;
      isSuperBesar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      launch(url);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              _image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20,
                  horizontal: Dimensions.width20),
            ),
            ListView(
              children: [
                SizedBox(height: Dimensions.pageView),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height30,
                            horizontal: Dimensions.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isPromo
                                ? Image.asset(
                                    "assets/Promo.png",
                                    width: 60,
                                  )
                                : Image.asset(
                                    "assets/Terlaris.png",
                                    width: 60,
                                  ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              _name,
                              style: poppinsTextStyle.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor),
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: _minus,
                                  child: Image.asset(
                                    "assets/Minus.png",
                                    width: 34,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width15,
                                ),
                                Text(
                                  "$i",
                                  style: poppinsTextStyle.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: blackColor),
                                ),
                                SizedBox(
                                  width: Dimensions.width15,
                                ),
                                InkWell(
                                  onTap: _plus,
                                  child: Image.asset(
                                    "assets/Plus.png",
                                    width: 34,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0,
                                  ).format(price),
                                  style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: greyColor,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0,
                                  ).format(pricePromo),
                                  style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Text(
                              "Pilih Ukuran",
                              style: poppinsTextStyle.copyWith(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              children: [
                                InkWell(
                                  onTap: _clickMini,
                                  child: SizeCard(
                                    Size(
                                      id: 1,
                                      name: "Mini",
                                      isActive: isMini,
                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10),
                                InkWell(
                                  onTap: _clickSedang,
                                  child: SizeCard(
                                    Size(
                                      id: 2,
                                      name: "Sedang",
                                      isActive: isSedang,
                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10),
                                InkWell(
                                  onTap: _clickBesar,
                                  child: SizeCard(
                                    Size(
                                      id: 3,
                                      name: "Besar",
                                      isActive: isBesar,
                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10),
                                InkWell(
                                  onTap: _clickSuperBesar,
                                  child: SizeCard(
                                    Size(
                                      id: 4,
                                      name: "Super Besar",
                                      isActive: isSuperBesar,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height20),
                            Text(
                              "Catatan Penjual",
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            SizedBox(height: Dimensions.height10),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                _note,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greyColor,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(height: Dimensions.height20),
                            Text(
                              "Lokasi DUTA CAFFETARIA",
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            SizedBox(height: Dimensions.height10),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    "https://goo.gl/maps/rnVZCMyRyHju9mo59");
                              },
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/Img_store.png",
                                          width: Dimensions.width45,
                                        ),
                                        SizedBox(width: Dimensions.width20),
                                        Text(
                                          "Jl Wisnu Marga\nDesa Belayu",
                                          style: poppinsTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: greyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.chevron_right,
                                        color: greyColor,
                                        size: Dimensions.iconSize30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: Dimensions.height30),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                ),
                                elevation: 0,
                                focusElevation: 0,
                                hoverElevation: 0,
                                highlightElevation: 0,
                                color: Colors.purple,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Dimensions.height15),
                                  child: Text(
                                    "Beli",
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  launchUrl(
                                      "https://wa.me/6287860346608?text=saya%20ingin%20membeli%20$_name%20(%20$i%20Biji%20=%20Rp%20$pricePromo%20)%0ANama%3A%0AAlamat%3A%0ATolong%20di%20antar%20ya");
                                },
                                //https://wa.me/6282359342559?text=Saya%20ingin%20membeli%20$_name%20(%20$i%20Biji%20=%20Rp%20$pricePromo%20)
                                // https://wa.me/6287860346608?text=saya%20ingin%20membeli%20$_name%20(%20$i%20Biji%20=%20Rp%20$pricePromo%20)%0Adata%20saya%0ANama%3A%0AAlamat%3A%0ATolong%20di%20antar%20ya
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
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20,
                  horizontal: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
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
}
