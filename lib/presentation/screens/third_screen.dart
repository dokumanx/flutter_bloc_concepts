import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text("Incremented"),
                duration: Duration(milliseconds: 1000),
              ));
          }

          if (state.wasIncremented == false) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text("Decremented"),
                duration: Duration(milliseconds: 1000),
              ));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  cubit: BlocProvider.of<CounterCubit>(context),
                  builder: (context, state) {
                    return Text(
                      '${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        tooltip: "Inc",
                        heroTag: "Inc",
                        child: Icon(Icons.add)),
                    FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).decrement();
                        },
                        tooltip: "Dec",
                        heroTag: "Dec",
                        child: Icon(Icons.remove)),
                  ],
                ),
                SizedBox(height: 24),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/");
                  },
                  child: Text("Go to home screen"),
                  color: widget.color,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
