//
//  HapticOption.swift
//  
//
//  Created by Nick Sarno on 5/20/24.
//

import Foundation
import CoreHaptics

enum HapticError: Error {
    case engineNotPrepared, patternNotFound
}

public enum HapticOption: CaseIterable, Sendable {
    
    // UISelectionFeedbackGenerator
    case selection

    // UIImpactFeedbackGenerator
    case soft
    case rigid
    case light
    case medium
    case heavy
    
    // UINotificationFeedbackGenerator
    case success
    case error
    case warning
        
    // CoreHaptics: CHHapticEngine
    case boing(duration: Double = 0.25)
    case drums
    case heartBeats(count: Int = 3, durationPerBeat: Double = 0.255)
    case inflate(duration: Double = 1.7)
    case oscillate(duration: Double = 3.0)
    
    // Develop can inject custom pattern in to CoreHaptics via CHHapticEngine
    case custom(events: [CHHapticEvent], parameters: [CHHapticDynamicParameter])
    case customCurve(events: [CHHapticEvent], parameterCurves: [CHHapticParameterCurve])
    
    func getCustomPattern() throws -> CHHapticPattern {
        switch self {
        case .boing(duration: let duration):
            return try CustomHapticPatterns.boing(duration: duration)
        case .drums:
            return try CustomHapticPatterns.drums()
        case .heartBeats(count: let count, durationPerBeat: let durationPerBeat):
            return try CustomHapticPatterns.heartbeats(count: count, durationPerBeat: durationPerBeat)
        case .inflate(duration: let duration):
            return try CustomHapticPatterns.inflate(duration: duration)
        case .oscillate(duration: let duration):
            return try CustomHapticPatterns.oscillate(duration: duration)
        case .custom(events: let events, parameters: let parameters):
            return try CHHapticPattern(events: events, parameters: parameters)
        case .customCurve(events: let events, parameterCurves: let parameterCurves):
            return try CHHapticPattern(events: events, parameterCurves: parameterCurves)
        default:
            throw HapticError.patternNotFound
        }
    }
    
    public var rawValue: String {
        switch self {
        case .selection: return "selection"
        case .soft: return "soft"
        case .rigid: return "rigid"
        case .light: return "light"
        case .medium: return "medium"
        case .heavy: return "heavy"
        case .success: return "success"
        case .error: return "error"
        case .warning: return "warning"
        case .boing: return "boing"
        case .drums: return "drums"
        case .heartBeats: return "heartBeats"
        case .inflate: return "inflate"
        case .oscillate: return "oscillate"
        case .custom: return "custom"
        case .customCurve: return "customCurve"
        }
    }
    
    
    public static var allCases: [HapticOption] {
        [
            .selection,
            .soft,
            .rigid,
            .light,
            .medium,
            .heavy,
            .success,
            .error,
            .warning,
            .boing(),
            .drums,
            .heartBeats(),
            .inflate(),
            .oscillate()
        ]
    }
}

