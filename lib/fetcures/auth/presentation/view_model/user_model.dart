

class UserModel{
  dynamic email;
  dynamic token;
  dynamic rules;
  dynamic photo;
  dynamic phone;
  dynamic name;
  dynamic id;
  UserModel.fromJson(Map<String,dynamic>json){
    email=json['email'];
    token=json['token'];
    rules=json['rules'];
    photo=json['photo'];
    phone=json['phone'];
    name=json['name'];
    id=json['id'];
  }
}