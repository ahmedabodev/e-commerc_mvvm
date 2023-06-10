

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:flutter/cupertino.dart';

class AddAddress{

 static void addAddress({
    String? street,
    String? city,
    String? phone,
    String? country,
}){
    FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('address').doc(Strings.tokenId.read('token')).set({
      "street":street,
      "city":city,
      "phone":phone,
      "country":country,
    });
  }
}