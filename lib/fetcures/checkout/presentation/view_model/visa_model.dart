class VisaModel{
  dynamic expiredData;
  dynamic cvv;
  dynamic cardNumber;
  dynamic cardName;
  VisaModel.fromJson(Map<String,dynamic>json){
    expiredData=json['expiredData'];
    cvv=json['cvv'];
    cardNumber=json['cardNumber'];
    cardName=json['cardName'];
  }
}
