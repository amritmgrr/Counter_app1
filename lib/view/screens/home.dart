import 'dart:ffi';

import 'package:counter_app/controller/cubits/counter_cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$state",
                  style: TextStyle(fontSize: 60),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increase();
                        },
                        child: Text("+")),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).decrease();
                        },
                        child: Text("-")),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
