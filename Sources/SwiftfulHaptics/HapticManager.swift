import Foundation
import CoreHaptics
import UIKit

public final actor HapticManager {
    private let logger: HapticLogger?
    
    @MainActor private var notificationGenerator: UINotificationFeedbackGenerator? = nil
    
    @MainActor private var softGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var lightGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var mediumGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var heavyGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var rigidGenerator: UIImpactFeedbackGenerator? = nil
    @MainActor private var selectionGenerator: UISelectionFeedbackGenerator? = nil
    
    private var customEngine: CHHapticEngine? = nil
    private var customEngineIsRunning: Bool = false

    public init(logger: HapticLogger? = nil) {
        self.logger = logger
    }
    
    // MARK: PREPARE
        
    public func prepare(option: HapticOption) {
        Task {
            await self.setUpAndPrepareForHaptic(option: option)
        }
    }

    public func prepare(options: [HapticOption]) {
        Task {
            await withTaskGroup(of: Void.self) { group in
                for option in options {
                    group.addTask {
                        await self.setUpAndPrepareForHaptic(option: option)
                    }
                }
                
                await group.waitForAll()
            }
        }
    }
    
    // MARK: TEAR DOWN
    
    public func tearDown(option: HapticOption) {
        Task {
            await removeEngineFromMemory(option: option)
        }
    }

    public func tearDown(options: [HapticOption]) {
        Task {
            await withTaskGroup(of: Void.self) { group in
                for option in options {
                    group.addTask {
                        await self.removeEngineFromMemory(option: option)
                    }
                }
                
                await group.waitForAll()
            }
        }
    }
        
    public func tearDownAll() {
        Task {
            // Since HapticOption is no longer CaseIterable with the new structure,
            // we'll tear down all generators and the custom engine
            await MainActor.run {
                notificationGenerator = nil
                softGenerator = nil
                lightGenerator = nil
                mediumGenerator = nil
                heavyGenerator = nil
                rigidGenerator = nil
                selectionGenerator = nil
            }
            
            do {
                try await customEngine?.stop()
                customEngine = nil
                customEngineIsRunning = false
            } catch {
                trackEvent(event: .customEngineFail(error: error))
            }
        }
    }
    
    // MARK: PLAY
    
    public func play(option: HapticOption) {
        Task {
            await trigger(option: option)
        }
    }
        
    public func play(options: [HapticOption]) {
        Task {
            await withTaskGroup(of: Void.self) { group in
                for option in options {
                    group.addTask {
                        await self.trigger(option: option)
                    }
                }
                
                await group.waitForAll()
            }
        }
    }
    
    // MARK: PRIVATE
    
    // Create engine if needed, then prepare engine if needed.
    private func setUpAndPrepareForHaptic(option: HapticOption) async {
        switch option {
        case .basic(let basicHaptic):
            switch basicHaptic {
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
            }
        case .gaming, .educational, .uiInteraction, .specialEffect, .wellness, .productivity, .finance, .emotional, .intenseGamification, .custom, .customCurve:
            if customEngine == nil {
                await setUpAndPrepareCustomHapticEngine()
            }
        }
    }
    
    private func trigger(option: HapticOption) async {
        switch option {
        case .basic(let basicHaptic):
            switch basicHaptic {
            case .light:
                await MainActor.run {
                    if lightGenerator == nil {
                        lightGenerator = UIImpactFeedbackGenerator(style: .light)
                    }
                    if let lightGenerator {
                        lightGenerator.impactOccurred()
                    }
                }
            case .medium:
                await MainActor.run {
                    if mediumGenerator == nil {
                        mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
                    }
                    mediumGenerator?.impactOccurred()
                }
            case .heavy:
                await MainActor.run {
                    if heavyGenerator == nil {
                        heavyGenerator = UIImpactFeedbackGenerator(style: .heavy)
                    }
                    heavyGenerator?.impactOccurred()
                }
            case .soft:
                await MainActor.run {
                    if softGenerator == nil {
                        softGenerator = UIImpactFeedbackGenerator(style: .soft)
                    }
                    softGenerator?.impactOccurred()
                }
            case .rigid:
                await MainActor.run {
                    if rigidGenerator == nil {
                        rigidGenerator = UIImpactFeedbackGenerator(style: .rigid)
                    }
                    rigidGenerator?.impactOccurred()
                }
            case .success:
                await MainActor.run {
                    if notificationGenerator == nil {
                        notificationGenerator = UINotificationFeedbackGenerator()
                    }
                    notificationGenerator?.notificationOccurred(.success)
                }
            case .warning:
                await MainActor.run {
                    if notificationGenerator == nil {
                        notificationGenerator = UINotificationFeedbackGenerator()
                    }
                    notificationGenerator?.notificationOccurred(.warning)
                }
            case .error:
                await MainActor.run {
                    if notificationGenerator == nil {
                        notificationGenerator = UINotificationFeedbackGenerator()
                    }
                    notificationGenerator?.notificationOccurred(.error)
                }
            case .selection:
                await MainActor.run {
                    if selectionGenerator == nil {
                        selectionGenerator = UISelectionFeedbackGenerator()
                    }
                    selectionGenerator?.selectionChanged()
                }
            }
        case .gaming, .educational, .uiInteraction, .specialEffect, .wellness, .productivity, .finance, .emotional, .intenseGamification, .custom, .customCurve:
            if !customEngineIsRunning {
                await setUpAndPrepareCustomHapticEngine()
            }
            
            do {
                let pattern = try option.getCustomPattern()
                let player = try customEngine?.makePlayer(with: pattern)
                try player?.start(atTime: 0)
            } catch {
                trackEvent(event: .customPatternNotFound)
            }
        }
    }
    
    private func removeEngineFromMemory(option: HapticOption) async {
        switch option {
        case .basic(let basicHaptic):
            switch basicHaptic {
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
            }
        case .gaming, .educational, .uiInteraction, .specialEffect, .wellness, .productivity, .finance, .emotional, .intenseGamification, .custom, .customCurve:
            do {
                try await customEngine?.stop()
                customEngine = nil
                customEngineIsRunning = false
            } catch {
                trackEvent(event: .customEngineFail(error: error))
            }
        }
    }
        
    private func setUpAndPrepareCustomHapticEngine() async {
        // Make sure haptics are supported on the current device
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            trackEvent(event: .customHapticsNotSupported)
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
            trackEvent(event: .customEngineFail(error: error))
        }
    }
    
    private func configureEngineCallbacks(engine: CHHapticEngine) {
        // The stopped handler alerts you of engine stoppage due to external causes.
        engine.stoppedHandler = { [self] reason in
            /*
             CHHapticEngineStoppedReasonAudioSessionInterrupt    = 1,
             CHHapticEngineStoppedReasonApplicationSuspended        = 2,
             CHHapticEngineStoppedReasonIdleTimeout                = 3,
             CHHapticEngineStoppedReasonNotifyWhenFinished        = 4,
             CHHapticEngineStoppedReasonEngineDestroyed          = 5,
             CHHapticEngineStoppedReasonGameControllerDisconnect = 6,
             CHHapticEngineStoppedReasonSystemError                = -1
             */
            trackEvent(event: .customEngineStopped(reason: reason.rawValue))
            customEngineIsRunning = false
        }
 
        // The reset handler provides an opportunity for your app to restart the engine in case of failure.
        engine.resetHandler = { [self] in
            // Try restarting the engine.
            trackEvent(event: .customEngineRestart)
            do {
                // Once the haptic starts playing, you can’t stop it, and pressing other buttons layers those haptics on top of any existing haptic patterns in the middle of playback.
                try engine.start()
                customEngineIsRunning = true
            } catch {
                trackEvent(event: .customEngineRestartFail(error: error))
                customEngineIsRunning = false
            }
        }
    }
    
    private func trackEvent(event: Event) {
        Task {
            await logger?.trackEvent(event: event)
        }
    }
    
}

