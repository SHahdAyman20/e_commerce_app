
class ProductCardModel{
  String productImage;
  String productDescription;
  double productPriceAfterSale;
  double productPriceBeforeSale;
  double discount;
  bool isFav= false;
  String category;
  String? brand='';
  String? color='';
  String? model='';
  String? type='';
  String? size='';



  ProductCardModel({
      required this.productImage,
      required this.productDescription,
      required this.productPriceAfterSale,
      required this.productPriceBeforeSale,
      required this.discount,
      required this.isFav,
    required this.category,
    this.size,this.brand,this.color,this.model,this.type

  });
}