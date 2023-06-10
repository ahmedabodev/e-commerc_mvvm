

import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/data/home_repo_imp.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
final fetchProductRevirpoid=ChangeNotifierProvider<FetchProductRevirpoid>((ref) => FetchProductRevirpoid(ProductRepoImpl()));
class FetchProductRevirpoid extends ChangeNotifier{
  FetchProductRevirpoid (this.productRepoImpl){
  getData();

  }
  int index=0;
  List<String>category=[
    'All',
    'Electronic',
    'Clothes',
    'Toys',
  ];


  changeCategory(value){
    index=value;
    getData();
    notifyListeners();
  }
  ScrollController scrollController = ScrollController();
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);
  void onRefresh() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    getData();

    refreshController.refreshCompleted();
  }

  void onLoading() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    getData();
    refreshController.loadComplete();
  }
  ProductRepoImpl productRepoImpl;
  Failure? failure;
  List<ProductModel>product=[];

  getData()async{
    Either<Failure,List<ProductModel>>result=await productRepoImpl.fetchProduct(category: category[index]);

    result.fold((fail) {
      failure=fail;
      print('ahmed'+failure.toString());

    }, (respons){
      print('saaaad'+respons.toString());
      product=respons;
      notifyListeners();

    });

    notifyListeners();
  }
}