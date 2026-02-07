# SwiftfulHaptics 📳

A comprehensive haptic feedback library for iOS. SwiftfulHaptics provides 200+ pre-designed haptic patterns across 12 categories, from basic iOS haptics to complex CoreHaptics effects.

Sample project: https://github.com/SwiftfulThinking/SwiftfulHapticsExample

## Features

- **200+ pre-designed haptic patterns** across 12 specialized categories
- **Thread-safe actor-based design** with modern Swift concurrency
- **Simple synchronous API** with async behavior internalized
- **Flat enum** for easy autocomplete discovery
- **Optional preparation** for reduced latency
- **Memory management** with selective teardown
- **Custom haptic support** for advanced CoreHaptics patterns
- **Optional logging** for analytics integration

## Setup

<details>
<summary> Details (Click to expand) </summary>
<br>

Add SwiftfulHaptics to your project.

```
https://github.com/SwiftfulThinking/SwiftfulHaptics.git
```

Import the package.

```swift
import SwiftfulHaptics
```

Create a `HapticManager` instance.

```swift
// Basic setup
let hapticManager = HapticManager()

// With optional logger for analytics
let hapticManager = HapticManager(logger: yourLogger)
```

</details>

## Quick Start

<details>
<summary> Details (Click to expand) </summary>
<br>

Just play a haptic — no preparation needed.

```swift
hapticManager.playHaptic(option: .success)
hapticManager.playHaptic(option: .explosionMassive())
hapticManager.playHaptic(option: .doubleTapLike())
```

For better performance, prepare haptics before playing them.

```swift
// Prepare on screen appear
hapticManager.prepareHaptic(option: .coinCollectSingle())

// Play when needed
hapticManager.playHaptic(option: .coinCollectSingle())

// Clean up when done
hapticManager.tearDownHaptic(option: .coinCollectSingle())
```

</details>

## API Reference

<details>
<summary> Details (Click to expand) </summary>
<br>

All public methods are **synchronous** (`nonisolated`) with async behavior handled internally.

```swift
// Preparation (optional - improves first-play latency)
func prepareHaptic(option: HapticOption)
func prepareHaptics(options: [HapticOption])

// Playback
func playHaptic(option: HapticOption)
func playHaptics(options: [HapticOption])

// Memory management (optional)
func tearDownHaptic(option: HapticOption)
func tearDownHaptics(options: [HapticOption])
func tearDownAllHaptics()
```

### When to Use Each Method

**`prepareHaptic()`** — Optional performance optimization
- Pre-initializes feedback generators or CoreHaptics engine
- Reduces first-play latency
- Best practice: call during screen appear for haptics you expect to use

**`playHaptic()`** — Core functionality
- Creates generators on-demand if not prepared
- Thread-safe: can be called from any context
- Multiple haptics can play simultaneously

**`tearDownHaptic()`** — Optional memory management
- Frees generators and engine resources
- Best practice: call during screen disappear or memory warnings

</details>

## Basic Haptics (9)

<details>
<summary> Details (Click to expand) </summary>
<br>

Standard iOS feedback generators. No CoreHaptics engine required — lowest latency.

```swift
// UISelectionFeedbackGenerator
.selection

// UIImpactFeedbackGenerator
.soft
.rigid
.light
.medium
.heavy

// UINotificationFeedbackGenerator
.success
.error
.warning
```

</details>

## Gaming Haptics (25)

<details>
<summary> Details (Click to expand) </summary>
<br>

All gaming haptics use CoreHaptics and accept an optional `duration` parameter with sensible defaults.

```swift
// Lightning Effects
.lightningStrikeQuick(duration: 0.3)
.lightningStrikeChain(duration: 1.2)
.lightningStrikeHeavy(duration: 1.5)

// Coin Collection
.coinCollectSingle(duration: 0.15)
.coinCollectMulti(duration: 0.8)
.coinCollectJackpot(duration: 2.0)

// Combat
.swordSlashLight(duration: 0.25)
.swordSlashHeavy(duration: 0.6)
.arrowRelease(duration: 0.5)
.shieldBlock(duration: 0.35)
.criticalHit(duration: 0.5)
.comboHit3x(duration: 0.8)
.comboHit5x(duration: 1.2)

// Explosions
.explosionSmall(duration: 0.4)
.explosionMassive(duration: 1.8)

// Movement & Effects
.footstepGrass(duration: 0.2)
.footstepMetal(duration: 0.2)
.engineStart(duration: 2.0)
.turboBoost(duration: 1.5)
.portalEnter(duration: 0.8)
.magicCharge(duration: 1.0)
.machineGun(duration: 2.0)
.cascade(duration: 0.8)
.elasticBounce(duration: 2.0)
.drums
```

