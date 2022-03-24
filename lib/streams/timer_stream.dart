double getSize({required int seconds}) => seconds % 2 == 0 ? 150.0 : 75.0;

bool isExpanded({required int seconds}) => seconds % 2 == 0;

Stream<int> timerStream = Stream<int>.periodic(
  Duration(seconds: 1),
  (x) => x,
).asBroadcastStream();

Stream<double> contentHeightStream() {
  return timerStream.map((event) {
    return isExpanded(seconds: event) ? 150.0 : 75.0;
  });
}
