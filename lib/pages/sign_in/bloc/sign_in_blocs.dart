import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/pages/sign_in/bloc/sign_in_%20states.dart';
import 'package:learn_bloc/pages/sign_in/bloc/sign_in_events.dart';

class SignInBLoc extends Bloc<SignInEvent, SignInState> {
  SignInBLoc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
