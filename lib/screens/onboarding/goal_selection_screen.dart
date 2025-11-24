
import 'package:flutter/material.dart';
import 'experience_level_screen.dart';

class GoalSelectionScreen extends StatelessWidget {
  const GoalSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'What's your primary goal?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const _GoalCard(title: 'Lose Fat'),
            const SizedBox(height: 16),
            const _GoalCard(title: 'Build Muscle'),
            const SizedBox(height: 16),
            const _GoalCard(title: 'Improve Performance'),
             const SizedBox(height: 16),
            const _GoalCard(title: 'General Health'),
            const Spacer(flex: 2),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExperienceLevelScreen()));
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
