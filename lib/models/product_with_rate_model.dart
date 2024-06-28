
class ProductWithRateModel {
  String productImage;
  String productDescription;
  double price;
  double priceAfterSale;
  double discount;
  double rate;


  ProductWithRateModel({
    required this.productImage,
    required this.productDescription,
    required this.price,
    required this.priceAfterSale,
    required this.discount,
    required this.rate
  });
}
