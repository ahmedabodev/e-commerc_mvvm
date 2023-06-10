import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';

import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';

import 'favorit_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo{
  List<dynamic>favorite1=[];

  @override
  Future<Either<Failure,dynamic>> fetchAddFavorite({
    String? cat,
    String? id,
    int? price,
    String? nameEn,
    String? category,
    String? nameAr,
    String? image,
    int? quality,
  }) async{
   dynamic error;
   dynamic data;
    try{
      await FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('favorite').doc(id).set(
          {
            'cat':cat,
            'id':id,
            'category':category,
            'price':price,
            'nameEn':nameEn,
            'nameAr':nameAr,
            'image':image,
            'quality':quality,

          }).catchError((e){
        return error=e.code;
      });
      return Right(data);
   }catch(e){
      return  left(ServerFailure(error.toString()));
   }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchGetFavorite()async {
    dynamic error;
    List<ProductModel>favorite=[];
    try{
      favorite1.clear();
     await  FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('favorite').get().then((value) {
       for (var element in value.docs) {
         favorite1.add(element.id);
         favorite.add(ProductModel.fromJson(element.data()));
       }

     }).catchError((e){
       return error=e.code;
     });
     return Right(favorite);
   }catch(e){
    return left(ServerFailure(error.toString()));
   }
  }

}