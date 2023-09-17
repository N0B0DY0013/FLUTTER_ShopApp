import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_list.dart';

import '../providers/product.dart';

class EditProduct extends StatefulWidget {
  static const routeName = "/edit-product";

  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imgURLNode = FocusNode();

  final _imgURLController = TextEditingController();

  final _form = GlobalKey<FormState>();

  var _isInit = true;
  var page_args = {};

  var _edittedProduct = Product(
      id: "",
      title: "",
      description: "",
      price: 0,
      imageUrl: "",
      isFavorite: false);

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if (_isInit) {
      page_args =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      if (page_args["type"] == "existing") {
        final existingProduct = Provider.of<ProductList>(context, listen: false)
            .getProductByID(page_args["prodId"] ?? "");
        _edittedProduct = existingProduct;

        _imgURLController.text = _edittedProduct.imageUrl;
      } else {
        _edittedProduct = Product(
            id: UniqueKey().toString(),
            title: "",
            description: "",
            price: 0.00,
            imageUrl: "");

        _imgURLController.text = "https://i.pinimg.com/originals/cf/0b/be/cf0bbe0e35bc5f92b10045852f87bb11.jpg";
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _imgURLNode.addListener(_updateImageURL);
    super.initState();
  }

  @override
  void dispose() {
    _imgURLNode.removeListener(_updateImageURL);

    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imgURLNode.dispose();
    _imgURLController.dispose();
    super.dispose();
  }

  void _updateImageURL() {
    if (!_imgURLNode.hasFocus) {
      setState(() {
        //just call so to update ...
      });
    }
  }

  void _updateProductInfo(
      {String title = "",
      String description = "",
      double price = 0.00,
      String imgURL = ""}) {
    _edittedProduct = Product(
        id: _edittedProduct.id,
        isFavorite: _edittedProduct.isFavorite,
        title: title.isEmpty ? _edittedProduct.title : title,
        description:
            description.isEmpty ? _edittedProduct.description : description,
        price: price == 0.0 ? _edittedProduct.price : price,
        imageUrl: imgURL.isEmpty ? _edittedProduct.imageUrl : imgURL);

    //_form.currentState!.save();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();

      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Are you sure?"),
            content:  Text(page_args["type"] == "new" ? "Do you want to add this new product?": "Do you want to update this existing product?"),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No"),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.orange[900],
                    foregroundColor: Colors.white,
                  ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  if (page_args["type"] == "new") {
                    Provider.of<ProductList>(context, listen: false).insertProduct(_edittedProduct);
                  } else {
                    Provider.of<ProductList>(context, listen: false).updateProduct(_edittedProduct);
                  }

                  Navigator.pop(context);
                },
                child: const Text("Yes"),
              ),
            ],
          );
        },
      );

      // Navigator.pop(context);
    }
    //print({_edittedProduct.title, _edittedProduct.description, _edittedProduct.price, _edittedProduct.imageUrl});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( (page_args["type"] == "new") ? "Add New Product": "Edit Product"),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextFormField(
                initialValue: _edittedProduct.title,
                decoration: const InputDecoration(
                  labelText: "Product Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a Product Name.";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  return FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (newValue) {
                  return _updateProductInfo(title: newValue!);
                },
              ),
              TextFormField(
                initialValue: _edittedProduct.price.toString(),
                decoration: const InputDecoration(
                  labelText: "Price",
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return "Please enter a price";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onSaved: (newValue) {
                  return _updateProductInfo(price: double.parse(newValue!));
                },
              ),
              TextFormField(
                initialValue: _edittedProduct.description,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a Description";
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  return FocusScope.of(context)
                      .requestFocus(_descriptionFocusNode);
                },
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (newValue) {
                  return _updateProductInfo(description: newValue!);
                },
              ),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imgURLController.text.isEmpty
                        ? const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Please enter a URL below",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : FittedBox(
                            child: Image.network(
                              _imgURLController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  TextFormField(
                    //initialValue: _edittedProduct.imageUrl,
                    decoration: const InputDecoration(
                      labelText: "Image URL",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter an Image URL";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                    focusNode: _imgURLNode,
                    controller: _imgURLController,
                    onEditingComplete: () {
                      setState(() {});
                    },
                    onFieldSubmitted: (_) {
                      _saveForm();
                    },
                    onSaved: (newValue) {
                      return _updateProductInfo(imgURL: newValue!);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
