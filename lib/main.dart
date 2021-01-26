import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/presentation/router/app_router.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

final _appRoute =AppRouter();


  @override
  Widget build(BuildContext context) {
    return BlocProvider<CubitCounter>(
      create: (context)=>CubitCounter(),

      child: MaterialApp(
   onGenerateRoute: _appRoute.onGenerateRoute,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity
            ),
          ),
    );

  }
}


