
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../main_navigation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              Text(
                'GymBuddy',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Your ultimate fitness partner.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(flex: 3),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
                },
                child: const Text('Log In'),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigation()));
                },
                child: const Text('Continue as guest'),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
