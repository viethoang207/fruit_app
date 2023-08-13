import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_example/features/cart/bloc/cart_bloc.dart';
import 'package:training_example/features/cart/bloc/cart_event.dart';
import 'package:training_example/features/cart/widgets/cart_item_widget.dart';
import 'package:training_example/models/cart_item/cart_item.dart';
import 'package:training_example/models/product/product.dart';

import '../bloc/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = List.generate(
      3,
      (index) => CartItem(
          id: "item1",
          username: "admin2@gmail.com",
          isChose: false,
          quantity: 5,
          itemInfo: const Product(
              id: '0KG9BuNpraZSVWlmXrD3',
              name: 'ASIAN VEGGIE BOX',
              title:
                  'Bring a taste of Asia to your cooking. You\'ll get the best value in this perfectly selected offering of the best available produce in the market. Create delicious stir-fry\'s, dumplings, fried rice or chow mein with this curated box.',
              description:
                  '400g Bean Sprouts 4-6 Buk Choy Bunches 1 Gai Lan Bunch 1 Red Capsicum 1 Yellow Capsicum 1 Green Capsicum 1kg Carrots 1 Chinese Cabbage 150g Galangal 150g Ginger 200g Mushrooms 1 Lemongrass Stalk 2 Limes 1 Garlic Head Chilli Bullhorn Red 1 Coriander Bunch 1 Shallots Bunch',
              dolar: 50,
              unit: '50.00 ea',
              images: [
                'https://www.harrisfarm.com.au/cdn/shop/products/imperfect-apple-granny-smith_1024x1024.jpg?v=1503970617'
              ],
              category: 'VEGGIES')));
  late CartBloc cartBloc;

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
                child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                  if (state is CartErrorState) {
                    return const Center(
                      child: Text(
                          'Something went wrong\nPlease try again later.'),
                    );
                  } else if (state is CartLoadedState) {
                    return ListView.builder(
                      itemCount: state.cartData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartItemWidget(
                          item: state.cartData[index],
                          onChose: () {},
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
