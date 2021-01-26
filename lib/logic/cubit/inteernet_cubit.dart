import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/constants/enums.dart';
import 'package:flutter_bloc_app/logic/cubit/internet_state.dart';

class InternetCubit extends Cubit<InternetState>{
  final Connectivity connectivity;
  StreamSubscription connectivityStream;
  InternetCubit({@required this.connectivity}) : super(InternetInitial()){
    connectivityStream=connectivity.onConnectivityChanged.listen((conResult) {

      if(conResult == ConnectivityResult.wifi){
        emitInternetConnected(ConnectionType.wifi);
      } else  if(conResult == ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.mobile);
      }
      else  if(conResult == ConnectivityResult.none){
        emitInternetDisconnected();
      }

    });
  }
  void emitInternetConnected(ConnectionType _connectionType)=>emit(InternetConnected(connectionType: _connectionType));
  void emitInternetDisconnected()=>emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStream.cancel();

    return super.close();
  }
}