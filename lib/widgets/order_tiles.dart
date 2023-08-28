import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../models/order_item.dart';

class OrderTiles extends StatefulWidget {
  final OrderItem order;

  const OrderTiles({
    super.key,
    required this.order,
  });

  @override
  State<OrderTiles> createState() => _OrderTilesState();
}

class _OrderTilesState extends State<OrderTiles> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$ ${widget.order.amount}"),
            subtitle: Text(
              DateFormat("yyyy-MM-dd hh:mm").format(widget.order.timeStamp),
            ),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Container(
              height: min(widget.order.products.length * 50.0 + 20, 100.0),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: widget.order.products.length,
                  itemBuilder: (ctx, idx) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.order.products[idx].title,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.order.products[idx].quantity} x \$ ${widget.order.products[idx].price}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
