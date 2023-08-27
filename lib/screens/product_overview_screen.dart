import 'package:flutter/material.dart';

//import '../models/product.dart';

//import '../widgets/product_item.dart';
import '../widgets/product_grid.dart';

enum productView { showFavorite, showAll }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
   
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shop App"),
          actions: <Widget>[
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              //itemBuilder: () {},
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: productView.showFavorite,
                    child: Text("Show Favorites"),
                  ),
                  PopupMenuItem(
                    value: productView.showAll,
                    child: Text("Show All"),
                  ),
                ];
              },
              onSelected: (selected) {
                //print(selected);
                setState(() {
                  if (selected == productView.showFavorite) {
                    isFavorite = true;
                  } else {
                    isFavorite = false;
                  }
                });
              },
            ),
          ],
        ),
        body: ProductGrid(
          isFavorite: isFavorite,
        ));
  }
}
