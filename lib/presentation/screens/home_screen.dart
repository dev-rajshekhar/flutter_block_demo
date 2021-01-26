import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/constants/enums.dart';
import 'package:flutter_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/logic/cubit/counter_state.dart';
import 'package:flutter_bloc_app/logic/cubit/inteernet_cubit.dart';
import 'package:flutter_bloc_app/logic/cubit/internet_state.dart';
import 'package:flutter_bloc_app/presentation/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocListener<CubitCounter, CounterState>(
          listener: (context, state) {
            if (state.isIncremented) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Incremented"),
                duration: Duration(milliseconds: 300),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Decremented"),
                  duration: Duration(milliseconds: 300)));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(builder: (context,state){
                if(state is InternetConnected && state.connectionType == ConnectionType.wifi){
                  return Text("WIFI");
                }else  if(state is InternetConnected  && state.connectionType == ConnectionType.mobile){
                  return Text("Mobile");
                }
                else  if(state is InternetDisconnected){
                  return Text("Disconnected");
                }
                else{
                  return CircularProgressIndicator();
                }
              }),
              Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CubitCounter, CounterState>(
                  listener: (context, state) {
                if (state.isIncremented) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 300),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Decremented"),
                      duration: Duration(milliseconds: 300)));
                }
              }, builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "Negative Value",
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CubitCounter>(context).increment();
                    },
                    heroTag: "Increment",
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CubitCounter>(context).decrement();
                    },
                    heroTag: "Decrement",
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: Text("Go to Second Screen"),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: Text("Go to Third Screen"),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
