// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'sun_app_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const SunAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      );
}
