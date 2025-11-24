import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: AppTheme.durationNormal,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                TextButton(onPressed: _handleLogin, child: const Text('Skip')),
                const SizedBox(width: AppTheme.spaceMd),
              ],
            ),

            // Content
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spaceLg),
                child: Column(
                  children: [
                    const Spacer(flex: 1),

                    // Logo Section
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Hero(
                        tag: 'app_logo',
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: AppTheme.shadowColored(
                              colorScheme.primary,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/motion_arc_logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceXl),

                    // Headline
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'MOTION ARC',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceMd),

                    // Subheadline
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'AI-powered motion tracking\nfor perfect form',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const Spacer(flex: 2),

                    // Login Form
                    SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Email Field
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'your@email.com',
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppTheme.radiusMd,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: AppTheme.spaceMd),

                              // Password Field
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppTheme.radiusMd,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: AppTheme.spaceSm),

                              // Forgot Password
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text('Forgot password?'),
                                ),
                              ),
                              const SizedBox(height: AppTheme.spaceLg),

                              // Sign In Button
                              Container(
                                height: 56,
                                decoration: AppTheme.gradientCardDecoration(
                                  colorScheme.primary,
                                  colorScheme.primary.withValues(alpha: 0.8),
                                ),
                                child: FilledButton(
                                  onPressed: _handleLogin,
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        AppTheme.radiusLg,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppTheme.spaceLg),

                              // Divider
                              Row(
                                children: [
                                  const Expanded(child: Divider()),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppTheme.spaceMd,
                                    ),
                                    child: Text(
                                      'or',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                  ),
                                  const Expanded(child: Divider()),
                                ],
                              ),
                              const SizedBox(height: AppTheme.spaceLg),

                              // Google Sign In
                              OutlinedButton.icon(
                                onPressed: _handleLogin,
                                icon: const Icon(Icons.g_mobiledata, size: 28),
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text('Continue with Google'),
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppTheme.radiusMd,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppTheme.spaceMd),

                              // Apple Sign In
                              OutlinedButton.icon(
                                onPressed: _handleLogin,
                                icon: const Icon(Icons.apple),
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text('Continue with Apple'),
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppTheme.radiusMd,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const Spacer(flex: 1),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spaceMd),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
