import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/cubit/counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CubitCounter>(
        child: MaterialApp(
          title: 'Flutter Demo',

          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
        create: (context)=>CubitCounter());

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

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
                    onPressed:(){
                      BlocProvider.of<CubitCounter>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 100,),
                  FloatingActionButton(
                    onPressed:(){ BlocProvider.of<CubitCounter>(context).decrement();},
                    tooltip: 'Decrement',
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
