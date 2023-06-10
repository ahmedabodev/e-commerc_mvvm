

import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/data/home_repo_imp.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final fetchCategoryRevirpoid=ChangeNotifierProvider<FetchCategoryRevirpoid>((ref) => FetchCategoryRevirpoid());
class FetchCategoryRevirpoid extends ChangeNotifier{
int index=0;
List<String>category=[
  'All',
  'Electronic',
  'Clothes',
];
changeCategory(value){
  index=value;
  notifyListeners();
}
}