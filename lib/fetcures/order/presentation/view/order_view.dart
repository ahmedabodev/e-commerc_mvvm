import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/getorder_reviepoid.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final getOrder=ref.watch(fetchGetOrderRevirpoid);
            return Expanded(
              child: ListView.builder(
                itemCount: getOrder.order.length,
                itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.center,
              children: [
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getOrder.order[index].productImage.length,

                        itemBuilder: (BuildContext context, int index2) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Image.network(getOrder.order[index].productImage[index2],height: 50,),
                              Text(getOrder.order[index].productName[index2],style: Styles.textStyle14,),
                            ],
                          ),
                        );
                      },),
                    ),
              const Divider(color: Colors.grey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(getOrder.order[index].state.toString(),style: Styles.textStyle14,),
                    Text('${getOrder.order[index].cost} \$',style: Styles.textStyle14,),
                  ],
                ),
                const Divider(color: Colors.grey,),

                Text(getOrder.order[index].date.toString(),style: Styles.textStyle14,),
                const Divider(color: Colors.grey,),

                Text(getOrder.order[index].payment.toString(),style: Styles.textStyle14,),

              ],
                    ),
                  ),
                );
              },),
            );
          },)
        ],
      ),
    );
  }
}