</details>

## Educational Haptics (77)

<details>
<summary> Details (Click to expand) </summary>
<br>

Designed for learning apps and gamified education.

### Achievements

```swift
.achievementUnlocked(duration: 1.2)
.levelUp(duration: 1.5)
.starRating(count: 3, duration: 0.2)
.badgeEarned(duration: 0.8)
.streakMilestone(duration: 1.0)
.perfectScore(duration: 1.0)
.rankPromotion(duration: 1.5)
.dailyGoalComplete(duration: 1.0)
.trophyUnlock(duration: 1.8)
.questComplete(duration: 1.5)
.highScore(duration: 1.5)
.masteryAchieved(duration: 2.0)
.correctAnswerBasic(duration: 0.2)
.correctAnswerSimple(duration: 0.25)
.correctAnswerStreak(streakCount: 3, duration: 0.5)
.correctAnswerPerfect(duration: 0.8)
.perfectLessonComplete(duration: 2.0)
.badgeUnlock(duration: 0.8)
.skillMastery(duration: 1.5)
.leaguePromotion(duration: 1.5)
.celebrationBurst(duration: 1.0)
.ascendingSuccess(duration: 0.6)
```

### Learning Feedback

```swift
.correctAnswer(duration: 0.3)
.incorrectGentle(duration: 0.4)
.hintAvailable(duration: 0.5)
.progressCheckpoint(duration: 0.6)
.encouragementTap(duration: 0.3)
.skillUnlocked(duration: 0.8)
.lessonComplete(duration: 1.0)
.practiceReminder(duration: 0.5)
.knowledgeGained(duration: 0.7)
.feedbackPositive(duration: 0.4)
.wrongAnswerGentle(duration: 0.5)
.wrongAnswerStandard(duration: 0.3)
.nearMissAnswer(duration: 0.35)
.grammarError(duration: 0.25)
.hintActivation(duration: 0.3)
.hintReveal(duration: 0.3)
.timeCriticalWarning(duration: 0.8)
.partialCredit(duration: 0.4)
.tryAgainEncouragement(duration: 0.3)
.learningProgress(duration: 0.5)
.educationalFocusReminder(duration: 0.3)
.flashcardFlip(duration: 0.2)
.quizStart(duration: 1.0)
```

### Gamification

```swift
.xpGainSmall(duration: 0.3)
.xpGainLarge(duration: 1.0)
.xpGainBonus(duration: 0.5)
.xpGainDynamic(xpAmount: 100, duration: 0.3)
.bonusPoints(duration: 0.7)
.powerUpCollected(duration: 0.5)
.lifeGained(duration: 0.6)
.challengeAccepted(duration: 0.5)
.timerTick(duration: 0.1)
.rewardUnlock(duration: 1.0)
.progressBarFill(duration: 0.8)
.progressBarFilling(startPercent: 0.0, endPercent: 1.0, duration: 1.0)
.progress25(duration: 0.2)
.progress50(duration: 0.3)
.progress75(duration: 0.4)
.dailyGoalCheckpoint(checkpointNumber: 1, duration: 0.5)
.leagueAdvancement(duration: 1.2)
.crownGemCollection(duration: 0.6)
.powerUpActivation(powerUpType: "speed", duration: 0.5)
.challengeCompletion(isPerfect: true, duration: 1.0)
.lessonPathProgress(nodeType: "standard", duration: 0.4)
.socialFeatureNotification(notificationType: "default", duration: 0.6)
.comboMultiplier(count: 3, duration: 0.6)
.streakRiskWarning(duration: 0.6)
.streakLost(duration: 0.5)
.streakBuilding(streakCount: 5, duration: 0.5)
.streakMilestone5(duration: 0.6)
.streakMilestone7Days(duration: 1.0)
.streakMilestone10(duration: 0.8)
.streakMilestone25(duration: 1.2)
.streakMilestone30Days(duration: 1.5)
.streakMilestone100Days(duration: 2.0)
```

</details>

## UI Interaction Haptics (41)

