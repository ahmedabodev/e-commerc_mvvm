

import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/cart_model.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/data/favorit_repo_imo.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/data/home_repo_imp.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data/order_rep_imp.dart';
import 'order_model.dart';

final fetchGetOrderRevirpoid=ChangeNotifierProvider<FetchGetOrderRevirpoid>((ref) => FetchGetOrderRevirpoid(OrderRepImp()));
class FetchGetOrderRevirpoid extends ChangeNotifier{
  FetchGetOrderRevirpoid(this.orderRepImp){
    getData();

  }



  OrderRepImp orderRepImp;
  Failure? failure;
  List<OrderModel>order=[];
  getData()async{
    Either<Failure,List<OrderModel>>result=await orderRepImp.fetchGetOrder();


    result.fold((fail) {
      failure=fail;
      print('ahmed'+failure.toString());

    }, (respons){
      order=respons;

      notifyListeners();

    });

    notifyListeners();
  }
}