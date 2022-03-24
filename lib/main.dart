import 'dart:async';
import 'package:code_challenge/cashboard_items.dart';
import 'package:code_challenge/constants.dart';
import 'package:code_challenge/expanding_container.dart';
import 'package:code_challenge/reorderable_grid_view/reorderable_grid_item.dart';
import 'package:code_challenge/reorderable_grid_view/reorderable_grid_view.dart';
import 'package:code_challenge/streams/timer_stream.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(IGrooveCodeChallenge());
}

class IGrooveCodeChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CodeChallenge(
          title: 'iGroove CodeChallenge',
          scrollUpdateTrigger: (ScrollController? controller) {
            timerStream.listen((event) {});
          }),
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
  ValueNotifier<double> contentHeight = ValueNotifier<double>(0);
  List<int?>? savedOrder;
  bool _showExample = true;
  int flexingOrderNumber = 4;

  List<ReorderableGridItem> items = cashboardItems;
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
                children: items.map((e) => e).toList(),
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
