import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';

abstract class ProductRepo{
  Future<Either<Failure,List<ProductModel>>>fetchProduct();
}