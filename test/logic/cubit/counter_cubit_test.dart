import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/logic/cubit/counter_state.dart';

import 'package:test/test.dart';

void main(){
  group('CubitCounter',(){
    CubitCounter cubitCounter;
    setUp((){
      cubitCounter=CubitCounter();
    });
    tearDown((){
      cubitCounter.close();
    });
    test("Initial state counter will be zero", (){
      expect(cubitCounter.state, CounterState(counterValue: 0));
    });
    blocTest("The logic.cubit should emit CounterState(counterValue:1, isIncremented:true), when logic.cubit.increment() called", build:() =>cubitCounter ,act: (cubit)=>cubitCounter.increment(), expect: [CounterState(counterValue: 1, isIncremented: true)]);
    blocTest("The logic.cubit should emit CounterState(counterValue:-1, isIncremented:false), when logic.cubit.decrement() called", build:() =>cubitCounter ,act: (cubit)=>cubitCounter.decrement(), expect: [CounterState(counterValue: -1, isIncremented: false)]);
  });
}