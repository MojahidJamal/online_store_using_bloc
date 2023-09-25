import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/app_events.dart';
import 'package:learn_bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitStates()) {
    on<Increment>((event, serve) {
      serve(AppStates(counter: state.counter + 1));
    });
    on<Decrement>((event, ask) {
      ask(AppStates(counter: state.counter - 1));
    });
  }
}
