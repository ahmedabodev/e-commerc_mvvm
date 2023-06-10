import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/style.dart';

class BodyFavoritesWidget extends StatelessWidget {
  String image;
  String nameEn;
  String category;
  dynamic cartOntap;
  dynamic favOnTapCancle;
  int price;
  int index;
  List<dynamic> favorites;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shadowColor: Colors.blueGrey,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(image,
                  height: 79,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 5,),
              Text(nameEn,style: Styles.textStyle14,overflow: TextOverflow.ellipsis,maxLines: 1,),

              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(category,style: Styles.textStyle12.copyWith(
                      color: Colors.grey
                  )),
                  InkWell(
                      onTap:favOnTapCancle,
                      child:  const Icon(Icons.favorite,color:Colors.red,size: 18,)),
                  InkWell(
                      onTap: cartOntap,
                      child: Image.asset(Assetstring.cart,height: 18,color: Colors.blueGrey,)),

                  const SizedBox(width: 5,),

                ],
              ),
              const SizedBox(height: 5,),
              Text(price.toString(),style: Styles.textStyle14.copyWith(
                  color: ColorsApp.foucesColor
              ),textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }

  BodyFavoritesWidget({
    required this.image,
    required this.nameEn,
    required this.category,
    required this.cartOntap,
    required this.price,
    required this.favorites,
    required this.index,
    required this.favOnTapCancle,
  });
}