extension HapticManager {
    
    enum Event: HapticLogEvent {
        case customHapticsNotSupported
        case customEngineFail(error: Error)
        case customEngineStopped(reason: Int)
        case customEngineRestart
        case customEngineRestartFail(error: Error)
        case customEngineNotPrepared
        case customPatternNotFound
        case wrongGenerator // should never happen, means bug herein
        
        var eventName: String {
            switch self {
            case .customHapticsNotSupported:          return "Haptics_CustomEngine_NotSupported"
            case .customEngineFail:                   return "Haptics_CustomEngine_Fail"
            case .customEngineStopped:                return "Haptics_CustomEngine_Stop"
            case .customEngineRestart:                return "Haptics_CustomEngine_Restart"
            case .customEngineRestartFail:            return "Haptics_CustomEngine_RestartFail"
            case .customEngineNotPrepared:            return "Haptics_CustomEngine_NotPrepared"
            case .customPatternNotFound:              return "Haptics_CustomEngine_NotFound"
            case .wrongGenerator:                     return "Haptics_WrongGenerator"
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .customEngineFail(let error), .customEngineRestartFail(error: let error):
                return error.eventParameters
            case .customEngineStopped(let reason):
                return ["reason_value": reason]
            default:
                return nil
            }
        }
        
        var type: HapticLogType {
            switch self {
            case .customEngineFail, .customEngineRestartFail, .wrongGenerator:
                return .severe
            default:
                return .analytic
            }
        }
    }
}
