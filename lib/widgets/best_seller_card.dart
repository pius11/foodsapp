import 'package:flutter/material.dart';
import 'package:foodsapp/model/menu.dart';
import 'package:foodsapp/modules/utils/dimensions.dart';

class BestSellerCard extends StatelessWidget {
  final MenuModel menuModel;

  const BestSellerCard(this.menuModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => DetailScreen(
      //           key,
      //           menuModel.id,
      //           menuModel.image,
      //           menuModel.name,
      //           menuModel.price,
      //           menuModel.pricePromo,
      //           menuModel.note,
      //           menuModel.isPromo),
      //     ),
      //   );
      // },
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    child: SizedBox(
                      width: 130,
                      height: 110,
                      child: Image.network(
                        menuModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
