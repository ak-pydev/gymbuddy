import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

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
                'Nutrition',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.spaceLg),

              // Daily Target
              Container(
                padding: const EdgeInsets.all(AppTheme.spaceLg),
                decoration: AppTheme.cardDecoration(context),
                child: Column(
                  children: [
                    Text(
                      'Daily Target',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceMd),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMacroStat('Protein', '0g', '150g', Colors.red),
                        _buildMacroStat('Carbs', '0g', '200g', Colors.orange),
                        _buildMacroStat('Fats', '0g', '60g', Colors.purple),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spaceMd),
                    Text(
                      '0 / 2000 kcal',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Meals
              _buildMealSection(context, 'Breakfast', Icons.wb_sunny_outlined),
              const SizedBox(height: AppTheme.spaceMd),
              _buildMealSection(context, 'Lunch', Icons.wb_sunny),
              const SizedBox(height: AppTheme.spaceMd),
              _buildMealSection(context, 'Dinner', Icons.nightlight_outlined),
              const SizedBox(height: AppTheme.spaceMd),
              _buildMealSection(context, 'Snacks', Icons.fastfood_outlined),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMacroStat(
    String label,
    String current,
    String target,
    Color color,
  ) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        const SizedBox(height: 8),
        Text(
          current,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        Text(
          '/ $target',
          style: TextStyle(fontSize: 12, color: Colors.grey[500]),
        ),
      ],
    );
  }

  Widget _buildMealSection(BuildContext context, String meal, IconData icon) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppTheme.spaceMd),
      decoration: AppTheme.cardDecoration(context),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary),
          const SizedBox(width: AppTheme.spaceMd),
          Expanded(
            child: Text(
              meal,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add food'),
          ),
        ],
      ),
    );
  }
}
