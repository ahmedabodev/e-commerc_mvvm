



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/data/repo/home_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config/routes/app_routs.dart';
import '../../data/cart_repo_imo.dart';
final fetchAddCartRevirpoid= ChangeNotifierProvider<FetchAddCartRevirpoid>((ref) => FetchAddCartRevirpoid(CartRepoImpl()));
class FetchAddCartRevirpoid extends ChangeNotifier{
  FetchAddCartRevirpoid(this.cartRepoImpl);
  final CartRepoImpl cartRepoImpl;
  Failure? failure;
  dynamic profile;
  dynamic userId;
  addCart({
    String? cat,
    String? id,
    int? price,
    String? nameEn,
    String? category,
    String? nameAr,
    String? image,
    int? quality,
  })async{
    Either<Failure,dynamic>result=await cartRepoImpl.fetchAddCart(
     category: category,
      cat: cat,
      id: id,
      image: image,
      nameAr: nameAr,
      nameEn: nameEn,
      price: price,
      quality: quality
    );
    result.fold((fail){
      print(fail.errMessage);
    }, (respons) {
      userId=  respons;
    });
    notifyListeners();
  }


}