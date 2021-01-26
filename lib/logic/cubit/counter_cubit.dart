
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/constants/enums.dart';
import 'package:flutter_bloc_app/logic/cubit/inteernet_cubit.dart';
import 'package:flutter_bloc_app/logic/cubit/internet_state.dart';

import 'counter_state.dart';

class CubitCounter extends Cubit<CounterState>{
  final InternetCubit internetCubit;
  StreamSubscription internetSubscription;

  CubitCounter({@required this.internetCubit} ):super(CounterState(counterValue:0)){
    internetSubscription= internetCubit.listen((internetState) {
      print(internetState is InternetConnected);
      if(internetState is InternetConnected && internetState.connectionType == ConnectionType.wifi){
        increment();
      } else if(internetState is InternetConnected && internetState.connectionType== ConnectionType.mobile){
        increment();
      }else if (internetState is InternetDisconnected){
        decrement();
      }
    });
  }
  increment()=>emit(CounterState(counterValue: state.counterValue+1, isIncremented: true));
  decrement()=>emit(CounterState(counterValue: state.counterValue-1, isIncremented: false));

  @override
  Future<void> close() {
    internetSubscription.cancel();
    return super.close();
  }
}