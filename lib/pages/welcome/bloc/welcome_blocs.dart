import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/pages/welcome/bloc/welcome_events.dart';
import 'package:learn_bloc/pages/welcome/bloc/welcome_states.dart';

class WelcomeBlocs extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBlocs() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
