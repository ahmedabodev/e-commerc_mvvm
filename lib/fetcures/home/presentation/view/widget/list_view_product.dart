import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/fetch_add_cart_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../favorit/presentation/view_model/fetch_add_favorite_revirpoid.dart';
import '../../../../favorit/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import '../../view_model/fetch_product_revirpoid.dart';
import 'body_product_widget.dart';

class ListViewProduct extends StatelessWidget {
  const ListViewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final product=ref.watch(fetchProductRevirpoid);
      final addFavorites=ref.watch(fetchAddFavoritesRevirpoid);
      final addCart=ref.watch(fetchAddCartRevirpoid);
      final getFavorite=ref.watch(fetchGetFavoriteRevirpoid);
      final getCart=ref.watch(fetchGetCartRevirpoid);

      return Expanded(

        child: SmartRefresher(
          controller: product.refreshController,
          onRefresh: product.onRefresh,
          onLoading: product.onLoading,
          enablePullDown: true,

          child: GridView.builder(
            controller:product.scrollController ,

            itemCount: product.product.length,
            itemBuilder: (BuildContext context, int index) {
              var item=product.product[index];

              return BodyProductWidget(
                index: index,
                favOnTapCancle: (){
                  FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('favorite').doc(product.product[index].id).delete();
                  getFavorite.getData();

                },
                favorites: getFavorite.favoriteId,
                product: product.product,

                favOnTap: (){
                  addFavorites.addFavorite(
                    quality: 1,
                    price: item.price,
                    nameEn: item.nameEn,
                    nameAr: item.nameAr,
                    category: item.category,
                    cat: item.cat,
                    id: item.id,
                    image: item.image,
                  );
                  getFavorite.getData();
                },
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


        ),
      );
    },);
  }
}
