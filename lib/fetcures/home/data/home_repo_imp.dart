import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';

import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';
import 'package:flutter/cupertino.dart';

import '../presentation/view_model/fetch_product_revirpoid.dart';
import 'home_repo.dart';

class ProductRepoImpl  implements ProductRepo{
  @override
  Future<Either<Failure, List<ProductModel>>> fetchProduct({
    String? category
})async {

    dynamic error;
    List<ProductModel>product=[];
   try{
      await FirebaseFirestore.instance.collection('products').where((category=='All')?'cat':'category',isEqualTo:category ).get().then((value){
        product.clear();
        value.docs.forEach((element) {
          product.add(ProductModel.fromJson(element.data()));

        });




        print('boohoo$product');

     }).catchError((e){
       return error=e.code;

     });

     return Right(product);
   }catch(e){
     return  left(ServerFailure(error.toString()));

   }


  }


}