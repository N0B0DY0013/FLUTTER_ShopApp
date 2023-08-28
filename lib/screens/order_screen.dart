import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';

import '../widgets/order_tiles.dart';
import '../widgets/drawer.dart';

class OrderScreen extends StatelessWidget {

  const OrderScreen({super.key});

  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {

    final orderList = Provider.of<Order>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: ListView.builder(
        itemCount: orderList.orderCount,
        itemBuilder: (ctx, idx) {
          return OrderTiles(
            order: orderList.orders[idx],
          );
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
