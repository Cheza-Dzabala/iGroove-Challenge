double getSize({required int seconds}) => seconds % 2 == 0 ? 75.0 : 150.0;

Stream<int> timerStream = Stream<int>.periodic(
  Duration(seconds: 1),
  (x) => x,
).asBroadcastStream();
