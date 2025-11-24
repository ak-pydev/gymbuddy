
import 'package:flutter/material.dart';
import 'wearable_connectivity_screen.dart';

class DietRestrictionsScreen extends StatelessWidget {
  const DietRestrictionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet & Restrictions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'Do you have a specific diet?',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: [
                ChoiceChip(label: Text('Regular'), selected: true),
                ChoiceChip(label: Text('Vegetarian'), selected: false),
                ChoiceChip(label: Text('Vegan'), selected: false),
                ChoiceChip(label: Text('High Protein'), selected: false),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              'Any allergies or restrictions?',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: [
                Chip(label: Text('Nuts')),
                Chip(label: Text('Dairy')),
                Chip(label: Text('Gluten')),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              'What is your weight goal?',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(label: Text('Gain'), selected: false),
                SizedBox(width: 8),
                ChoiceChip(label: Text('Maintain'), selected: true),
                SizedBox(width: 8),
                ChoiceChip(label: Text('Lose'), selected: false),
              ],
            ),
            const Spacer(flex: 2),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WearableConnectivityScreen()));
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
