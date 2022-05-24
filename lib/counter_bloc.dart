import 'package:bloc/bloc.dart';
import 'package:bloc_sample/counter_event.dart';
import 'package:bloc_sample/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _counter = 0;

  CounterBloc(CounterState initialState) : super(initialState);

  // void _mapEventToState(CounterEvent event) {
  //   if (event is IncrementEvent) {
  //     _counter++;
  //   }
  //   if (event is DecrementEvent) {
  //     _counter--;
  //   }
  //   _counterSink.add(_counter);
  // }
  //
  // void dispose() {
  //   _counterStateController.close();
  //   _counterEventController.close();
  // }

  // addEvent(CounterEvent event) {
  //   eventSink.add(event);
  // }
}
