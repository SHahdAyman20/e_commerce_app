import 'package:e_commerce_app/state_managment/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      // here i determine the ind of cubit class i will work on it => CounterCubit
      // and the return type => int
      // and then build screen refer to the context and state in emit
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) => Center(
            child: Text(
                '$state',
              style:const TextStyle(
                fontSize: 100
              ),
            )
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // in onPressed => i call context to read the version
          // from CounterCubit class and call functions inside it
          // like increment, decrement, restart
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.restart_alt),
            onPressed: () => context.read<CounterCubit>().restart(),
          ),
        ],
      ),
    );
  }
}