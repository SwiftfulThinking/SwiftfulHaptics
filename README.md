# SwiftfulHaptics 📳

A comprehensive haptic feedback library for iOS, macOS, and tvOS applications. SwiftfulHaptics provides 147 pre-designed haptic patterns across 10 categories, from basic iOS haptics to complex gaming effects.

Sample project: https://github.com/SwiftfulThinking/SwiftfulHapticsExample

## Features

- **147 pre-designed haptic patterns** across 10 specialized categories
- **Thread-safe actor-based design** with modern Swift concurrency
- **Simple synchronous API** with async behavior internalized
- **Optional preparation** for reduced latency
- **Memory management** with selective teardown
- **Custom haptic support** for advanced patterns
- **Optional logging** for analytics integration

## Setup

Add SwiftfulHaptics to your project and import it:

```swift
import SwiftfulHaptics

// Basic setup
let hapticManager = HapticManager()

// With optional logger for analytics
let hapticManager = HapticManager(logger: yourHapticLogger)
```

## Quick Start

The simplest way to use SwiftfulHaptics:

```swift
// Just play a haptic - no preparation needed
hapticManager.play(option: .basic(.success))
hapticManager.play(option: .gaming(.explosionMassive()))
hapticManager.play(option: .uiInteraction(.doubleTapLike()))
```

## API Reference

### Core Methods

All public methods are **synchronous** with async behavior handled internally:

```swift
// Preparation (optional - improves first-play performance)
func prepare(option: HapticOption)
func prepare(options: [HapticOption])

// Playback
func play(option: HapticOption)  
func play(options: [HapticOption])

// Memory management (optional)
func tearDown(option: HapticOption)
func tearDown(options: [HapticOption])
func tearDownAll()
```

### Usage Patterns

#### Basic Usage
```swift
// Simple one-off haptics
hapticManager.play(option: .basic(.heavy))
hapticManager.play(option: .educational(.levelUp()))
```

#### Optimized Usage (Recommended for Frequent Haptics)
```swift
// Prepare frequently-used haptics for better performance
hapticManager.prepare(option: .gaming(.explosionMassive()))
hapticManager.prepare(options: [
    .uiInteraction(.doubleTapLike()),
    .basic(.selection),
    .wellness(.heartBeats())
])

// Later, play with reduced latency
hapticManager.play(option: .gaming(.explosionMassive()))
```

#### Batch Operations
```swift
// Play multiple haptics simultaneously
hapticManager.play(options: [
    .basic(.success),
    .emotional(.joy()),
    .specialEffect(.magicSparkle())
])

// Clean up when done (optional)
hapticManager.tearDown(options: [
    .gaming(.explosionMassive()),
    .wellness(.heartBeats())
])
```

### When to Use Each Method

#### `prepare()` - Optional Performance Optimization
- **Use when**: You know which haptics will be played frequently
- **Benefits**: Reduces first-play latency by pre-initializing engines
- **Not required**: Haptics will still play without preparation
- **Best practice**: Prepare during app startup or scene loading

#### `play()` - Core Functionality  
- **Always works**: Creates engines on-demand if not prepared
- **Thread-safe**: Can be called from any thread
- **Concurrent**: Multiple haptics can play simultaneously

#### `tearDown()` - Optional Memory Management
- **Use when**: You want to free memory for unused haptics
- **Automatic**: iOS will clean up engines as needed
- **Best practice**: Call during memory warnings or scene cleanup

## Complete Haptic Options (147 Total)

### Basic Haptics (9 options)
Standard iOS feedback generators:
```swift
.basic(.selection)       // UISelectionFeedbackGenerator
.basic(.soft)           // UIImpactFeedbackGenerator
.basic(.rigid)
.basic(.light)  
.basic(.medium)
.basic(.heavy)
.basic(.success)        // UINotificationFeedbackGenerator
.basic(.error)
.basic(.warning)
```

### Gaming Haptics (22 options)
Designed for game interactions with customizable durations:

