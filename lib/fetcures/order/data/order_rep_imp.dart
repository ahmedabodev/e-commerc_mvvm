
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';

import 'package:e_commerc_mvvm_revirpoid/fetcures/order/presentation/view_model/order_model.dart';

import '../../../core/utils/const.dart';
import 'order_rep.dart';

class OrderRepImp implements OrderRep{

  @override
  Future<Either<Failure, List<OrderModel>>> fetchGetOrder()async {
    List<OrderModel>order=[];

    dynamic error;
    try{
      order.clear();
      await  FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('order').get().then((value) {
        for (var element in value.docs) {
          order.add(OrderModel.fromJson(element.data()));
          print('kee'+order.toString());

        }

      }).catchError((e){
        print('ahmed'+e.toString());

        return error=e.code;
      });
      return Right(order);
    }catch(e){
      return left(ServerFailure(error.toString()));
    }
  }
  }


