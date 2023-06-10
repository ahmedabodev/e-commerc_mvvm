class CartModel{
  dynamic nameAr;
  dynamic nameEn;
  dynamic price;
  dynamic category;
  dynamic image;
  dynamic cat;
  dynamic id;
  dynamic quality;
  CartModel.fromJson(Map<String,dynamic>json){
    nameAr=json['nameAr'];
    nameEn=json['nameEn'];
    price=json['price'];
    category=json['category'];
    image=json['image'];
    cat=json['cat'];
    id=json['id'];
    quality=json['quality'];
  }
}
