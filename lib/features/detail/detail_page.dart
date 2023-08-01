import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:training_example/constants/fonts.dart';
import 'package:training_example/models/product/product.dart';
import '../../generated/assets.dart';

class DetailPage extends StatefulWidget {
  final Product fruitItem;

  const DetailPage({Key? key, required this.fruitItem}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final PageController _pageController = PageController();
  List<Widget> imageWidgets = [];

  @override
  void initState() {
    for (var element in widget.fruitItem.images) {
      imageWidgets.add(
          Image.network(
            width: 300,
            element,
            errorBuilder: (context, error, stackTrace) {
              // Custom widget to display in case of image error
              return Image.asset(
                Assets.assetsImageDefault,
                height: 150,
                width: 150,
              );
            },
          ),
        );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                size: 35, color: Colors.grey),
            onPressed: () {
              //TODO: Handle pop back
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: PageView(
                    controller: _pageController,
                    children: imageWidgets,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: SmoothPageIndicator(
                    effect: const JumpingDotEffect(
                        dotWidth: 10, dotHeight: 10, verticalOffset: 10),
                    controller: _pageController,
                    count: widget.fruitItem.images.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  child: Column(
                    children: [
                      Text(
                        widget.fruitItem.name,
                        style: TextStyle(
                            fontFamily: Fonts.muktaSemiBold,
                            fontSize: 25,
                            height: 1.3,
                            color: Colors.green.shade600),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '\$${widget.fruitItem.dolar}',
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 40,
                                    fontFamily: Fonts.muktaBold),
                              ),
                              const TextSpan(
                                text: '\tea',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontFamily: Fonts.muktaMedium),
                              ),
                            ]),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: Fonts.muktaSemiBold),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {},
                                  highlightColor: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '\$${widget.fruitItem.unit}',
                          style: const TextStyle(
                              fontFamily: Fonts.muktaSemiBold,
                              fontSize: 18,
                              height: 1.3,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            //TODO: Handle add to cart
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.red.shade400)),
                          child: const Text('ADD TO CART',
                              style:
                                  TextStyle(fontFamily: Fonts.muktaSemiBold)),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.fruitItem.description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontFamily: Fonts.muktaRegular,
                                fontSize: 18,
                                height: 1.3,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
