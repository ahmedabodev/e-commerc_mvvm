import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc_mvvm_revirpoid/config/routes/app_routs.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/assets.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/custom_button_widget.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_address_revirpoid.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../order/presentation/view_model/getorder_reviepoid.dart';
import '../view_model/change_screen_stepper_revirpoid.dart';
import 'package:collection/collection.dart';

import '../view_model/fetch_visa_revirpoid.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final steeper=ref.watch(changeScreenSteeperRevirpoid);

        return Column(
         children: [
        EasyStepper(
           activeStep: steeper.index,
           lineLength: 70,
           stepShape: StepShape.rRectangle,
           stepBorderRadius: 15,
           borderThickness: 2,
           padding: 20,
           stepRadius: 28,
           finishedStepBorderColor: Colors.deepOrange,
           finishedStepTextColor: Colors.deepOrange,
           finishedStepBackgroundColor: Colors.deepOrange,
           activeStepIconColor: Colors.deepOrange,
           loadingAnimation: 'images/loading_black.json',
           steps: const [
             EasyStep(
               icon: Icon(Icons.map),
               title: 'Address',
             ),
             EasyStep(
               icon: Icon(Icons.payment),
               title: 'Payment',
             ),
             EasyStep(
               icon: Icon(Icons.local_shipping_rounded),
               title: 'Shipping',
             ),

           ],
           onStepReached: (index) {}),
           steeper.screens[steeper.index],
         ],
       );
      },),
    );
  }
}

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView(
        children:  const [
          CartOrderWidget(),
          SizedBox(height: 30,),
          AddressOrderWidget(),
          SizedBox(height: 30,),
          PaymentOrderWidget(),


        ],
      ),
    );
  }
}
class CartOrderWidget extends StatelessWidget {
  const CartOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final cart=ref.watch(fetchGetCartRevirpoid);
      return         SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cart.cart.length,

          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                elevation: 5,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        child: Image.network(cart.cart[index].image,height: 100,)),
                    const SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(cart.cart[index].nameEn,),
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            Text(cart.cart[index].price.toString(),style: Styles.textStyle14.copyWith(
                                color: ColorsApp.foucesColor
                            ),),
                            const SizedBox(width: 8,),

                            Text('x${cart.cart[index].quality}',style: Styles.textStyle14.copyWith(
                                color: ColorsApp.foucesColor
                            ),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 8,),

                  ],
                ),
              ),
            );
          }, ),
      );
    },);
  }
}
class AddressOrderWidget extends StatelessWidget {
  const AddressOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final getAddress=ref.watch(fetchGetAddressRevirpoid);
      final steeper=ref.watch(changeScreenSteeperRevirpoid);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const  Text('Shipping Address',style: Styles.textStyle16,),
            const SizedBox(height: 8,),
            (getAddress.address.isEmpty)?const SizedBox(): Text('${getAddress.address[0].street+' , '+getAddress.address[0].city+' , '+getAddress.address[0].country}',style: Styles.textStyle12,maxLines: 2,),
            const SizedBox(height: 8,),

            InkWell(
      onTap: (){
        steeper.changeIndex(0);
      },
              child: Text('Change',style: Styles.textStyle14.copyWith(
                  color: ColorsApp.foucesColor
              ),
              ),
            ),
          ],
        ),
      );
    },);
  }
}
class PaymentOrderWidget extends StatelessWidget {
  const PaymentOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return          Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final getVisa=ref.watch(fetchGetVisaRevirpoid);



      return (getVisa.visaModel==null)?const SizedBox(): Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const  Text('Payment',style: Styles.textStyle16,),
            const SizedBox(height: 8,),
            Row(
              children: [
                Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final payment=ref.watch(changeScreenSteeperRevirpoid);

                  return (payment.checkIndex==1)?
                  Row(
                    children: [
                      Image.asset(Assetstring.visa,height: 50,),
                      const SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text('Visa',style: Styles.textStyle12.copyWith(
                              color: Colors.black54
                          ),maxLines: 2,),

                          Text('**** **** **** ${getVisa.visaModel!.cardNumber.substring(18, 22)}',style: Styles.textStyle12,maxLines: 2,),
                        ],
                      ),
                    ],
                  ):Row(

                    children: [
                      Image.asset(Assetstring.cashMoney,height: 40,),
                      const SizedBox(width: 8,),
                      const Text('Cash Money'),
                    ],
                  );
                },),

                const Spacer(),
                Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final getPrice=ref.watch(fetchGetCartRevirpoid);
                  return Text('Total= ${getPrice.total.sum}');
                },),
                const Spacer(),

              ],
            ),
            const SizedBox(height: 8,),
           Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
             final steeper=ref.watch(changeScreenSteeperRevirpoid);
             final getCart=ref.watch(fetchGetCartRevirpoid);

             return  InkWell(
               onTap: (){
                 steeper.changeIndex(1);
               },
               child: Text('Change',style: Styles.textStyle14.copyWith(
                   color: ColorsApp.foucesColor
               ),
               ),
             );
           },),
            const SizedBox(height: 30,),
            Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final steeper=ref.watch(changeScreenSteeperRevirpoid);
              final getCart=ref.watch(fetchGetCartRevirpoid);
              final getOrder=ref.watch(fetchGetOrderRevirpoid);

              return    Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonWidget(
                      title: const Text('Back',style: Styles.textStyle14,),
                      onPressed: (){
                        steeper.changeIndex(steeper.index-1);

                      },
                      minWidth: MediaQuery.of(context).size.width/2.5,
                      color: ColorsApp.foucesColor),
                  CustomButtonWidget(
                      title: const Text('Pay',style: Styles.textStyle14,),
                      onPressed: (){
                        Navigator.of(context).pushNamedAndRemoveUntil(Routes.orderComplete, (route) => false);
                        steeper.changeIndex(0);

                        FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('order').add({
                          'date':DateFormat.yMd().add_jm().format(DateTime.now()).toString(),
                          'cost':getCart.total.sum,
                          'productImage':getCart.images,
                          'productName':getCart.productName,
                          'state':'UnComplete',
                          'payment':(steeper.checkIndex==0)?'Cash Money':'Visa',
                        }).then((value) {

                          getCart.getData();
                          getOrder.getData();

                        });
                        FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('cart').get().then((value) {
                          value.docs.forEach((element) {
                            element.reference.delete();
                          });

                        }).then((value) {

                          getCart.getData();

                        });

                        print(steeper.index.toString());

                      },
                      minWidth: MediaQuery.of(context).size.width/2.5,
                      color: ColorsApp.foucesColor),
                ],
              );
            },),

          ],
        ),
      );
    },);
  }
}
class OrderComplete extends StatelessWidget {
  const OrderComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70,),
          Center(child: Image.asset(Assetstring.order,height: 250,)),
          const Text('Order Accepted',style: Styles.textStyleGT,),
          const SizedBox(height: 20,),
          CustomButtonWidget(title: const Text('Go Home',style: Styles.textStyle14,), onPressed: (){
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.homeView, (route) => false);

          },
              minWidth: MediaQuery.of(context).size.width/2, color: ColorsApp.foucesColor)

        ],
      ),
    );
  }
}
