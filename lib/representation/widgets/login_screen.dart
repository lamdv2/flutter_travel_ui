import 'package:flutter/cupertino.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Login',
      implementLeading: true,
      childAppBar: Container(),
    );
  }
}
