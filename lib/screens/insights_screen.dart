import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Insights',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.spaceMd),

              // Time Range Selector
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: '7', label: Text('7 days')),
                  ButtonSegment(value: '30', label: Text('30 days')),
                  ButtonSegment(value: '90', label: Text('90 days')),
                ],
                selected: const {'30'},
                onSelectionChanged: (Set<String> newSelection) {},
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Overview Cards
              _buildInsightCard(
                context,
                'Consistency',
                '85%',
                'Workouts completed vs planned',
                Icons.check_circle_outline,
                Colors.green,
              ),
              const SizedBox(height: AppTheme.spaceMd),

              _buildInsightCard(
                context,
                'Training Volume',
                '+15%',
                'Increase in total volume this month',
                Icons.trending_up,
                Colors.blue,
              ),
              const SizedBox(height: AppTheme.spaceMd),

              _buildInsightCard(
                context,
                'Nutrition Alignment',
                '71%',
                'Days within calorie target',
                Icons.restaurant,
                Colors.orange,
              ),
              const SizedBox(height: AppTheme.spaceMd),

              _buildInsightCard(
                context,
                'Recovery Score',
                '88',
                'Based on sleep and heart rate',
                Icons.favorite_outline,
                Colors.red,
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInsightCard(
    BuildContext context,
    String title,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppTheme.spaceLg),
      decoration: AppTheme.cardDecoration(context),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 32),
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
                  value,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
