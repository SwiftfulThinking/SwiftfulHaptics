//
//  HapticWrapper.swift
//  SwiftfulHaptics
//
//  Created by Nicholas Sarno on 12/18/24.
//
import SwiftUI

import UIKit
import CoreHaptics

protocol HapticEngine {
    func prepare()
    func trigger(event: Any?) throws
    func reset()
}

extension UIImpactFeedbackGenerator: HapticEngine {
    func trigger(event: Any? = nil) throws {
        self.impactOccurred()
    }
    
    func reset() {
        
    }
}
//
//extension UISelectionFeedbackGenerator: HapticEngine {
//    func trigger(event: Any? = nil) throws {
//        self.selectionChanged()
//    }
//    
//    func reset() {
//        // No-op for `UISelectionFeedbackGenerator`
//    }
//}
//
//extension UINotificationFeedbackGenerator: HapticEngine {
//    func trigger(event: Any?) throws {
//        guard let feedbackType = event as? UINotificationFeedbackGenerator.FeedbackType else {
//            throw HapticError.invalidEvent
//        }
//        self.notificationOccurred(feedbackType)
//    }
//    
//    func reset() {
//        // No-op for `UINotificationFeedbackGenerator`
//    }
//}

//class CoreHapticEngineWrapper: HapticEngine {
//    private let engine: CHHapticEngine
//    private var isRunning: Bool = false
//
//    init() throws {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
//            throw HapticError.unsupported
//        }
//        self.engine = try CHHapticEngine()
//        self.engine.isAutoShutdownEnabled = true
//    }
//
//    func prepare() {
//        do {
//            if !isRunning {
//                try engine.start()
//                isRunning = true
//            }
//        } catch {
//            print("Failed to start haptic engine: \(error)")
//        }
//    }
//
//    func trigger(event: Any?) throws {
//        guard let pattern = event as? CHHapticPattern else {
//            throw HapticError.invalidEvent
//        }
//        let player = try engine.makePlayer(with: pattern)
//        try player.start(atTime: 0)
//    }
//
//    func reset() {
//        do {
//            try engine.stop()
//            isRunning = false
//        } catch {
//            print("Failed to stop haptic engine: \(error)")
//        }
//    }
//}



//class HapticWrapper<T> {
//    
//    private var engine: T?
//    private var createEngine: () -> T
//    private var prepareEngine: (T) -> Void
//    private var playEngine: (HapticOption, T) -> Void
//
//    init(
//        createEngine: @escaping () -> T,
//        prepareEngine: @escaping (T) -> Void,
//        playEngine: @escaping (HapticOption, T) -> Void
//    ) {
//        self.createEngine = createEngine
//        self.prepareEngine = prepareEngine
//        self.playEngine = playEngine
//    }
//    
//    private func createEngineIfNeeded() -> T {
//        if let engine {
//            return engine
//        }
//        return createEngine()
//    }
//    
//    func prepare() {
//        let engine = createEngineIfNeeded()
//        prepareEngine(engine)
//    }
//    
//    func play(option: HapticOption) throws {
//        let engine = createEngineIfNeeded()
//        playEngine(option, engine)
//    }
//    
//}


//@propertyWrapper
//struct HapticWrapper<T: HapticEngine> {
//    private var engine: T?
//    private let createEngine: () -> T
//
//    init(createEngine: @escaping () -> T) {
//        self.createEngine = createEngine
//    }
//
//    var wrappedValue: T {
//        mutating get {
//            createEngineIfNeeded()
//            return engine!
//        }
//        mutating set {
//            engine = newValue
//        }
//    }
//    
//    mutating private func createEngineIfNeeded() {
//        if engine == nil {
//            engine = createEngine()
//        }
//    }
//
//    mutating func prepare() {
//        createEngineIfNeeded()
//        engine?.prepare()
//    }
//
//    mutating func trigger(event: Any?) throws {
//        try engine?.trigger(event: event)
//    }
//
//    mutating func reset() {
//        engine?.reset()
//        engine = nil
//    }
//}