```swift
// Lightning Effects
.gaming(.lightningStrikeQuick(duration: 0.3))      // Default: 0.3s
.gaming(.lightningStrikeChain(duration: 1.2))      // Default: 1.2s  
.gaming(.lightningStrikeHeavy(duration: 1.5))      // Default: 1.5s

// Coin Collection
.gaming(.coinCollectSingle(duration: 0.15))        // Default: 0.15s
.gaming(.coinCollectMulti(duration: 0.8))          // Default: 0.8s
.gaming(.coinCollectJackpot(duration: 2.0))        // Default: 2.0s

// Combat
.gaming(.swordSlashLight(duration: 0.25))          // Default: 0.25s
.gaming(.swordSlashHeavy(duration: 0.6))           // Default: 0.6s
.gaming(.arrowRelease(duration: 0.5))              // Default: 0.5s
.gaming(.explosionSmall(duration: 0.4))            // Default: 0.4s
.gaming(.explosionMassive(duration: 1.8))          // Default: 1.8s
.gaming(.shieldBlock(duration: 0.35))              // Default: 0.35s
.gaming(.criticalHit(duration: 0.5))               // Default: 0.5s
.gaming(.comboHit3x(duration: 0.8))                // Default: 0.8s
.gaming(.comboHit5x(duration: 1.2))                // Default: 1.2s

// Movement & Effects  
.gaming(.footstepGrass(duration: 0.2))             // Default: 0.2s
.gaming(.footstepMetal(duration: 0.2))             // Default: 0.2s
.gaming(.engineStart(duration: 2.0))               // Default: 2.0s
.gaming(.turboBoost(duration: 1.5))                // Default: 1.5s
.gaming(.portalEnter(duration: 0.8))               // Default: 0.8s
.gaming(.magicCharge(duration: 1.0))               // Default: 1.0s
.gaming(.machineGun(duration: 2.0))                // Default: 2.0s
.gaming(.drums)                                     // No parameters
```

### Educational Haptics (30 options)
Perfect for learning apps and gamified education:

```swift
// Achievements
.educational(.achievementUnlocked(duration: 1.2))   // Default: 1.2s
.educational(.levelUp(duration: 1.5))               // Default: 1.5s
.educational(.starRating(count: 3, duration: 0.2))  // Default: count=3, duration=0.2s
.educational(.badgeEarned(duration: 0.8))           // Default: 0.8s
.educational(.streakMilestone(duration: 1.0))       // Default: 1.0s
.educational(.perfectScore(duration: 2.0))          // Default: 2.0s
.educational(.rankPromotion(duration: 1.5))         // Default: 1.5s
.educational(.dailyGoalComplete(duration: 1.0))     // Default: 1.0s
.educational(.trophyUnlock(duration: 1.8))          // Default: 1.8s
.educational(.questComplete(duration: 1.5))         // Default: 1.5s
.educational(.highScore(duration: 1.5))             // Default: 1.5s
.educational(.masteryAchieved(duration: 2.0))       // Default: 2.0s

// Learning Feedback
.educational(.correctAnswer(duration: 0.3))         // Default: 0.3s
.educational(.incorrectGentle(duration: 0.4))       // Default: 0.4s
.educational(.hintAvailable(duration: 0.5))         // Default: 0.5s
.educational(.progressCheckpoint(duration: 0.6))    // Default: 0.6s
.educational(.encouragementTap(duration: 0.3))      // Default: 0.3s
.educational(.skillUnlocked(duration: 0.8))         // Default: 0.8s
.educational(.lessonComplete(duration: 1.0))        // Default: 1.0s
.educational(.practiceReminder(duration: 0.5))      // Default: 0.5s
.educational(.knowledgeGained(duration: 0.7))       // Default: 0.7s
.educational(.feedbackPositive(duration: 0.4))      // Default: 0.4s

// Gamification
.educational(.xpGainSmall(duration: 0.3))           // Default: 0.3s
.educational(.xpGainLarge(duration: 1.0))           // Default: 1.0s
.educational(.bonusPoints(duration: 0.7))           // Default: 0.7s
.educational(.powerUpCollected(duration: 0.5))      // Default: 0.5s
.educational(.lifeGained(duration: 0.6))            // Default: 0.6s
.educational(.challengeAccepted(duration: 0.5))     // Default: 0.5s
.educational(.timerTick(duration: 0.1))             // Default: 0.1s
.educational(.rewardUnlock(duration: 1.0))          // Default: 1.0s
.educational(.progressBarFill(duration: 0.8))       // Default: 0.8s
.educational(.comboMultiplier(count: 3, duration: 0.6))  // Default: count=3, duration=0.6s
```

### UI Interaction Haptics (35 options)
Enhance user interface interactions:

