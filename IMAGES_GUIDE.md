# Images Guide for Motion Arc

## Where to Get Free Fitness Images

### Recommended Free Stock Photo Sites:
1. **Unsplash** (https://unsplash.com)
   - Search: "fitness", "workout", "gym", "exercise"
   - License: Free to use

2. **Pexels** (https://pexels.com)
   - Search: "fitness training", "gym workout", "exercise form"
   - License: Free to use

3. **Pixabay** (https://pixabay.com)
   - Search: "fitness", "workout", "training"
   - License: Free to use

## Images Needed

Add these images to `assets/images/` folder:

### 1. workout_hero.jpg (1200x800px)
- **What**: Person doing workout with good form
- **Search terms**: "fitness workout", "gym training", "exercise form"
- **Usage**: Hero card on home screen

### 2. form_analysis.jpg (800x600px)
- **What**: Close-up of exercise form or AI/tech concept
- **Search terms**: "fitness technology", "workout form", "exercise technique"
- **Usage**: AI Form Analysis feature card

### 3. progress_tracking.jpg (800x600px)
- **What**: Fitness progress, charts, or achievement
- **Search terms**: "fitness progress", "workout achievement", "training goals"
- **Usage**: Progress feature card

### 4. workout_stats.jpg (800x600px)
- **What**: Fitness stats, smartwatch, or data visualization
- **Search terms**: "fitness stats", "workout data", "training metrics"
- **Usage**: Stats section

### 5. empty_state.png (400x400px)
- **What**: Simple illustration for empty states
- **Search terms**: "empty state illustration", "no data illustration"
- **Usage**: When user has no workouts

## How to Add Images

1. Download images from the sites above
2. Resize them to recommended dimensions (use any image editor)
3. Save them in `assets/images/` folder with the exact names above
4. Run `flutter pub get`
5. Hot restart the app

## Current Image Structure

```
assets/
├── motion_arc_logo.png (your logo)
└── images/
    ├── workout_hero.jpg
    ├── form_analysis.jpg
    ├── progress_tracking.jpg
    ├── workout_stats.jpg
    └── empty_state.png
```

## Alternative: Use Placeholder Images

If you want to test first, I can update the code to use:
- Material Icons (current)
- Colored containers as placeholders
- Gradient backgrounds

Let me know which approach you prefer!