<details>
<summary> Details (Click to expand) </summary>
<br>

Enhance user interface interactions with subtle feedback.

### Social Media

```swift
.doubleTapLike(duration: 0.2)
.messageSent(duration: 0.25)
.notificationPop(duration: 0.3)
.typingIndicator(duration: 0.1)
.commentPosted(duration: 0.2)
```

### Navigation

```swift
.pullToRefresh(duration: 0.4)
.swipeAction(duration: 0.25, actionType: "default")
.toggleSwitch(duration: 0.2)
.pickerDetent(duration: 0.1)
.longPressActivation(duration: 0.4)
.tabSelection(duration: 0.15)
.navigationPush(duration: 0.25)
.navigationPop(duration: 0.2)
.modalPresent(duration: 0.3)
.modalDismiss(duration: 0.25)
```

### Input & Controls

```swift
.keyboardTap(duration: 0.05)
.sliderStep(duration: 0.05)
.sliderTick(duration: 0.05)
.buttonPress(duration: 0.03)
.selectionTick(duration: 0.1)
.segmentChange(duration: 0.15)
.zoomBoundary(duration: 0.2)
.dragAndDrop(duration: 0.25, phase: "start")
.formSubmit(duration: 0.3)
.inputError(duration: 0.4)
.loadingComplete(duration: 0.5)
.appIconTap(duration: 0.15)
```

### Additional

```swift
.scrollBounce(duration: 0.3)
.pageFlip(duration: 0.3)
.photoCapture(duration: 0.2)
.shareAction(duration: 0.3)
.downloadComplete(duration: 0.5)
.refreshData(duration: 0.4)
.gestureRecognized(duration: 0.2)
.pageTurn(duration: 0.3)
.bookPageTurn(duration: 0.25)
.softTick(duration: 0.3)
.customPop(duration: 0.15)
.contextualMenu(duration: 0.25)
.sliderValueChange(duration: 0.06)
.pop(duration: 0.2)
```

</details>

## Special Effect Haptics (12)

<details>
<summary> Details (Click to expand) </summary>
<br>

Creative and atmospheric effects.

```swift
.magicSparkle(duration: 1.2)
.waterDrop(duration: 0.6)
.specialEarthquake(duration: 2.5)
.laserBeam(duration: 0.8)
.typewriter(duration: 0.04)
.heartbeat(duration: 1.5)
.electricSpark(duration: 0.3)
.rubberBand(duration: 0.4)
.buildUp(duration: 2.0)
.boing(duration: 0.25)
.inflate(duration: 1.7)
.oscillate(duration: 3.0)
```

</details>

## Wellness Haptics (8)

<details>
<summary> Details (Click to expand) </summary>
<br>

Designed for meditation, health, and wellness apps.

```swift
.breathingGuide(duration: 4.0)
.calmPulse(duration: 2.0)
.meditationBell(duration: 1.5)
.relaxationWave(duration: 3.0)
.zenNotification(duration: 1.2)
.timeWarning30s(duration: 0.5)
.timeWarning10s(duration: 0.8)
.heartBeats(count: 3, durationPerBeat: 0.255)
```

</details>

## Productivity Haptics (5)

<details>
<summary> Details (Click to expand) </summary>
<br>

For work and productivity applications.

```swift
.timerComplete(duration: 1.5)
.taskCheck(duration: 0.2)
.focusStart(duration: 0.8)
.breakReminder(duration: 1.2)
.productivityFocusReminder(duration: 0.25)
```

</details>

## Finance Haptics (4)

<details>
<summary> Details (Click to expand) </summary>
<br>

For payment and financial applications.

```swift
.paymentSuccess(duration: 0.1)
.paymentProcessing(duration: 2.0)
.transactionAlert(duration: 0.5)
.receiptSaved(duration: 0.4)
```

</details>

## Emotional Haptics (5)

<details>
<summary> Details (Click to expand) </summary>
<br>

Convey emotions through haptic feedback.

```swift
.excitementBuild(duration: 2.0)
.disappointment(duration: 0.8)
.surprise(duration: 0.5)
.joy(duration: 1.2)
.anticipation(duration: 2.0)
```

</details>

## Intense Gamification Haptics (33)

<details>
<summary> Details (Click to expand) </summary>
<br>

High-intensity effects for immersive gaming experiences.

### Elemental Powers

