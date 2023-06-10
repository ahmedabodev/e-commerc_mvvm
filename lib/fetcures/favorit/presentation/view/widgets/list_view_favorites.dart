import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/fetch_add_cart_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/const.dart';
import '../../../../home/presentation/view_model/fetch_product_revirpoid.dart';
import '../../view_model/fetch_get_favorite_revirpoid.dart';
import 'BodyFavoritesWidget.dart';

class ListViewFavorites extends StatelessWidget {
  const ListViewFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {

      final getFavorite=ref.watch(fetchGetFavoriteRevirpoid);
      final product=ref.watch(fetchProductRevirpoid);
      final addCart=ref.watch(fetchAddCartRevirpoid);
      final getCart=ref.watch(fetchGetCartRevirpoid);

      return Expanded(

        child: GridView.builder(

          itemCount: getFavorite.favorite.length,
          itemBuilder: (BuildContext context, int index) {
            var item=getFavorite.favorite[index];

            return BodyFavoritesWidget(
              index: index,
              favOnTapCancle: (){
                FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('favorite').doc(getFavorite.favorite[index].id).delete();
                product.getData();
                getFavorite.getData();

              },
              favorites: getFavorite.favoriteId,


              image:item.image ,
              cartOntap:(){
                addCart.addCart(
                  quality: 1,
                  price: item.price,
                  nameEn: item.nameEn,
                  nameAr: item.nameAr,
                  category: item.category,
                  cat: item.cat,
                  id: item.id,
                  image: item.image,
                );
                getCart.getData();
              } ,
              category:item.category ,
              nameEn:item.nameEn ,
              price:item.price ,

            );
          }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,

        ),),
      );
    },);
  }
}
