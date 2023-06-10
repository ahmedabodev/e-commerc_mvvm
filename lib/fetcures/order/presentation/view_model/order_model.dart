class OrderModel{
  dynamic state;
  List<String> productImage=[];
  List<String> productName=[];
  dynamic date;
  dynamic cost;
  dynamic payment;
  OrderModel.fromJson(Map<String,dynamic>json){
    state=json['state'];
    json['productImage'].forEach((element){
      productImage.add(element);
    });
    json['productName'].forEach((element){
      productName.add(element);
    });
    date=json['date'];
    cost=json['cost'];
    payment=json['payment'];
  }
}