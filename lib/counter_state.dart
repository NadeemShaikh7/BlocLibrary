class CounterState {
  int counter = 0;

  CounterState._();

  factory CounterState.initial() {
    return CounterState._()..counter = 0;
  }
}
