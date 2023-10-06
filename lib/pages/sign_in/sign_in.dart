import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:learn_bloc/pages/sign_in/bloc/sign_in_events.dart';
import 'package:learn_bloc/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildThirdPartyLogin(context),
                reusableText('Or use your email to login'),
                SizedBox(
                  height: 10,
                ),
                reusableText('Email'),
                buildTextField('Enter Your Email Address', 'email', (value) {
                  context.read<SignInBLoc>().add(EmailEvent(value));
                }),
                SizedBox(
                  height: 10,
                ),
                reusableText('password'),
                buildTextField('Enter Your Email password', 'password',
                    (value) {
                  context.read<SignInBLoc>().add(PasswordEvent(value));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
