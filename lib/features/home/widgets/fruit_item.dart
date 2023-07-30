import 'package:flutter/material.dart';
import 'package:training_example/models/product/product.dart';

import '../../../constants/fonts.dart';
import '../../../generated/assets.dart';

class FruitItem extends StatelessWidget {
  final Product item;
  VoidCallback onTap;

  FruitItem({Key? key, required this.item, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 0.3),
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  item.images[0],
                  height: 150,
                  width: 150,
                  errorBuilder: (context, error, stackTrace) {
                    // Custom widget to display in case of image error
                    return Image.asset(
                      Assets.assetsImageDefault,
                      height: 150,
                      width: 150,
                    );
                  },
                ),

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                        fontFamily: Fonts.muktaBold, fontSize: 18, height: 1.3),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'With \$${item.unit}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: Fonts.muktaSemiBold),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${item.dolar}',
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                              fontFamily: Fonts.muktaBold),
                        ),
                        const TextSpan(
                          text: '\tea',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontFamily: Fonts.muktaMedium),
                        ),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
