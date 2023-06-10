import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/style.dart';
import '../../view_model/fetch_product_revirpoid.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final category=ref.watch(fetchProductRevirpoid);
      return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: category.category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(onPressed: (){
              category.changeCategory(index);
            },
              style: TextButton.styleFrom(
                primary:(category.index==index)?ColorsApp.foucesColor: Colors.grey, // Text Color
              ),
              child:  Text(category.category[index],style: Styles.textStyle16,),
            );
          },),
      );
    },);
  }
}