```swift
// Social Media
.uiInteraction(.doubleTapLike(duration: 0.2))       // Default: 0.2s
.uiInteraction(.messageSent(duration: 0.25))        // Default: 0.25s
.uiInteraction(.notificationPop(duration: 0.3))     // Default: 0.3s
.uiInteraction(.typingIndicator(duration: 0.1))     // Default: 0.1s
.uiInteraction(.commentPosted(duration: 0.2))       // Default: 0.2s

// Navigation
.uiInteraction(.pullToRefresh(duration: 0.5))       // Default: 0.5s
.uiInteraction(.swipeAction(duration: 0.25, actionType: "default"))  // Default: 0.25s, actionType="default"
.uiInteraction(.toggleSwitch(duration: 0.2))        // Default: 0.2s
.uiInteraction(.pickerDetent(duration: 0.1))        // Default: 0.1s
.uiInteraction(.longPressActivation(duration: 0.4)) // Default: 0.4s
.uiInteraction(.tabSelection(duration: 0.15))       // Default: 0.15s
.uiInteraction(.navigationPush(duration: 0.25))     // Default: 0.25s
.uiInteraction(.navigationPop(duration: 0.2))       // Default: 0.2s
.uiInteraction(.modalPresent(duration: 0.3))        // Default: 0.3s
.uiInteraction(.modalDismiss(duration: 0.25))       // Default: 0.25s

// Input & Controls
.uiInteraction(.keyboardTap(duration: 0.05))        // Default: 0.05s
.uiInteraction(.sliderStep(duration: 0.05))         // Default: 0.05s
.uiInteraction(.selectionTick(duration: 0.1))       // Default: 0.1s
.uiInteraction(.segmentChange(duration: 0.15))      // Default: 0.15s
.uiInteraction(.zoomBoundary(duration: 0.2))        // Default: 0.2s
.uiInteraction(.dragAndDrop(duration: 0.25, phase: "start"))  // Default: 0.25s, phase="start"
.uiInteraction(.formSubmit(duration: 0.3))          // Default: 0.3s
.uiInteraction(.inputError(duration: 0.4))          // Default: 0.4s
.uiInteraction(.loadingComplete(duration: 0.5))     // Default: 0.5s
.uiInteraction(.appIconTap(duration: 0.15))         // Default: 0.15s

// Additional Interactions
.uiInteraction(.scrollBounce(duration: 0.3))        // Default: 0.3s
.uiInteraction(.pageFlip(duration: 0.3))            // Default: 0.3s
.uiInteraction(.photoCapture(duration: 0.2))        // Default: 0.2s
.uiInteraction(.shareAction(duration: 0.3))         // Default: 0.3s
.uiInteraction(.downloadComplete(duration: 0.5))    // Default: 0.5s
.uiInteraction(.refreshData(duration: 0.4))         // Default: 0.4s
.uiInteraction(.gestureRecognized(duration: 0.2))   // Default: 0.2s
.uiInteraction(.pageTurn(duration: 0.3))            // Default: 0.3s
.uiInteraction(.customPop(duration: 0.15))          // Default: 0.15s
.uiInteraction(.pop(duration: 0.2))                 // Default: 0.2s (Apple-inspired)
```

### Special Effect Haptics (10 options)
Creative and atmospheric effects:

```swift
.specialEffect(.magicSparkle(duration: 1.0))        // Default: 1.0s
.specialEffect(.waterDrop(duration: 0.6))           // Default: 0.6s
.specialEffect(.earthquake(duration: 2.0))          // Default: 2.0s
.specialEffect(.laserBeam(duration: 0.8))           // Default: 0.8s
.specialEffect(.typewriter(duration: 0.05))         // Default: 0.05s
.specialEffect(.rubberBand(duration: 0.5))          // Default: 0.5s
.specialEffect(.electricSpark(duration: 0.3))       // Default: 0.3s
.specialEffect(.boing(duration: 0.25))              // Default: 0.25s (Apple-inspired)
.specialEffect(.inflate(duration: 1.7))             // Default: 1.7s (Apple-inspired)
.specialEffect(.oscillate(duration: 3.0))           // Default: 3.0s (Apple-inspired)
```

### Wellness Haptics (6 options)
Designed for meditation, health, and wellness apps:

```swift
.wellness(.breathingGuide(duration: 4.0))           // Default: 4.0s
.wellness(.calmPulse(duration: 2.0))                // Default: 2.0s
.wellness(.meditationBell(duration: 1.5))           // Default: 1.5s
.wellness(.relaxationWave(duration: 3.0))           // Default: 3.0s
.wellness(.zenNotification(duration: 1.2))          // Default: 1.2s
.wellness(.heartBeats(count: 3, durationPerBeat: 0.255))  // Default: count=3, durationPerBeat=0.255s (Apple-inspired)
```

### Productivity Haptics (4 options)
For work and productivity applications:

```swift
.productivity(.timerComplete(duration: 1.0))        // Default: 1.0s
.productivity(.taskCheck(duration: 0.3))            // Default: 0.3s
.productivity(.focusStart(duration: 0.8))           // Default: 0.8s
.productivity(.breakReminder(duration: 1.2))        // Default: 1.2s
```

### Finance Haptics (4 options)
For payment and financial applications:

