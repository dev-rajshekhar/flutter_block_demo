
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CubitCounter extends Cubit<CounterState>{
  CubitCounter( ):super(CounterState(counterValue:0));
  increment()=>emit(CounterState(counterValue: state.counterValue+1, isIncremented: true));
  decrement()=>emit(CounterState(counterValue: state.counterValue-1, isIncremented: false));

}