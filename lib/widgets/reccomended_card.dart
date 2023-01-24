import 'package:flutter/material.dart';
import 'package:foodsapp/model/menu.dart';
import 'package:foodsapp/modules/screan/detail-screen.dart';
import 'package:foodsapp/modules/utils/dimensions.dart';
import 'package:foodsapp/modules/utils/theme.dart';
import 'package:intl/intl.dart';

class ReccomendedCard extends StatelessWidget {
  final MenuModel menuModel;

  const ReccomendedCard(this.menuModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
                key,
                menuModel.id,
                menuModel.image,
                menuModel.name,
                menuModel.price,
                menuModel.pricePromo,
                menuModel.note,
                menuModel.isPromo),
          ),
        );
      },
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          menuModel.isPromo
                              ? Image.asset(
                                  "assets/Promo.png",
                                  width: 47,
                                  height: Dimensions.height20,
                                )
                              : Image.asset(
                                  "assets/Terlaris.png",
                                  width: 47,
                                  height: Dimensions.height20,
                                ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            menuModel.name,
                            style: poppinsTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: blackColor),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(menuModel.price),
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(menuModel.pricePromo),
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green.shade700),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Free Delivery",
                            style: poppinsTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey.shade800),
                          ),
                        ],
                      ),
                    ],
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
