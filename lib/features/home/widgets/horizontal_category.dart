import 'package:flutter/material.dart';

import '../../../constants/fonts.dart';

class HorizontalCategory extends StatefulWidget {
  final List<String> categories;
  final int initialIndex;

  final Function(int? index) onCategoryChange;

  const HorizontalCategory({Key? key, required this.categories, required this.initialIndex, required this.onCategoryChange}) : super(key: key);

  @override
  State<HorizontalCategory> createState() => _HorizontalCategoryState();
}

class _HorizontalCategoryState extends State<HorizontalCategory>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: widget.categories.length,
        itemBuilder: (context, index) => TextButton(
          onPressed: () {},
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.onCategoryChange(index);
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: index == widget.initialIndex
                      ? const Color.fromRGBO(247, 221, 222, 1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  widget.categories[index],
                  style: TextStyle(
                      fontFamily: Fonts.muktaSemiBold,
                      fontSize: 20.0,
                      color: index == widget.initialIndex
                          ? const Color.fromRGBO(194, 112, 110, 1)
                          : Colors.black),
                ),
              ),
            ),
          ),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
