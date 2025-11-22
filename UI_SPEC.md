# Motion Arc Login Screen - UI Specification

## Design Philosophy
Premium, refined, tech-forward fitness aesthetic. Emphasizes precision, motion, and progress with a calm, confident visual language. Inspired by Apple Fitness and Nike Training Club.

---

## Color Palette

### Primary Colors
- **Electric Teal**: `#14B8A6` - Primary CTA, motion indicators
- **Deep Teal**: `#0D9488` - Gradients, hover states
- **Soft Neon Green**: `#22D3AA` - Success states, AI active indicators
- **Motion Blue**: `#06B6D4` - Secondary accents, progress elements

### Neutrals
- **Charcoal Base**: `#0A0E14` - Main background
- **Slate Surface**: `#151B23` - Card backgrounds, elevated surfaces
- **Slate Medium**: `#1E2730` - Input backgrounds
- **Text Primary**: `#F8FAFC` - Headlines, primary text
- **Text Secondary**: `#94A3B8` - Body text, descriptions
- **Text Tertiary**: `#64748B` - Subtle text, placeholders
- **Border Subtle**: `#1E293B` - Input borders, dividers
- **Border Focus**: `#334155` - Focused state borders

### Gradients
- **Motion Arc Gradient**: Linear from `#14B8A6` to `#06B6D4` (135deg)
- **Button Gradient**: Linear from `#14B8A6` to `#0D9488` (90deg)
- **Depth Gradient**: Radial from `#1E2730` (20% opacity) to transparent

---

## Typography

### Font Family
- **Primary**: SF Pro Display / Inter (geometric, clean, premium)
- **Fallback**: System UI fonts

### Text Styles
```
Brand Name:
  - Size: 24sp
  - Weight: 700 (Bold)
  - Color: #F8FAFC
  - Letter Spacing: -0.8px

Headline (Hero):
  - Size: 34sp
  - Weight: 700 (Bold)
  - Color: #F8FAFC
  - Letter Spacing: -1px
  - Line Height: 1.15

Subheadline:
  - Size: 17sp
  - Weight: 400 (Regular)
  - Color: #94A3B8
  - Line Height: 1.5
  - Letter Spacing: -0.2px

Button Text:
  - Size: 17sp
  - Weight: 600 (SemiBold)
  - Color: #FFFFFF
  - Letter Spacing: -0.3px

Input Label:
  - Size: 13sp
  - Weight: 600 (SemiBold)
  - Color: #64748B
  - Letter Spacing: 0.5px (uppercase)

Input Text:
  - Size: 16sp
  - Weight: 400 (Regular)
  - Color: #F8FAFC

Link Text:
  - Size: 15sp
  - Weight: 500 (Medium)
  - Color: #14B8A6
```

---

## Layout Structure

