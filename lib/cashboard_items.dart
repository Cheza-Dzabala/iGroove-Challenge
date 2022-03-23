import 'package:code_challenge/expanding_container.dart';
import 'package:code_challenge/reorderable_grid_view/reorderable_grid_item.dart';
import 'package:flutter/material.dart';

List<Widget> cashboardItems = [
  ReorderableGridItem(
    orderNumber: 1,
    widthFlex: 1,
    key: GlobalKey(),
    child: Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.red),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed "
                "diam nonumy eirmod tempor invidunt ut labore et dolore magna "
                "aliquyam erat, sed diam voluptua. At vero eos et accusam et "
                "justo duo dolores et ea rebum. Stet clita kasd gubergren, no "
                "sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem "
                "ipsum dolor sit amet, consetetur sadipscing elitr, sed diam "
                "nonumy eirmod tempor invidunt ut labore et dolore magna "
                "aliquyam erat, sed diam voluptua. At vero eos et accusam et "
                "justo duo dolores et ea rebum. Stet clita kasd gubergren, no "
                "sea takimata sanctus est Lorem ipsum dolor sit amet.",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ),
    allowDrag: true,
  ),
  ReorderableGridItem(
    orderNumber: 2,
    widthFlex: 1,
    key: GlobalKey(),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: 75,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.blue),
    ),
    allowDrag: true,
  ),
  ReorderableGridItem(
    orderNumber: 3,
    widthFlex: 1,
    key: GlobalKey(),
    child: Container(
      height: 75,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.yellow),
    ),
    allowDrag: true,
  ),
  ReorderableGridItem(
    orderNumber: 4,
    widthFlex: 1,
    key: GlobalKey(),
    child: ExpandingContainer(),
    allowDrag: true,
  ),
  ReorderableGridItem(
    orderNumber: 5,
    widthFlex: 1,
    key: GlobalKey(),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: const Center(
        child: Text(
          "Info: With a longPress on the boxes you can reorder them to "
          "different positions.",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, height: 18 / 14),
        ),
      ),
    ),
    allowDrag: false,
  ),
];
