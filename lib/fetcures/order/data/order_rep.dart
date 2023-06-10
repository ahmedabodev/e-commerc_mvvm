import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';

import '../presentation/view_model/order_model.dart';

abstract class OrderRep{
  Future<Either<Failure,List<OrderModel>>>fetchGetOrder();
}