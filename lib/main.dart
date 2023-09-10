import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/product_overview_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/order_screen.dart';
import 'screens/user_product_screen.dart';

import 'providers/product_list.dart';
import 'providers/cart.dart';
import 'providers/order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) {
            return ProductList();               //Product data listeners ...
          },
        ),
        ChangeNotifierProvider(create: (ctx) {
          return Cart();                        //Cart data listeners ....
        }),
        ChangeNotifierProvider(create: (ctx) { //Order data listeners ....
          return Order();
        })
      ],
      child: MaterialApp(
        home: const ProductOverviewScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        routes: {
          ProductDetailScreen.routeName: (ctx) {
            return const ProductDetailScreen();
          },
          CartScreen.routeName: (ctx) {
            return const CartScreen();
          },
          OrderScreen.routeName: (ctx) {
            return const OrderScreen();
          },
          UserProductScreen.routeName: (ctx) {
            return const UserProductScreen();
          }
        },
        //title: "Shop App",
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Shop App"),
//       ),
//       body: const Center(
//         child: Text("Hello World"),
//       ),
//     );
//   }
// }
