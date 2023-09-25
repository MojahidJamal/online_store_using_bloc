import 'package:flutter/material.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
