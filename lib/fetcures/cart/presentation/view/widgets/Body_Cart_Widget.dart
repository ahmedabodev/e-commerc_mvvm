import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/cart_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/style.dart';

class BodyCartWidget extends StatelessWidget {
  String image;
  String nameEn;
  String category;
  dynamic cartOntap;
  dynamic favOnTapCancle;
  dynamic favOnTap;
  dynamic plus;
  dynamic min;
  dynamic delete;
  int price;
  String id;
  int quantity;
  int index;
  List<dynamic> favorites;
  List<CartModel> product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shadowColor: Colors.blueGrey,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(image,
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 5,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: delete,
                              child: const Icon(Icons.close,)),




                        ),

                        Text(nameEn,style: Styles.textStyle14,overflow: TextOverflow.ellipsis,maxLines: 1,),
                        const SizedBox(height: 5,),
                        Text(category,style: Styles.textStyle12.copyWith(
                            color: Colors.grey
                        )),
                        const SizedBox(height: 5,),
                        Row(

                          children: [
                            Text(price.toString(),style: Styles.textStyle14.copyWith(
                                color: ColorsApp.foucesColor
                            ),textAlign: TextAlign.center,),

                            // InkWell(
                            //     onTap:(favorites.contains(product[index].id)==true)?favOnTapCancle: favOnTap,
                            //     child:  Icon((favorites.contains(product[index].id)==true)?Icons.favorite:Icons.favorite_border,color:(favorites.contains(product[index].id)==true)?Colors.red:Colors.black,size: 23,)),

                          ],
                        ),


                      ],
                    ),
                    const SizedBox(height: 8,),
                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Container(
                            decoration:  BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children:  [
                                IconButton(onPressed:plus, icon: const Icon(Icons.add,size: 20)),
                                 Text(quantity.toString()),
                              IconButton(onPressed: (quantity==1)?(){}:min, icon: const Icon(Icons.remove,size: 20,))

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  BodyCartWidget({
    required this.image,
    required this.product,
    required this.favOnTap,
    required this.nameEn,
    required this.delete,
    required this.category,
    required this.id,
    required this.cartOntap,
    required this.price,
    required this.quantity,
    required this.plus,
    required this.min,
    required this.favorites,
    required this.index,
    required this.favOnTapCancle,
  });
}
