

import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/data/favorit_repo_imo.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/data/home_repo_imp.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
final fetchGetFavoriteRevirpoid=ChangeNotifierProvider<FetchGetFavoriteRevirpoid>((ref) => FetchGetFavoriteRevirpoid.FetchGetFavoriteRevirpoid(FavoriteRepoImpl()));
class FetchGetFavoriteRevirpoid extends ChangeNotifier{
  FetchGetFavoriteRevirpoid.FetchGetFavoriteRevirpoid (this.favoriteRepoImpl){
    getData();

  }



  FavoriteRepoImpl favoriteRepoImpl;
  Failure? failure;
  List<ProductModel>favorite=[];
  List<dynamic>favoriteId=[];

  getData()async{
    Either<Failure,List<ProductModel>>result=await favoriteRepoImpl.fetchGetFavorite();


    result.fold((fail) {
      failure=fail;
      print('ahmed'+failure.toString());

    }, (respons){
      favorite=respons;
      favoriteId=favoriteRepoImpl.favorite1;
      print('swrrr'+favoriteId.toString());
      notifyListeners();

    });

    notifyListeners();
  }
}