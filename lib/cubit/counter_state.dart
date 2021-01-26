import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CounterState extends Equatable{
int counterValue;
bool isIncremented;
CounterState({@required this.counterValue, this.isIncremented});

  @override
  List<Object> get props =>[this.isIncremented,this.isIncremented];
}