class AddressModel{
  dynamic country;
  dynamic phone;
  dynamic city;
  dynamic street;
  AddressModel.fromJson(Map<String,dynamic>json){
    country=json['country'];
    phone=json['phone'];
  city=json['city'];
  street=json['street'];
  }
}