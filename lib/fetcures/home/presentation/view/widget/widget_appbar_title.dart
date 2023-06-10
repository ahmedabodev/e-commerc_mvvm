import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view_model/fetch_user_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetAppBarTitle extends StatelessWidget {
  const WidgetAppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         Consumer(builder: (BuildContext context,  ref, Widget? child) {
      final user=ref.watch(fetchUserReviripoid);
      return  (user.user==null)?const SizedBox():  Text(user.user!.name.toString());
    },);
  }
}
