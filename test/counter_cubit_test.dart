import 'package:bloc_sample/counter_cubit.dart';
import 'package:bloc_sample/counter_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit testing', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('initial state of cubit is CubitState(counterValue:0)', () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit state CubitState(currentValue:1,wasIncremented: true) when cubit.increment() is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit state CubitState(currentValue:-1,wasIncremented: false) when cubit.decrement() is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
