import 'package:flutter_bloc/flutter_bloc.dart';
// i created class called CounterCubit that extend from Cubit class
// will return integer ok
class CounterCubit extends Cubit<int> {
  // initial state is zero
  CounterCubit() : super(0);
// i will send state by cubit called emit whether ++, --, 0
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void restart()=> emit(0);

  // for calling them on onPressed=>

// 1. context.read<CounterCubit>().increment()

//     make object from CounterCubit ===> final cubit = CounterCubit();
// 2. cubit.increment

// 3. BlocProvider.of<CounterCubit>(context).increment

}