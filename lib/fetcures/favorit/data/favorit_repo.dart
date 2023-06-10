import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';

import '../../home/presentation/view_model/product_model.dart';

abstract class FavoriteRepo{
  Future<Either<Failure,dynamic>>fetchAddFavorite();
  Future<Either<Failure,List<ProductModel>>>fetchGetFavorite();

}