import 'dart:async';
import 'package:code_challenge/cashboard_items.dart';
import 'package:code_challenge/constants.dart';
import 'package:code_challenge/expanding_container.dart';
import 'package:code_challenge/reorderable_grid_view/reorderable_grid_item.dart';
import 'package:code_challenge/reorderable_grid_view/reorderable_grid_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(IGrooveCodeChallenge());
}

// Get scroll controller as a parameter. Position all the widgets in the list down by 20 pixels.

class IGrooveCodeChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CodeChallenge(title: 'iGroove CodeChallenge'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CodeChallenge extends StatefulWidget {
  CodeChallenge({Key? key, this.title, this.scrollUpdateTrigger})
      : super(key: key);

  final Function(ScrollController?)? scrollUpdateTrigger;
  final String? title;

  @override
  _CodeChallengeState createState() => _CodeChallengeState();
}

class _CodeChallengeState extends State<CodeChallenge> {
  ScrollController? _scrollController;
  List<int?>? savedOrder;
  bool _showExample = true;

  @override
  void initState() {
    _initScrollController();
    super.initState();
  }

  void switchView() {
    setState(() {
      _showExample = !_showExample;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initScrollController() {
    _scrollController = ScrollController()
      ..addListener(() {
        widget.scrollUpdateTrigger!(_scrollController);
      });
  }

  ReorderableGridItem checkOrder(ReorderableGridItem item) {
    print(item.orderNumber);
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5855DC),
        title: Text(
          widget.title!,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: _showExample
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Center(
                      child: Text(
                        challengeText,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 18 / 14),
                      ),
                    ),
                  ),
                  ExpandingContainer(),
                ],
              )
            : ReorderableGridView(
                scrollController: _scrollController,
                orderedIndexes: savedOrder,
                onOrderChange: (newOrderedList) {
                  savedOrder =
                      newOrderedList.map((e) => e!.orderNumber).toList();
                },
                children: cashboardItems
                    .map<ReorderableGridItem>((e) => e as ReorderableGridItem)
                    .toList(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => switchView(),
        child: const Icon(Icons.swap_horiz),
        backgroundColor: const Color(0xff5855DC),
      ),
    );
  }
}
