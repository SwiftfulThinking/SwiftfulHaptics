import Foundation
import CoreHaptics
import UIKit

public final actor HapticManager {
    
    @MainActor private var notificationGenerator: UINotificationFeedbackGenerator? = nil
    
    @MainActor private var softGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var lightGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var mediumGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var heavyGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var rigidGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var selectionGenerator: UISelectionFeedbackGenerator? = nil
    
    private var customEngine: CHHapticEngine? = nil
    private var customEngineIsRunning: Bool = false

    public init() {
        
    }
        
    public func prepare(option: HapticOption) async throws {
        try await self.setUpAndPrepareForHaptic(option: option)
    }

    public func prepare(options: [HapticOption]) async throws {
        try await withThrowingTaskGroup(of: Void.self) { group in
            for option in options {
                group.addTask {
                    try await self.setUpAndPrepareForHaptic(option: option)
                }
            }
            
            try await group.waitForAll()
        }
    }
    
    public func tearDown(option: HapticOption) async throws {
        try await removeEngineFromMemory(option: option)
    }

    public func tearDown(options: [HapticOption]) async throws {
        try await withThrowingTaskGroup(of: Void.self) { group in
            for option in options {
                group.addTask {
                    try await self.tearDown(option: option)
                }
            }
            
            try await group.waitForAll()
        }
    }
        
    public func tearDownAll() async throws {
        try await withThrowingTaskGroup(of: Void.self) { group in
            for option in HapticOption.allCases {
                group.addTask {
                    try await self.tearDown(option: option)
                }
            }
            
            try await group.waitForAll()
        }
    }
    
    public func play(option: HapticOption) async throws {
        try await trigger(option: option)
    }
        
    public func play(options: [HapticOption]) async throws {
        try await withThrowingTaskGroup(of: Void.self) { group in
            for option in options {
                group.addTask {
                    try await self.trigger(option: option)
                }
            }
            
            try await group.waitForAll()
        }
    }
    
    private func setUpAndPrepareForHaptic(option: HapticOption) async throws {
        switch option {
        case .light:
            await MainActor.run {
                if lightGenerator == nil {
                    lightGenerator = UIImpactFeedbackGenerator(style: .light)
                }
                lightGenerator?.prepare()
            }
        case .medium:
            await MainActor.run {
                if mediumGenerator == nil {
                    mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
                }
                mediumGenerator?.prepare()
            }
        case .heavy:
            await MainActor.run {
                if heavyGenerator == nil {
                    heavyGenerator = UIImpactFeedbackGenerator(style: .heavy)
                }
                heavyGenerator?.prepare()
            }
        case .soft:
            await MainActor.run {
                if softGenerator == nil {
                    softGenerator = UIImpactFeedbackGenerator(style: .soft)
                }
                softGenerator?.prepare()
            }
        case .rigid:
            await MainActor.run {
                if rigidGenerator == nil {
                    rigidGenerator = UIImpactFeedbackGenerator(style: .rigid)
                }
                rigidGenerator?.prepare()
            }
        case .success, .error, .warning:
            await MainActor.run {
                if notificationGenerator == nil {
                    notificationGenerator = UINotificationFeedbackGenerator()
                }
                notificationGenerator?.prepare()
            }
        case .selection:
            await MainActor.run {
                if selectionGenerator == nil {
                    selectionGenerator = UISelectionFeedbackGenerator()
                }
                selectionGenerator?.prepare()
            }
        case .boing, .drums, .heartBeats, .inflate, .oscillate, .custom, .customCurve:
            try await configureCoreHapticEngine()
        }
    }
    
    private func trigger(option: HapticOption) async throws {
        switch option {
        case .light:
            try await MainActor.run {
                if let lightGenerator {
                    lightGenerator.impactOccurred()
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .medium:
            try await MainActor.run {
                if let mediumGenerator {
                    mediumGenerator.impactOccurred()
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .heavy:
            try await MainActor.run {
                if let heavyGenerator {
                    heavyGenerator.impactOccurred()
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .soft:
            try await MainActor.run {
                if let softGenerator {
                    softGenerator.impactOccurred()
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .rigid:
            try await MainActor.run {
                if let rigidGenerator {
                    rigidGenerator.impactOccurred()
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .success:
            try await MainActor.run {
                if let notificationGenerator {
                    notificationGenerator.notificationOccurred(.success)
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .error:
            try await MainActor.run {
                if let notificationGenerator {
                    notificationGenerator.notificationOccurred(.error)
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .warning:
            try await MainActor.run {
                if let notificationGenerator {
                    notificationGenerator.notificationOccurred(.warning)
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .selection:
            try await MainActor.run {
                if let selectionGenerator {
                    selectionGenerator.selectionChanged()
                } else {
                    throw HapticError.engineNotPrepared
                }
            }
        case .boing, .drums, .heartBeats, .inflate, .oscillate, .custom, .customCurve:
            if let customEngine {
                if !customEngineIsRunning {
                    try await customEngine.start()
                    customEngineIsRunning = true
                }
                
                let pattern = try option.getCustomPattern()
                let player = try customEngine.makePlayer(with: pattern)
                try player.start(atTime: 0)
            } else {
                throw HapticError.engineNotPrepared
            }
        }
    }

    
    private func removeEngineFromMemory(option: HapticOption) async throws {
        switch option {
        case .light:
            await MainActor.run {
                lightGenerator = nil
            }
        case .medium:
            await MainActor.run {
                mediumGenerator = nil
            }
        case .heavy:
            await MainActor.run {
                heavyGenerator = nil
            }
        case .soft:
            await MainActor.run {
                softGenerator = nil
            }
        case .rigid:
            await MainActor.run {
                rigidGenerator = nil
            }
        case .success, .error, .warning:
            await MainActor.run {
                notificationGenerator = nil
            }
        case .selection:
            await MainActor.run {
                selectionGenerator = nil
            }
        case .boing, .drums, .heartBeats, .inflate, .oscillate, .custom, .customCurve:
            try await customEngine?.stop()
            customEngine = nil
            customEngineIsRunning = false
        }
    }
        
    private func configureCoreHapticEngine() async throws {
        // Make sure haptics are supported on the current device
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            printError("Current device does not support Haptics.")
            return
        }

        // Create and configure a haptic engine.
        do {
            // Associate the haptic engine with the default audio session
            // to ensure the correct behavior when playing audio-based haptics.
            let engine = try CHHapticEngine()
            configureEngineCallbacks(engine: engine)
            try await engine.start()
            customEngine = engine
            customEngineIsRunning = true
        } catch let error {
            printError("Engine Creation Error: \(error)")
            throw error
        }
    }
    
    private func configureEngineCallbacks(engine: CHHapticEngine) {
        // The stopped handler alerts you of engine stoppage due to external causes.
        engine.stoppedHandler = { [self] reason in
            printError("The engine stopped for reason: \(reason.rawValue)")
            customEngineIsRunning = false
        }
 
        // The reset handler provides an opportunity for your app to restart the engine in case of failure.
        engine.resetHandler = { [self] in
            // Try restarting the engine.
            printError("The engine reset --> Restarting now!")
            do {
                // Once the haptic starts playing, you can’t stop it, and pressing other buttons layers those haptics on top of any existing haptic patterns in the middle of playback.
                try engine.start()
                customEngineIsRunning = true
            } catch {
                printError("Failed to restart the engine: \(error)")
                customEngineIsRunning = false
            }
        }
    }
    
    private func printError(_ string: String) {
        #if DEBUG
        print("📳 SwiftfulHaptics 📳 -> " + string)
        #endif
    }
    
}
