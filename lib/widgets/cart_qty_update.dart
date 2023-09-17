import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartQtyUpdate extends StatefulWidget {
  final String cartKey;
  final productId;
  final int quantity;
  final String title;
  final double price;

  const CartQtyUpdate({
    super.key,
    required this.cartKey,
    required this.productId,
    required this.quantity,
    required this.title,
    required this.price,
  });

  @override
  State<CartQtyUpdate> createState() => _CartQtyUpdateState();
}

class _CartQtyUpdateState extends State<CartQtyUpdate> {
  final _txtQtyController = TextEditingController();

  bool _txtQtyIsEmpty = true;
  int _currQty = 0;

  void updateCartQty(bool viaTextField, bool isAdd) {
    //checks if input is via 'text field'
    if (viaTextField) {

      if (_txtQtyIsEmpty) {
        _currQty = 1;
      } else {
        _currQty = int.parse(_txtQtyController.text);
      }
    
    } else {
    //checks if input is via '+' / '-' buttons
      if (isAdd) {
        _currQty = _currQty + 1;
      } else {
        _currQty = _currQty - 1;
      }

      if (_currQty <= 0) {
        _currQty = 1;
      } else if(_currQty >= 100) {
        _currQty = 99;
      }
    }

    //updates data quantity
    Provider.of<Cart>(context, listen: false).updateCartItemQty(
      widget.cartKey,
      _currQty,
      widget.productId,
    );

    setState(() {
      //updates front-end text
      _txtQtyController.text = (_currQty).toString();
    });
  }

  @override
  void initState() {
    super.initState();

    _currQty = widget.quantity;
    _txtQtyController.text = _currQty.toString();

    _txtQtyController.addListener(() {
      setState(() {
        _txtQtyIsEmpty = _txtQtyController.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final cartItem = Provider.of<Cart>(context, listen: false);

    return Container(
      width: double.infinity,
      //decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              updateCartQty(false, true);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
          Container(
            width: 50,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus == false) {
                  updateCartQty(true, false);
                }
              },
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 2,
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  isDense: true,
                  counterText: "",
                ),
                controller: _txtQtyController,
                onSubmitted: (value) {
                  updateCartQty(true, false);
                },
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              updateCartQty(false, false);
            },
            icon: const Icon(
              Icons.remove,
            ),
          )
        ],
      ),
    );
  }
}
