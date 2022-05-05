import 'dart:async';

import 'package:bloc_sample/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _counterSink => _counterStateController.sink;
  Stream<int> get counterStream => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get eventSink => _counterEventController.sink;
  Stream<CounterEvent> get _eventStream => _counterEventController.stream;

  CounterBloc() {
    _eventStream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    }
    if (event is DecrementEvent) {
      _counter--;
    }
    _counterSink.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }

  addEvent(CounterEvent event) {
    eventSink.add(event);
  }
}
