import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_example/features/cart/bloc/cart_bloc.dart';
import 'package:training_example/features/cart/bloc/cart_event.dart';
import 'package:training_example/features/cart/widgets/cart_item_widget.dart';
import 'package:training_example/models/cart_item/cart_item.dart';

import '../bloc/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> choseItems = [];
  late CartBloc cartBloc;
  double totalPrice = 0.0;

  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    cartBloc.add(FetchCartItemEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green.shade300,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Expanded(
              child:
                  BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                if (state is CartErrorState) {
                  return const Center(
                    child:
                        Text('Something went wrong\nPlease try again later.'),
                  );
                } else if (state is CartLoadedState) {
                  return ListView.builder(
                    itemCount: state.cartData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItemWidget(
                        item: state.cartData[index],
                        onQuantityChange: () => updateTotalPrice(items: state.cartData),
                        onChose: (isChose) {
                          setState(() {
                            if (isChose) {
                              setState(() {
                                choseItems.add(state.cartData[index]);
                                updateTotalPrice(items: state.cartData);
                              });
                            } else {
                              setState(() {
                                choseItems.remove(state.cartData[index]);
                                updateTotalPrice(items: state.cartData);
                              });
                            }
                          });
                        },
                        onDelete: () {
                          if (choseItems.contains(state.cartData[index])) {
                            setState(() {
                              choseItems.remove(state.cartData[index]);
                            });
                          }
                          state.cartData.removeAt(index);
                          cartBloc.add(RemoveCartItemEvent(
                              productId: state.cartData[index].id));
                          updateTotalPrice(items: state.cartData);
                        },
                      );
                    },
                  );
                } else if (state is RemovedCartItemErrorState) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text(
                        'Something went wrong. Please try again later'),
                    actions: [
                      TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            setState(() {});
                          })
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Total Price: ',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54)),
                            TextSpan(
                                text: '\$${totalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 25)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Buy (${choseItems.length})',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void updateTotalPrice({required List<CartItem> items}) {
    double total = 0.0;
    for (CartItem item in items) {
      if (item.isChose) {
        total += item.quantity * item.itemInfo!.dolar;
      }
    }
    setState(() {
      totalPrice = total;
    });
  }
}
