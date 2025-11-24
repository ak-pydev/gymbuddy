
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good morning, [Name]',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Today's focus: [Muscle Group / Goal]",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Today's Workout Card
              Card(
                elevation: 0,
                color: colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full-Body Strength', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.timer_outlined, size: 16),
                          SizedBox(width: 4),
                          Text('45 min'),
                          SizedBox(width: 16),
                          Icon(Icons.leaderboard_outlined, size: 16),
                          SizedBox(width: 4),
                          Text('Intermediate'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const LinearProgressIndicator(value: 0.75),
                       const SizedBox(height: 4),
                      Text('3/4 workouts this week', style: theme.textTheme.bodySmall),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {},
                          child: const Text('Start Workout'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Today's Activity Strip
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ActivityStat(icon: Icons.directions_walk, value: '8,234', label: 'Steps'),
                  _ActivityStat(icon: Icons.local_fire_department, value: '320', label: 'Calories'),
                  _ActivityStat(icon: Icons.timer, value: '45', label: 'Active Min'),
                  _ActivityStat(icon: Icons.favorite_border, value: '65', label: 'BPM'),
                ],
              ),


              const SizedBox(height: 24),

              // Daily Readiness / Recovery Widget
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircularProgressIndicator(value: 0.85),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Readiness: 85%', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            const Text('You're ready for a heavy session'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              
              // Shortcuts Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ShortcutButton(icon: Icons.add, label: 'Log Workout'),
                  _ShortcutButton(icon: Icons.fastfood_outlined, label: 'Log Meal'),
                  _ShortcutButton(icon: Icons.insights, label: 'Check Insights'),
                  _ShortcutButton(icon: Icons.calendar_today_outlined, label: 'Plan Week'),
                ],
              ),
              const SizedBox(height: 24),

              // Suggested Actions
              Text('Suggested Actions', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const _SuggestionCard(title: 'Finish week 1 of Strength Plan'),
              const _SuggestionCard(title: 'Try a 10-min mobility session'),
              const _SuggestionCard(title: 'Prep meals for tomorrow'),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActivityStat extends StatelessWidget {
  const _ActivityStat({required this.icon, required this.value, required this.label});
  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        Text(value, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        Text(label, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _ShortcutButton extends StatelessWidget {
  const _ShortcutButton({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class _SuggestionCard extends StatelessWidget {
  const _SuggestionCard({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
