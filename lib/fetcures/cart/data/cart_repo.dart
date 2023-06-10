import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';

import '../presentation/view_model/cart_model.dart';


abstract class CartRepo{
  Future<Either<Failure,dynamic>>fetchAddCart();
  Future<Either<Failure,List<CartModel>>>fetchGetCart();

}