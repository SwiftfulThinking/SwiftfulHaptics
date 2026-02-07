# SwiftfulHaptics

Actor-based haptic feedback library. 200+ patterns as a flat `HapticOption` enum. iOS only.

## API

- `HapticManager` is an `actor` but all public methods are `nonisolated` — no `await` needed
- `playHaptic(option:)` fires a haptic immediately; creates the generator on-demand if not prepared
- `prepareHaptic(option:)` pre-initializes the generator for lower first-play latency
- `tearDownHaptic(option:)` frees the generator; `tearDownAllHaptics()` frees everything
- Batch variants: `playHaptics(options:)`, `prepareHaptics(options:)`, `tearDownHaptics(options:)` accept arrays
- Basic haptics (`.light`, `.medium`, `.success`, etc.) use UIKit generators — lowest latency
- All other haptics use CoreHaptics engine — slightly higher latency on first use

```swift
let hapticManager = HapticManager()

// Optional logger for analytics
let hapticManager = HapticManager(logger: yourLogger)
```

### Play

```swift
// Single haptic
hapticManager.playHaptic(option: .success)
hapticManager.playHaptic(option: .levelUp())

// Multiple haptics simultaneously
hapticManager.playHaptics(options: [.success, .celebrationBurst()])
```

### Prepare

```swift
// Pre-initialize for lower latency on first play
hapticManager.prepareHaptic(option: .light)

// Batch prepare
hapticManager.prepareHaptics(options: [.light, .success, .coinCollectSingle()])
```

### Tear Down

```swift
// Free a specific generator
hapticManager.tearDownHaptic(option: .light)

// Free multiple generators
hapticManager.tearDownHaptics(options: [.light, .success])

// Free all generators and the CoreHaptics engine
hapticManager.tearDownAllHaptics()
```

## Integration

Conform your logger to `HapticLogger` to receive internal engine events:

```swift
extension YourLogManager: @retroactive HapticLogger {
    public func trackEvent(event: any HapticLogEvent) {
        trackEvent(eventName: event.eventName, parameters: event.parameters, type: event.type)
    }
    public func addUserProperties(dict: [String: Any], isHighPriority: Bool) {
        // forward to your analytics
    }
}
```

## Haptic Selection Guide

IMPORTANT: Default to basic haptics for nearly all interactions. Only reach for CoreHaptics patterns for truly unique or branded moments.

### Use basic haptics for standard UI

- **Button taps, CTAs:** `.light` or `.medium`
- **Toggle/switch changes:** `.soft` or `.selection`
- **Tab switches, segment changes:** `.selection`
- **Success confirmations:** `.success`
- **Error states:** `.error`
- **Destructive action warnings:** `.warning`

### Use CoreHaptics patterns sparingly for branded moments

- **Purchase completed:** `.paymentSuccess()`
- **Achievement unlocked:** `.achievementUnlocked()`
- **Level up / milestone:** `.levelUp()`, `.streakMilestone()`
- **Celebration:** `.celebrationBurst()`, `.joy()`

### Don't over-haptic

- NEVER add haptics to every interaction — reserve for CTAs and meaningful UX moments
- NEVER fire haptics on continuous events (scrolling, dragging, rapid typing)
- A screen should typically have 1-3 haptic touch points, not one on every element
- Match intensity to importance: a casual tap is `.light`, a purchase confirmation is `.success`
- When in doubt, skip the haptic — absence of haptics is better than overuse

## Lifecycle

Prepare haptics on screen appear for lower latency. Tear down is optional — only needed if you want to explicitly free resources.

```swift
.onAppear {
    hapticManager.prepareHaptics(options: [.light, .success])
}
```

This matters most for CoreHaptics patterns. Basic haptics have low enough latency that skipping prepare is acceptable for non-latency-sensitive interactions.

### VIPER Integration

In a VIPER architecture, haptics flow through three layers:

```swift
// View — triggers presenter on appear
.onAppear {
    presenter.onViewAppear()
}

// Presenter — decides which haptics to prepare
func onViewAppear() {
    interactor.prepareHaptic(option: .light)
}

// Presenter — plays haptic on user action
func onButtonTapped() {
    interactor.playHaptic(option: .light)
}

// Interactor — protocol that wraps HapticManager
protocol GlobalInteractor {
    func prepareHaptic(option: HapticOption)
    func prepareHaptics(options: [HapticOption])
    func playHaptic(option: HapticOption)
    func playHaptics(options: [HapticOption])
    func tearDownHaptic(option: HapticOption)
    func tearDownHaptics(options: [HapticOption])
    func tearDownAllHaptics()
}
```
