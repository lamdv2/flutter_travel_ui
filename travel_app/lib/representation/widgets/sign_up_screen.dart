import 'package:flutter/material.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Sign Up',
      implementLeading: true,
      childAppBar: Container(),
    );
  }
}
