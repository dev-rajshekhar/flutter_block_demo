import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/logic/cubit/inteernet_cubit.dart';
import 'package:flutter_bloc_app/presentation/router/app_router.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(appRoute: AppRouter(),connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRoute;

  final Connectivity connectivity;

  const MyApp({Key key, @required this.appRoute, @required this.connectivity}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context)=>InternetCubit(connectivity: connectivity)),
        BlocProvider<CubitCounter>(create: (context)=>CubitCounter()),
      ],
      child: MaterialApp(
   onGenerateRoute: appRoute.onGenerateRoute,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity
            ),
          ),
    );

  }
}