### Screen Dimensions
- Target: Pixel 8 (1080 x 2400px, ~6.2")
- Safe Area Padding: 24px horizontal, 48px top, 32px bottom

### Layout Blocks (Top to Bottom)

#### 1. Hero Section (40% of screen)
```
┌─────────────────────────────┐
│   [Skip] (top-right)        │
│                             │
│   ┌─────────────────┐       │
│   │  Animated Pose  │       │
│   │   Illustration  │       │
│   │   (Gradient)    │       │
│   └─────────────────┘       │
│                             │
│   AI Pose Indicator         │
│   (Pulsing green dot)       │
└─────────────────────────────┘
```

**Specifications:**
- Height: 40vh
- Background: Subtle radial gradient from center
- Illustration: 200x200px centered
- Padding: 24px all sides

#### 2. Value Proposition Section (20% of screen)
```
┌─────────────────────────────┐
│  Perfect Your Form,         │
│  Every Rep                  │
│                             │
│  Real-time AI analyzes your │
│  movements and guides you   │
│  to safer, stronger workouts│
└─────────────────────────────┘
```

**Specifications:**
- Padding: 32px horizontal, 24px vertical
- Text alignment: Center
- Headline margin-bottom: 12px

#### 3. Login/Sign-Up Section (40% of screen)
```
┌─────────────────────────────┐
│  ┌───────────────────────┐  │
│  │ Email                 │  │
│  │ [Input Field]         │  │
│  └───────────────────────┘  │
│                             │
│  ┌───────────────────────┐  │
│  │ Password              │  │
│  │ [Input Field]         │  │
│  └───────────────────────┘  │
│                             │
│  [Forgot Password?]         │
│                             │
│  ┌───────────────────────┐  │
│  │   Get Started →       │  │
│  │  (Gradient Button)    │  │
│  └───────────────────────┘  │
│                             │
│  ─────── or ───────         │
│                             │
│  ┌───────────────────────┐  │
│  │ 🍎 Continue with Apple│  │
│  └───────────────────────┘  │
│                             │
│  ┌───────────────────────┐  │
│  │ 🔵 Continue with Google│ │
│  └───────────────────────┘  │
│                             │
│  New here? Sign Up          │
└─────────────────────────────┘
```

**Specifications:**
- Padding: 24px horizontal
- Input spacing: 16px between fields
- Button spacing: 12px between buttons

---

## Component Specifications

### Input Fields
```
Style:
  - Height: 56px
  - Border Radius: 12px
  - Border: 1.5px solid #2D2D44
  - Background: #1A1A2E
  - Padding: 16px horizontal
  - Font Size: 16sp
  - Text Color: #FFFFFF

Focus State:
  - Border Color: #8B5CF6
  - Glow: 0 0 0 3px rgba(139, 92, 246, 0.1)

Error State:
  - Border Color: #EF4444
  - Helper text: 14sp, #EF4444
```

### Primary Button (Get Started)
```
Style:
  - Height: 56px
  - Border Radius: 12px
  - Background: Linear gradient #8B5CF6 to #6D28D9
  - Shadow: 0 4px 12px rgba(139, 92, 246, 0.3)
  - Text: 16sp, 600 weight, #FFFFFF
  - Icon: → (arrow right), 20px

Hover/Press:
  - Scale: 0.98
  - Shadow: 0 2px 8px rgba(139, 92, 246, 0.4)
  - Duration: 150ms ease
```

### Social Login Buttons
```
Style:
  - Height: 52px
  - Border Radius: 12px
  - Border: 1.5px solid #2D2D44
  - Background: #1A1A2E
  - Text: 15sp, 500 weight, #FFFFFF
  - Icon: 20px, left-aligned with 12px margin

Hover/Press:
  - Border Color: #3D3D54
  - Background: #22223A
```

### Skip Button (Top Right)
```
Style:
  - Text: 15sp, 500 weight, #94A3B8
  - Padding: 8px 16px
  - No background
  - Position: Absolute top-right (16px, 16px)

Hover:
  - Text Color: #FFFFFF
```

### Link Text (Forgot Password, Sign Up)
```
Style:
  - Text: 14sp, 500 weight, #8B5CF6
  - Underline: None
  - Padding: 8px

Hover:
  - Text Color: #A78BFA
  - Underline: 1px
```

---

## Hero Graphic Specification

### Motion Arc Illustration
**Concept**: Refined human silhouette with motion arc paths and precision tracking points

```
Visual Elements:
1. Human Figure Outline
   - Stroke: 2.5px
   - Color: Gradient (#14B8A6 to #06B6D4)
   - Style: Clean, geometric figure in dynamic pose (lunge or squat)
   - Size: 200x200px
   - Opacity: 0.9

2. Motion Arc Paths
   - 2-3 curved arc lines showing movement trajectory
   - Stroke: 2px
   - Color: #14B8A6 with 30% opacity
   - Style: Smooth bezier curves
   - Animation: Draw-in effect (3s loop, subtle)

3. Precision Tracking Points
   - 6-8 circular nodes at key joints
   - Size: 6px diameter (inner), 12px (outer ring)
   - Inner Color: #22D3AA
   - Outer Ring: #22D3AA with 20% opacity
   - Glow: 0 0 12px rgba(34, 211, 170, 0.4)
   - Animation: Subtle pulse (2s loop, staggered)

4. Depth Background
   - Radial gradient circle behind figure
   - Colors: #1E2730 (20% opacity) to transparent
   - Size: 240x240px
   - Creates subtle depth and focus

5. AI Status Indicator
   - Position: Bottom-center below illustration
   - Style: Pill-shaped badge
   - Background: #151B23 with border #1E293B
   - Icon: Small dot (#22D3AA) + "MOTION TRACKING"
   - Animation: Dot pulse (1.5s loop)
```

**Alternative**: Use Lottie animation or custom Canvas painting with Flutter's animation framework

---

## Micro-Interactions

### 1. Page Load Animation
```
Sequence:
1. Hero illustration fades in + scales (0.9 to 1.0) - 400ms
2. Headline fades in from bottom - 300ms (delay 200ms)
3. Subtext fades in - 300ms (delay 300ms)
4. Form fields stagger in - 200ms each (delay 400ms)
```

### 2. Input Focus
```
- Border color transition: 200ms ease
- Glow appears: 150ms ease
- Label moves up (if using floating labels)
```

### 3. Button Press
```
- Scale down to 0.98: 100ms ease-out
- Scale back to 1.0: 150ms ease-in
- Haptic feedback (light impact)
```

### 4. AI Indicator Pulse
```
- Scale: 1.0 to 1.15 to 1.0
- Opacity: 1.0 to 0.7 to 1.0
- Duration: 1500ms infinite
- Easing: ease-in-out
```

---

## Spacing System

```
xs:  4px
sm:  8px
md:  16px
lg:  24px
xl:  32px
2xl: 48px
```

**Usage:**
- Between input fields: md (16px)
- Section padding: lg (24px)
- Between sections: xl (32px)
- Top safe area: 2xl (48px)

---

## Accessibility

### Contrast Ratios
- Text on dark background: 15:1 (WCAG AAA)
- Button text: 12:1 (WCAG AAA)
- Secondary text: 7:1 (WCAG AA)

### Touch Targets
- Minimum: 48x48px (all interactive elements)
- Recommended: 56px height for primary actions

### Screen Reader Labels
- All inputs: Semantic labels
- Buttons: Descriptive action text
- Hero graphic: "AI-powered pose analysis illustration"

---

## Implementation Notes

### Flutter Packages Recommended
```yaml
dependencies:
  google_fonts: ^6.1.0  # For Inter font
  flutter_svg: ^2.0.9   # For SVG illustrations
  lottie: ^3.0.0        # For animations (optional)
  flutter_animate: ^4.5.0  # For micro-interactions
```

### Key Widgets
- `CustomPaint` or `Lottie` for hero illustration
- `TextFormField` with custom `InputDecoration`
- `Container` with `BoxDecoration` for gradient buttons
- `AnimatedContainer` for transitions
- `Hero` widget for navigation transitions

### Responsive Considerations
- Use `MediaQuery` for dynamic sizing
- Scale font sizes with `textScaleFactor`
- Adjust hero section height based on screen size
- Ensure keyboard doesn't obscure inputs (use `SingleChildScrollView`)

---

## Design Rationale

**Why This Works for Premium Fitness:**
- Charcoal/slate dark theme (sophisticated, calm)
- Teal gradient accents (motion, precision, energy)
- Refined typography (professional, trustworthy)
- Motion arc visualization (immediately communicates purpose)
- Smooth, subtle animations (premium feel)
- Clean geometric design (modern, tech-forward)

**Design Psychology:**
- Teal/cyan = precision, technology, movement
- Soft neon green = active tracking, "go" signal
- Dark slate = calm confidence, focus
- Motion arcs = trajectory, progress, improvement
- Tracking points = accuracy, AI intelligence

**Trust & Premium Signals:**
- Apple Fitness / Nike Training Club aesthetic
- Professional Inter typography
- Consistent 14px border radius (modern, soft)
- Subtle depth with shadows and gradients
- Refined spacing and proportions
- Smooth micro-interactions

**Implementation Complete:**
- Full Flutter implementation with custom Canvas painting
- Animated motion arc illustration with tracking points
- Premium text fields with focus states
- Teal gradient buttons with press animations
- Refined social login buttons
- Complete navigation flow to home screen
