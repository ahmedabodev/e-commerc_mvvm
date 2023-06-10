import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_address_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_visa_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/presentation/view_model/fetch_add_favorite_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/const.dart';
import '../../../../home/presentation/view_model/fetch_product_revirpoid.dart';
import '../../view_model/fetch_get_favorite_revirpoid.dart';
import 'Body_Cart_Widget.dart';

class ListViewCart extends StatelessWidget {
  const ListViewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {

      final getCart=ref.watch(fetchGetCartRevirpoid);
      final getFavorites=ref.watch(fetchGetFavoriteRevirpoid);

      final addFavorites=ref.watch(fetchAddFavoritesRevirpoid);
      final product=ref.watch(fetchProductRevirpoid);
      List<int>total=[];

      return Expanded(

        child: ListView.builder(

          itemCount: getCart.cart.length,
          itemBuilder: (BuildContext context, int index) {
            var item=getCart.cart[index];
            total.add(item.quality*item.price);
            return BodyCartWidget(
              delete: (){
                FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('cart').doc(item.id).delete();
                getCart.getData();
              },
              id: item.id,
              plus: (){
                FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('cart').doc(item.id).update({
                  'quality':item.quality+1
                });
                getCart.getData();

              },
              min: (){
                FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('cart').doc(item.id).update({
                  'quality':item.quality-1
                });
                getCart.getData();

              },
              quantity: item.quality,
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
                product.getData();
                getCart.getData();
                getFavorites.getData();
              },
              product: getCart.cart,
              index: index,
              favOnTapCancle: (){
                FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('favorite').doc(getCart.cart[index].id).delete();
                product.getData();
                getCart.getData();
                getFavorites.getData();

              },
              favorites: getFavorites.favoriteId,


              image:item.image ,
              cartOntap:(){} ,
              category:item.category ,
              nameEn:item.nameEn ,
              price:item.price ,

            );
          },),
      );
    },);
  }
}
