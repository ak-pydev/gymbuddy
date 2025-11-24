
import 'package:flutter/material.dart';
import 'schedule_screen.dart';

class ExperienceLevelScreen extends StatefulWidget {
  const ExperienceLevelScreen({super.key});

  @override
  State<ExperienceLevelScreen> createState() => _ExperienceLevelScreenState();
}

class _ExperienceLevelScreenState extends State<ExperienceLevelScreen> {
  String _selectedExperience = 'Beginner';
  final List<String> _equipment = [
    'Home only',
    'Dumbbells',
    'Barbell',
    'Machines',
    'Full gym access'
  ];
  final Set<String> _selectedEquipment = {'Home only'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'How would you describe your experience?',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['Beginner', 'Intermediate', 'Advanced'].map((level) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(level),
                    selected: _selectedExperience == level,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedExperience = level;
                        });
                      }
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 48),
            Text(
              'What equipment do you have access to?',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: _equipment.map((item) {
                return FilterChip(
                  label: Text(item),
                  selected: _selectedEquipment.contains(item),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedEquipment.add(item);
                      } else {
                        _selectedEquipment.remove(item);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(flex: 2),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScheduleScreen()));
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
