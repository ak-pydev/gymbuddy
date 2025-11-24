import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Train',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'today', label: Text('Today')),
                      ButtonSegment(value: 'week', label: Text('Week')),
                      ButtonSegment(value: 'programs', label: Text('Programs')),
                    ],
                    selected: const {'today'},
                    onSelectionChanged: (Set<String> newSelection) {},
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Today's Session
              Text(
                "Today's Session",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.spaceMd),

              Container(
                padding: const EdgeInsets.all(AppTheme.spaceLg),
                decoration: AppTheme.gradientCardDecoration(
                  colorScheme.primary,
                  colorScheme.primary.withValues(alpha: 0.8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Full Body',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '45 min',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Full Body Strength',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '8 exercises • Intermediate',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceLg),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppTheme.radiusMd,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Workout Programs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Workout Programs',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text('See all')),
                ],
              ),
              const SizedBox(height: AppTheme.spaceMd),

              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProgramCard(
                      context,
                      '4-Week Strength Plan',
                      '4 weeks • 4 days/week',
                      'Intermediate',
                      Colors.purple,
                    ),
                    const SizedBox(width: AppTheme.spaceMd),
                    _buildProgramCard(
                      context,
                      'Hypertrophy Split',
                      '6 weeks • 5 days/week',
                      'Advanced',
                      Colors.orange,
                    ),
                    const SizedBox(width: AppTheme.spaceMd),
                    _buildProgramCard(
                      context,
                      'Home Dumbbell Only',
                      '8 weeks • 3 days/week',
                      'Beginner',
                      Colors.teal,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // My Routines
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Routines',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spaceMd),

              _buildRoutineCard(
                context,
                'Push Day',
                'Chest, Shoulders, Triceps',
                '8 exercises',
              ),
              const SizedBox(height: AppTheme.spaceMd),

              _buildRoutineCard(
                context,
                'Pull Day',
                'Back, Biceps',
                '7 exercises',
              ),
              const SizedBox(height: AppTheme.spaceMd),

              _buildRoutineCard(
                context,
                'Leg Day',
                'Quads, Hamstrings, Glutes',
                '9 exercises',
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Create Routine'),
      ),
    );
  }

  Widget _buildProgramCard(
    BuildContext context,
    String title,
    String duration,
    String level,
    Color color,
  ) {
    final theme = Theme.of(context);
    return Container(
      width: 200,
      padding: const EdgeInsets.all(AppTheme.spaceMd),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color, color.withValues(alpha: 0.7)],
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: AppTheme.shadowColored(color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              level,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                duration,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoutineCard(
    BuildContext context,
    String title,
    String subtitle,
    String exercises,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppTheme.spaceMd),
      decoration: AppTheme.cardDecoration(context),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.fitness_center,
              color: theme.colorScheme.onPrimaryContainer,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTheme.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  exercises,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
    );
  }
}
