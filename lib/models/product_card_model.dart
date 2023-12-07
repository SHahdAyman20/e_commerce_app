
class ProductCardModel{
  String productImage;
  String productDescription;
  double productPriceAfterSale;
  double productPriceBeforeSale;
  double discount;
  bool isFav= false;
  String category;


  ProductCardModel({
      required this.productImage,
      required this.productDescription,
      required this.productPriceAfterSale,
      required this.productPriceBeforeSale,
      required this.discount,
      required this.isFav,
    required this.category

  });
}