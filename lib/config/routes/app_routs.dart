
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/login_view.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/signin_view.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view/cart_view.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view/checkout_view.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/presentation/view/favorit_view.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/order/presentation/view/order_view.dart';
import 'package:flutter/material.dart';

import '../../fetcures/home/presentation/view/home_view.dart';



// name  routes to navigator to any screen
class Routes {
  static const splashView = '/';
  static const login = '/login_view';
  static const homeView = '/home_view';
  static const orderComplete = '/orderComplete_view';
  static const favoritesView = '/favorites_view';
  static const checkOutView = '/checkOut_view';
  static const signInView = '/SignIn_view';
  static const detailsView = '/details_view';
  static const searchView = '/search_view';
  static const cartView = '/cart_view';
  static const orderView = '/order_view';
}


class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // name routes screen
      // case Routes.splashView:
      //   //navigator to this name
      //   return MaterialPageRoute(builder: (BuildContext context)=> const SplashView());
      case Routes.login:
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginView());
        case Routes.signInView:
        //navigator to this name
        return MaterialPageRoute(builder: (BuildContext context)=>  const SignInView());
        case Routes.homeView:
        //navigator to this name
        return MaterialPageRoute(builder: (BuildContext context)=>  const HomeView());
        case Routes.favoritesView:
        //navigator to this name
        return MaterialPageRoute(builder: (BuildContext context)=>  const FavoritesView());
        case Routes.cartView:
        //navigator to this name
        return MaterialPageRoute(builder: (BuildContext context)=>  const CartView());
case Routes.checkOutView:
        //navigator to this name
        return MaterialPageRoute(builder: (BuildContext context)=>  const CheckOutView());
        case Routes.orderComplete:
        //navigator to this name
        return MaterialPageRoute(builder: (BuildContext context)=>  const OrderComplete());
        case Routes.orderView:
        //navigator to this name
        return MaterialPageRoute(builder: (BuildContext context)=>  const OrderView());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
        body: Center(
          child: Text('Route not Found'),
        ),
      )),
    );
  }
}