
import 'package:flutter/material.dart';
import 'diet_restrictions_screen.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule & Availability'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'Select your training days',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(day: 'M'),
                  ToggleButton(day: 'T'),
                  ToggleButton(day: 'W'),
                  ToggleButton(day: 'T'),
                  ToggleButton(day: 'F'),
                  ToggleButton(day: 'S'),
                  ToggleButton(day: 'S'),
                ]),
            const SizedBox(height: 48),
            Text(
              'What time do you prefer?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(label: Text('Morning'), selected: true),
                SizedBox(width: 8),
                ChoiceChip(label: Text('Afternoon'), selected: false),
                SizedBox(width: 8),
                ChoiceChip(label: Text('Evening'), selected: false),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              'Max session length?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: [
                Chip(label: Text('30 mins')),
                Chip(label: Text('45 mins')),
                Chip(label: Text('60 mins')),
                Chip(label: Text('90 mins')),
              ],
            ),
            const Spacer(flex: 2),
            FilledButton(
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DietRestrictionsScreen()));
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key, required this.day});
  final String day;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => _isSelected = !_isSelected),
      child: Container(
        width: 40, 
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.primary)
        ),
        child: Text(
          widget.day, 
          style: TextStyle(color: _isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary)
        ),
      ),
    );
  }
}
