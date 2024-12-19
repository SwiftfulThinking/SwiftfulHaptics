# SwiftfulHaptics  📳

Custom haptics for Swift applications.

Sample project: https://github.com/SwiftfulThinking/SwiftfulHapticsExample

## Setup

```swift
import SwiftfulHaptics

let hapticManager = HapticManager(logger: HapticLogger?)
let hapticManager = HapticManager()
```

## Usage

Call prepare prior to triggering a haptic to improve response time the first time the haptic is played. This is not required.

```swift
Task {
     await hapticManager.prepare(option: option)
}
```

Then call play to trigger the haptic.

```swift
Task {
     await hapticManager.play(option: option)
}
```

Call tearDown to remove the haptic engine from memory. This is not required.

```swift
Task {
     await hapticManager.tearDown(option: option)
}
```

All methods:

```swift
func prepare(option: HapticOption) async
func prepare(options: [HapticOption]) async

func play(option: HapticOption) async
func play(options: [HapticOption]) async

func tearDown(option: HapticOption) async
func tearDown(options: [HapticOption]) async
func tearDownAll() async throws
```

## Haptics

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
        
// CoreHaptics: CHHapticEngine
.boing()
.boing(duration: 0.25)
.drums
.heartBeats()
.heartBeats(count: 3, durationPerBeat: 0.255)
.inflate()
.inflate(duration: 1.7)
.oscillate()
.oscillate(duration: 3.0)
.pop()
.pop(duration: 0.2)
    
// Developer can inject custom pattern in to CoreHaptics
.custom(events: [CHHapticEvent], parameters: [CHHapticDynamicParameter])
.customCurve(events: [CHHapticEvent], parameterCurves: [CHHapticParameterCurve])

```

## Contribute

Open a PR to add a custom pattern as an option within the framework.





