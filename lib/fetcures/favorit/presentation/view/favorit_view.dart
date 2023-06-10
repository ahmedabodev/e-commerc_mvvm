import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/presentation/view/widgets/list_view_favorites.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view_model/fetch_product_revirpoid.dart';
import 'package:flutter/material.dart';


class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          ListViewFavorites(),
        ],
      ),
    );
  }
}




