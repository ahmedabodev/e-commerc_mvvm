

import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/cart_model.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/data/favorit_repo_imo.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/data/home_repo_imp.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data/cart_repo_imo.dart';
final fetchGetCartRevirpoid=ChangeNotifierProvider<FetchGetCartRevirpoid>((ref) => FetchGetCartRevirpoid.FetchGetCartRevirpoid(CartRepoImpl()));
class FetchGetCartRevirpoid extends ChangeNotifier{
  FetchGetCartRevirpoid.FetchGetCartRevirpoid (this.cartRepoImpl){
    getData();

  }


  List<int>total=[];

  CartRepoImpl cartRepoImpl;
  Failure? failure;
  List<CartModel>cart=[];
  List<dynamic>cartId=[];
  List<dynamic>images=[];
  List<dynamic>productName=[];
  getData()async{
    Either<Failure,List<CartModel>>result=await cartRepoImpl.fetchGetCart();


    result.fold((fail) {
      failure=fail;
      print('ahmed'+failure.toString());

    }, (respons){
      cart=respons;

      cartId=cartRepoImpl.cartId;
      total=cartRepoImpl.total;
      productName=cartRepoImpl.productName;
      images=cartRepoImpl.images;
      print('swrrr'+cartId.toString());
      notifyListeners();

    });

    notifyListeners();
  }
}