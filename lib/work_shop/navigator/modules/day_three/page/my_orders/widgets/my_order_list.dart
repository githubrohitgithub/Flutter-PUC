import 'package:flutter/cupertino.dart';

import '../../../models/cart_model.dart';
import 'my_orders_item_widget.dart';

class MyOrderList extends StatefulWidget {


  final List<CartModel> listOfCartModel;

  const MyOrderList({super.key, required this.listOfCartModel});

  @override
  State<MyOrderList> createState() => _MyOrderListState();
}

class _MyOrderListState extends State<MyOrderList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listOfCartModel.length,
      itemBuilder: (BuildContext context, int index) {
        return MyOrdersItemWidget(
          image: widget.listOfCartModel[index].image ?? '',
          name: widget.listOfCartModel[index].name ?? '',
          subName: widget.listOfCartModel[index].subName ?? '',
          size: widget.listOfCartModel[index].size ?? '',
          quantity: widget.listOfCartModel[index].quantity ?? '3',
          price: widget.listOfCartModel[index].price.toString() ?? '450',
        );
      },
    );
  }
}
