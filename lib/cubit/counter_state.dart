import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class CounterState{
int counterValue;
bool isIncremented;
CounterState({@required this.counterValue, this.isIncremented});
}