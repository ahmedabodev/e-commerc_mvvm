import 'package:flutter/material.dart';

import 'widgets/list_view_cart.dart';
import 'widgets/total_widget.dart';


class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          ListViewCart(),
          TotalWidget(),
        ],
      ),
    );
  }
}




