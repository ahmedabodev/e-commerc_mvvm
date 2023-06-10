import 'package:e_commerc_mvvm_revirpoid/config/routes/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../favorit/presentation/view_model/fetch_get_favorite_revirpoid.dart';

class WidgetAppBarFavorites extends StatelessWidget {
  const WidgetAppBarFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final getFavorite=ref.watch(fetchGetFavoriteRevirpoid);
      return Badge(
isLabelVisible: (getFavorite.favorite.isEmpty)?false:true,
        label:          Text(getFavorite.favorite.length.toString()),

        child: IconButton(onPressed: (){
          Navigator.pushNamed(context, Routes.favoritesView);
        }, icon:const Icon(Icons.favorite,color: Colors.blueGrey,size: 30,)),
      );
    },);
  }
}
