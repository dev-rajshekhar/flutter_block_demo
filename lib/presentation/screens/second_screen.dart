import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/logic/cubit/counter_state.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  final Color color;
  SecondScreen({Key key, this.title, this.color}) : super(key: key);

  @override
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocListener<CubitCounter,CounterState>(
          listener:(context,state) {
            if(state.isIncremented){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incremented"),duration: Duration(milliseconds: 300),));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Decremented"),duration: Duration(milliseconds: 300)));

            }
          },
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CubitCounter, CounterState>(
                  listener:(context,state) {
                    if(state.isIncremented){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incremented"),duration: Duration(milliseconds: 300),));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Decremented"),duration: Duration(milliseconds: 300)));

                    }
                  } ,
                  builder:(context, state){
                    if(state.counterValue<0){
                      return Text( "Negative Value",
                        style: Theme.of(context).textTheme.headline4,);
                    } else{
                      return Text(  state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headline4,);
                    }
                  }
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  FloatingActionButton(
                    backgroundColor: widget.color,

                    onPressed:(){
                      BlocProvider.of<CubitCounter>(context).increment();
                    },
                    heroTag: "ABC",
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 100,),
                  FloatingActionButton(
                    backgroundColor: widget.color,
                    onPressed:(){ BlocProvider.of<CubitCounter>(context).decrement();},
                    tooltip: 'Decrement',
                    heroTag: "CDE",

                    child: Icon(Icons.remove),
                  ),
                ],
              ),
          
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}