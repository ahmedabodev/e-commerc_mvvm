import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';

import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';

import '../presentation/view_model/cart_model.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo{
  List<dynamic>cartId=[];
  List<int>total=[];
  List<dynamic>images=[];
  List<dynamic>productName=[];

  @override
  Future<Either<Failure,dynamic>> fetchAddCart({
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
      await FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('cart').doc(id).set(
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
  Future<Either<Failure, List<CartModel>>> fetchGetCart()async {
    dynamic error;
    List<CartModel>cart=[];
    try{
      cartId.clear();
      total.clear();
      productName.clear();
      images.clear();
     await  FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('cart').get().then((value) {
       for (var element in value.docs) {
         cartId.add(element.id);
         cart.add(CartModel.fromJson(element.data()));
         total.add(element.data()['price']*element.data()['quality']);
         images.add(element.data()['image']);
         productName.add(element.data()['nameEn']);

       }

     }).catchError((e){
       return error=e.code;
     });
     return Right(cart);
   }catch(e){
    return left(ServerFailure(error.toString()));
   }
  }

}