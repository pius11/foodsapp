class MenuModel {
  int id;
  String image;
  String name;
  int price;
  int pricePromo;
  String note;
  bool isPromo;

  MenuModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.pricePromo,
    required this.note,
    required this.isPromo,
  });
}
