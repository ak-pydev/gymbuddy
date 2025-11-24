
import 'package:flutter/material.dart';
import '../onboarding/goal_selection_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLogin = false;

  void _submit() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const GoalSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Log In' : 'Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            if (!_isLogin)
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Confirm Password'),
              ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _submit,
              child: Text(_isLogin ? 'Log In' : 'Sign Up'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot password?'),
              ),
            ),
            const Spacer(),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.apple),
              label: const Text('Continue with Apple'),
              onPressed: _submit,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.g_translate_outlined),
              label: const Text('Continue with Google'),
              onPressed: _submit,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_isLogin ? "Don't have an account?" : 'Already have an account?'),
                TextButton(
                  onPressed: () => setState(() => _isLogin = !_isLogin),
                  child: Text(_isLogin ? 'Sign Up' : 'Log In'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