```swift
.fireBurst(duration: 1.0)
.iceShard(duration: 1.5)
.earthquakeRumble(duration: 2.5)
.windTornado(duration: 1.8)
.thunderStorm(duration: 2.5)
.meteorImpact(duration: 3.0)
.intenseEarthquake(duration: 2.5)
.intenseTornado(duration: 1.8)
```

### Space & Sci-Fi

```swift
.plasmaCharge(duration: 1.5)
.gravityWell(duration: 2.0)
.photonBlast(duration: 0.8)
.quantumShift(duration: 0.6)
.rocketLaunch(duration: 3.0)
.warpDrive(duration: 2.0)
.laserCannon(duration: 0.5)
.alienTeleport(duration: 1.0)
.spaceExplosion(duration: 2.5)
```

### Epic Abilities

```swift
.ultimatePower(duration: 3.0)
.dragonRoar(duration: 2.0)
.titanSmash(duration: 1.5)
.dimensionalRift(duration: 2.5)
.volcanicEruption(duration: 3.5)
.titanStomp(duration: 1.5)
.phoenixRebirth(duration: 2.0)
.divineIntervention(duration: 2.5)
```

### Power-ups & Boosts

```swift
.megaBoost(duration: 1.5)
.starPower(duration: 2.0)
.berserkerRage(duration: 2.0)
.divineShield(duration: 1.5)
.invincibilityActivation(duration: 2.0)
.timeFreeze(duration: 2.5)
.ultraCombo(duration: 3.0)
.nuclearCharge(duration: 2.5)
```

</details>

## Ratings & Feedback Haptics (4)

<details>
<summary> Details (Click to expand) </summary>
<br>

For rating systems and social feedback.

```swift
.starRating1(duration: 0.1)
.starRating3(duration: 0.3)
.starRating5(duration: 0.8)
.socialNotification(notificationType: "like", duration: 0.4)
```

</details>

## Tools & Writing Haptics (2)

<details>
<summary> Details (Click to expand) </summary>
<br>

For drawing and text input experiences.

```swift
.pencilWrite(duration: 0.05)
.eraserUse(duration: 0.2)
```

</details>

## Custom Haptics (2)

<details>
<summary> Details (Click to expand) </summary>
<br>

For advanced custom patterns using CoreHaptics directly.

```swift
// Custom with dynamic parameters
.custom(events: [CHHapticEvent], parameters: [CHHapticDynamicParameter])

// Custom with parameter curves
.customCurve(events: [CHHapticEvent], parameterCurves: [CHHapticParameterCurve])
```

</details>

## Logging Integration

<details>
<summary> Details (Click to expand) </summary>
<br>

SwiftfulHaptics supports optional logging for analytics.

```swift
// Implement the HapticLogger protocol
class MyAnalytics: HapticLogger {
    func trackEvent(event: HapticLogEvent) {
        print("Haptic: \(event.eventName)")
    }

    func addUserProperties(dict: [String: Any], isHighPriority: Bool) {
        // Add user properties for analytics
    }
}

// Initialize with logger
let hapticManager = HapticManager(logger: MyAnalytics())
```

Or use [SwiftfulLogging](https://github.com/SwiftfulThinking/SwiftfulLogging) directly.

```swift
let logManager = LogManager(services: [
    ConsoleService(printParameters: true),
    FirebaseCrashlyticsService(),
    MixpanelService()
])

let hapticManager = HapticManager(logger: logManager)
```

</details>

## Performance Tips

<details>
<summary> Details (Click to expand) </summary>
<br>

1. **Prepare frequently-used haptics** during screen appear
2. **Use tearDownHaptic()** during screen disappear or memory warnings
3. **Basic haptics** (`.light`, `.medium`, `.success`, etc.) have the lowest latency
4. **Custom haptics** require CoreHaptics engine initialization (higher latency on first use)
5. **Batch operations** can prepare or play multiple haptics at once

</details>

## Claude Code

This package includes a `.claude/swiftful-haptics-rules.md` with usage guidelines, haptic selection advice, and integration patterns for projects using [Claude Code](https://claude.ai/claude-code).

## Platform Support

- **iOS 13.0+**

## Contribute

<details>
<summary> Details (Click to expand) </summary>
<br>

Open a PR to add new haptic patterns! Follow the existing pattern structure in the `Models/Patterns/` directory and add your custom haptic to the appropriate category.

</details>

## License

SwiftfulHaptics is available under the MIT license.
