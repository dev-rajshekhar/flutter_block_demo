
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/constants/enums.dart';
@immutable
abstract class InternetState{
}
class InternetInitial extends InternetState{

}
class InternetConnected extends InternetState{
  final ConnectionType connectionType;

  InternetConnected({ @required this.connectionType});

}
class InternetDisconnected extends InternetState{

}