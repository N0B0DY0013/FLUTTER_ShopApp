import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/product_overview_screen.dart';
import 'screens/product_detail_screen.dart';

import 'providers/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) {
        return ProductList();
      },
      child: MaterialApp(
        home: const ProductOverviewScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        routes: {
          ProductDetailScreen.routeName: (ctx) {
            return const ProductDetailScreen();
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
