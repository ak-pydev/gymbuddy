import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'dart:async';

class WorkoutSessionScreen extends StatefulWidget {
  const WorkoutSessionScreen({super.key});

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  int currentExercise = 0;
  int currentSet = 0;
  int totalExercises = 8;
  int totalSets = 3;
  bool isPaused = false;
  int restSeconds = 45;
  Timer? _timer;
  double formScore = 0.92;

  final List<Map<String, dynamic>> exercises = [
    {
      'name': 'Barbell Squat',
      'sets': 3,
      'reps': 10,
      'weight': '135 lbs',
      'muscleGroup': 'Legs',
    },
    {
      'name': 'Bench Press',
      'sets': 3,
      'reps': 8,
      'weight': '155 lbs',
      'muscleGroup': 'Chest',
    },
    {
      'name': 'Deadlift',
      'sets': 3,
      'reps': 6,
      'weight': '225 lbs',
      'muscleGroup': 'Back',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startRestTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startRestTimer() {
    _timer?.cancel();
    setState(() {
      restSeconds = 45;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!isPaused && restSeconds > 0) {
        setState(() {
          restSeconds--;
        });
      }
      if (restSeconds == 0) {
        timer.cancel();
      }
    });
  }

  void _completeSet() {
    if (currentSet < totalSets - 1) {
      setState(() {
        currentSet++;
      });
      _startRestTimer();
    } else if (currentExercise < exercises.length - 1) {
      setState(() {
        currentExercise++;
        currentSet = 0;
      });
      _startRestTimer();
    } else {
      // Workout complete
      _showWorkoutComplete();
    }
  }

  void _showWorkoutComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Workout Complete! 🎉'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Great job! You completed all exercises.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Average Form Score: ${(formScore * 100).toInt()}%',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final exercise = exercises[currentExercise];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              padding: const EdgeInsets.all(AppTheme.spaceMd),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Column(
                    children: [
                      Text(
                        'Full Body Strength',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Exercise ${currentExercise + 1} of ${exercises.length}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Progress Bar
            LinearProgressIndicator(
              value: (currentExercise + 1) / exercises.length,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              minHeight: 4,
            ),

            // Camera View Placeholder
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey[900],
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.videocam_outlined,
                            size: 64,
                            color: Colors.white38,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Camera view goes here',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Real-time pose detection',
                            style: TextStyle(
                              color: Colors.white24,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Form Score Overlay
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Form: ${(formScore * 100).toInt()}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Exercise Info & Controls
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(AppTheme.spaceLg),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Exercise Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exercise['name'],
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${exercise['sets']} sets × ${exercise['reps']} reps • ${exercise['weight']}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            exercise['muscleGroup'],
                            style: TextStyle(
                              color: colorScheme.onPrimaryContainer,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.spaceLg),

                    // Set Tracker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        totalSets,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: index < currentSet
                                ? Colors.green
                                : index == currentSet
                                ? colorScheme.primary
                                : colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: index == currentSet
                                  ? colorScheme.primary
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Set ${index + 1}',
                                style: TextStyle(
                                  color: index <= currentSet
                                      ? Colors.white
                                      : colorScheme.onSurfaceVariant,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (index < currentSet)
                                const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.spaceLg),

                    // Rest Timer
                    if (restSeconds > 0 && currentSet > 0)
                      Container(
                        padding: const EdgeInsets.all(AppTheme.spaceMd),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              color: colorScheme.onSecondaryContainer,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Next: Rest 0:${restSeconds.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                color: colorScheme.onSecondaryContainer,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                    const Spacer(),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              if (currentExercise > 0) {
                                setState(() {
                                  currentExercise--;
                                  currentSet = 0;
                                });
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Previous'),
                          ),
                        ),
                        const SizedBox(width: AppTheme.spaceMd),
                        Expanded(
                          flex: 2,
                          child: FilledButton(
                            onPressed: _completeSet,
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              currentSet < totalSets - 1
                                  ? 'Complete Set'
                                  : 'Next Exercise',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppTheme.spaceMd),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              if (currentExercise < exercises.length - 1) {
                                setState(() {
                                  currentExercise++;
                                  currentSet = 0;
                                });
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Skip'),
                          ),
                        ),
                      ],
                    ),
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
