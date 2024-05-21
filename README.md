# SwiftfulHaptics  📳

Custom haptics for Swift applications.

Sample project: https://github.com/SwiftfulThinking/SwiftfulHapticsExample

### Setup

```swift
import SwiftfulHaptics
```

Add Environment Key to your project.

```swift
private struct HapticManagerKey: EnvironmentKey {
    static let defaultValue: HapticManager = HapticManager()
}

extension EnvironmentValues {
    var haptics: HapticManager {
        get { self[HapticManagerKey.self] }
        set { self[HapticManagerKey.self] = newValue }
    }
}
```

You must prepare a haptic engine before being able to play the haptic. 
Call prepare any time earlier in the lifecycle - on app launch, on screen appear, on cell appear, etc.
Then call play to trigger the haptic.

```swift
Button("Click me) {
     Task {
          try? await haptics.play(option: .medium)
     }
}
.task {
     try? await haptics.prepare(option: .medium)
}
```

Optionally call tearDown to remove the engine from memory. If you do this, you will need to prepare the engine again to use it again.

```swift
.onDisappear {
     Task {
          try? await haptics.tearDown(option: .medium)
     }
}
```

Additional methods:

```swift
func prepare(option: HapticOption) async throws
func prepare(options: [HapticOption]) async throws

func play(option: HapticOption) async throws
func play(options: [HapticOption]) async throws

func tearDown(option: HapticOption) async throws
func tearDown(options: [HapticOption]) async throws
func tearDownAll() async throws
```








