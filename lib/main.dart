import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';

import 'presentation/screens/home_screen.dart';
import 'presentation/screens/second_screen.dart';
import 'presentation/screens/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterCubit _counterCubit;

  @override
  void initState() {
    _counterCubit = CounterCubit();
    super.initState();
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomePage(
                color: Colors.blueAccent,
                title: "Home Page",
              ),
            ),
        "/secondScreen": (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(
                color: Colors.redAccent,
                title: "Second Screen",
              ),
            ),
        "/thirdScreen": (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(
                color: Colors.greenAccent,
                title: "Third Screen",
              ),
            )
      },
    );
  }
}
