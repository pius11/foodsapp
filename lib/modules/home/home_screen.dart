// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodsapp/controller/auth_controller.dart';
import 'package:foodsapp/model/menu.dart';
import 'package:foodsapp/modules/utils/dimensions.dart';
import 'package:foodsapp/modules/utils/theme.dart';
import 'package:foodsapp/widgets/reccomended_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    // CollectionReference products = firestore.collection('products');
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => authC.logout(),
                        icon: const Icon(Icons.logout_sharp),
                        iconSize: 30,
                      ),
                    ],
                  ),
                  Text(
                    'Hallo Customer',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    'Selamat datang di DUTA CAFFETARIA',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  //best seller
                  Text(
                    'Best Seller',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream:
                        products.orderBy('id', descending: false).snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: unnecessary_cast
                            children: (snapshot.data! as QuerySnapshot)
                                .docs
                                .map(
                                  (e) => ReccomendedCard(
                                    MenuModel(
                                      id: e['id'],
                                      image: e['image'],
                                      name: e['name'],
                                      price: e['price'],
                                      pricePromo: e['pricePromo'],
                                      note: e['note'],
                                      isPromo: e['isPromo'],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                        // best seller
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  Text(
                    'All Menu',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream:
                        products.orderBy('id', descending: false).snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: unnecessary_cast
                            children: (snapshot.data! as QuerySnapshot)
                                .docs
                                .map(
                                  (e) => ReccomendedCard(
                                    MenuModel(
                                      id: e['id'],
                                      image: e['image'],
                                      name: e['name'],
                                      price: e['price'],
                                      pricePromo: e['pricePromo'],
                                      note: e['note'],
                                      isPromo: e['isPromo'],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
