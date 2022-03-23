import 'package:code_challenge/streams/timer_stream.dart';
import 'package:flutter/material.dart';

class ExpandingContainer extends StatelessWidget {
  const ExpandingContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: timerStream,
        builder: (context, snapshot) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            height: getSize(seconds: snapshot.data ?? 0),
            margin: EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Color(0xff5855DC)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Good Luck',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 36),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.white,
                    size: 42,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