```swift
.finance(.paymentSuccess(duration: 0.6))            // Default: 0.6s
.finance(.paymentProcessing(duration: 1.5))         // Default: 1.5s
.finance(.transactionAlert(duration: 0.5))          // Default: 0.5s
.finance(.receiptSaved(duration: 0.4))              // Default: 0.4s
```

### Emotional Haptics (5 options)
Convey emotions through haptic feedback:

```swift
.emotional(.excitementBuild(duration: 1.5))         // Default: 1.5s
.emotional(.disappointment(duration: 1.0))          // Default: 1.0s
.emotional(.surprise(duration: 0.5))                // Default: 0.5s
.emotional(.joy(duration: 1.2))                     // Default: 1.2s
.emotional(.anticipation(duration: 2.0))            // Default: 2.0s
```

### Intense Gamification Haptics (20 options)
High-intensity effects for immersive gaming:

```swift
// Elemental Powers
.intenseGamification(.fireBurst(duration: 1.0))     // Default: 1.0s
.intenseGamification(.iceShard(duration: 1.5))      // Default: 1.5s
.intenseGamification(.earthquakeRumble(duration: 2.5))  // Default: 2.5s
.intenseGamification(.windTornado(duration: 1.8))   // Default: 1.8s

// Space & Sci-Fi
.intenseGamification(.plasmaCharge(duration: 1.5))  // Default: 1.5s
.intenseGamification(.gravityWell(duration: 2.0))   // Default: 2.0s
.intenseGamification(.photonBlast(duration: 0.8))   // Default: 0.8s
.intenseGamification(.quantumShift(duration: 0.6))  // Default: 0.6s
.intenseGamification(.rocketLaunch(duration: 3.0))  // Default: 3.0s
.intenseGamification(.warpDrive(duration: 2.0))     // Default: 2.0s
.intenseGamification(.laserCannon(duration: 0.5))   // Default: 0.5s
.intenseGamification(.alienTeleport(duration: 1.0)) // Default: 1.0s
.intenseGamification(.spaceExplosion(duration: 2.5)) // Default: 2.5s

// Epic Abilities
.intenseGamification(.ultimatePower(duration: 3.0)) // Default: 3.0s
.intenseGamification(.dragonRoar(duration: 2.0))    // Default: 2.0s
.intenseGamification(.titanSmash(duration: 1.5))    // Default: 1.5s
.intenseGamification(.dimensionalRift(duration: 2.5)) // Default: 2.5s
.intenseGamification(.volcanicEruption(duration: 3.5)) // Default: 3.5s

// Power-ups & Boosts
.intenseGamification(.megaBoost(duration: 1.2))     // Default: 1.2s
.intenseGamification(.starPower(duration: 2.0))     // Default: 2.0s
.intenseGamification(.berserkerRage(duration: 2.5)) // Default: 2.5s
.intenseGamification(.divineShield(duration: 1.5))  // Default: 1.5s
```

### Custom Haptics (2 types)
For advanced custom patterns using CoreHaptics:

```swift
// Custom with dynamic parameters
.custom(
    events: [CHHapticEvent], 
    parameters: [CHHapticDynamicParameter]
)

// Custom with parameter curves  
.customCurve(
    events: [CHHapticEvent], 
    parameterCurves: [CHHapticParameterCurve]
)
```

## Logging Integration

SwiftfulHaptics supports optional logging for analytics:

```swift
// Implement the HapticLogger protocol
class MyAnalytics: HapticLogger {
    func trackEvent(event: HapticLogEvent) {
        // Send haptic events to your analytics service
        print("Haptic Event: \(event.eventName)")
        if let params = event.parameters {
            print("Parameters: \(params)")
        }
    }
    
    func addUserProperties(dict: [String: Any], isHighPriority: Bool) {
        // Add user properties for analytics
    }
}

// Initialize HapticManager with logger
let analytics = MyAnalytics()
let hapticManager = HapticManager(logger: analytics)
```

## Performance Tips

1. **Prepare frequently-used haptics** during app startup or scene loading
2. **Use tearDown()** during memory warnings to free unused engines  
3. **Basic haptics** (.basic) have the lowest latency and memory usage
4. **Custom haptics** require CoreHaptics engine initialization (higher latency on first use)
5. **Batch operations** can improve performance when dealing with multiple haptics

## Platform Support

- **iOS 13.0+** - Full functionality including CoreHaptics
- **macOS 12.0+** - Limited to basic haptics (no CoreHaptics support)
- **tvOS 13.0+** - Limited haptic support

## Contribute

Open a PR to add new haptic patterns! Follow the existing pattern structure and add your custom haptic to the appropriate category.

## License

SwiftfulHaptics is available under the MIT license.