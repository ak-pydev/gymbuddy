
import 'package:flutter/material.dart';

class WearableConnectivityScreen extends StatelessWidget {
  const WearableConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Your Wearable'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'Connect a wearable to sync your activity.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const _WearableTile(brand: 'Apple Watch'),
            const _WearableTile(brand: 'Fitbit'),
            const _WearableTile(brand: 'Garmin'),
            const _WearableTile(brand: 'Oura'),
            const _WearableTile(brand: 'Other'),
            const Spacer(flex: 2),
            TextButton(
              onPressed: () {},
              child: const Text('Skip for now'),
            ),
             const SizedBox(height: 16),
            FilledButton(
              onPressed: () {},
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class _WearableTile extends StatelessWidget {
  const _WearableTile({required this.brand});
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.watch),
        title: Text(brand),
        trailing: OutlinedButton(
          onPressed: () {},
          child: const Text('Connect'),
        ),
      ),
    );
  }
}
