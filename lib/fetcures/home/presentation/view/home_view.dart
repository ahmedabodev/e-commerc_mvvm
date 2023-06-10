
import 'package:e_commerc_mvvm_revirpoid/config/routes/app_routs.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/assets.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/custom_button_widget.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view_model/fetch_user_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/data/CheckOutrepo_impl.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_visa_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view/widget/list_view_category.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view/widget/list_view_product.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view/widget/widget_appbar_cart.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view/widget/widget_appbar_favorties.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view/widget/widget_appbar_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/view_model/fetch_sign_out_revirpoid.dart';
import '../../../cart/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import '../../../favorit/presentation/view_model/fetch_get_favorite_revirpoid.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions:  const [
          WidgetAppBarFavorites(),
          WidgetAppBarCart(),

        ],
        title:const WidgetAppBarTitle(),
        centerTitle: true,

      ),
      drawer: Drawer(
        backgroundColor: ColorsApp.drawerColor,
        width: MediaQuery.of(context).size.width/1.5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        ),
        child:const  DrawerWidget(),
      ),
      body: Column(
        children: const [
          ListViewCategory(),
          ListViewProduct(),
        ],
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final profile=ref.watch(fetchUserReviripoid);

      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:(profile.user!.photo==null)?Image.asset(Assetstring.profile,height: 50,): Image.network(profile.user!.photo.toString(),

            height: 50,
          ),
        ),
                title:              Text(profile.user!.name,style: Styles.textStyle14.copyWith(
                    color: Colors.white
                ),),
                subtitle:   Text(profile.user!.rules,style: Styles.textStyle14.copyWith(
                    color: Colors.white
                ),),
              ),
              const SizedBox(height: 30,),
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, Routes.orderView);

                },
                leading: Image.asset(Assetstring.orderIcon,height: 30,),
                title:Text('Order',style: Styles.textStyle16.copyWith(
                    color: Colors.white
                ),),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  height: 1,
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person,size:30,color: Colors.white,),
                title:Text('Profile',style: Styles.textStyle16.copyWith(
                    color: Colors.white
                ),),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  height: 1,
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.location_on,size:30,color: Colors.white,),
                title:Text('Address',style: Styles.textStyle16.copyWith(
                    color: Colors.white
                ),),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  height: 1,
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.payment,size:30,color: Colors.white,),
                title:Text('Visa',style: Styles.textStyle16.copyWith(
                    color: Colors.white
                ),),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  height: 1,
                  color: Colors.blueGrey,
                ),
              ),
              Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                 var getVisa=ref.watch(fetchGetVisaRevirpoid);
                final signOut=ref.watch(fetchSignOutRevirpoid);
                return                  ListTile(
                  onTap: (){
                    Phoenix.rebirth(context);

                    signOut.signOut();

                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);

                  },
                  leading:    const Icon(Icons.logout,color: Colors.white,size: 30,),
                  title:Text('LogOut',style: Styles.textStyle16.copyWith(
                      color: Colors.white
                  ),),

                );

              },),
            ],
          ),
        ),
      );
    },);
  }
}
