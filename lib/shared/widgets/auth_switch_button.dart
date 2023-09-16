import 'package:flutter/material.dart';

import 'slide_fade_switcher.dart';

class AuthSwitchButton extends StatelessWidget {
  final bool showSignIn;
  final VoidCallback onTap;
  const AuthSwitchButton({super.key, required this.showSignIn, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: SlideFadeSwitcher(
            child: showSignIn
                ? const Text(
                    'Dont have an account yet? Sign up',
                    key: ValueKey('signIn'),
                  )
                : const Text(
                    'Already have an account? Log in',
                    key: ValueKey('signUp'),
                  ),
          ),
        ),
      ),
    );
  }
}
