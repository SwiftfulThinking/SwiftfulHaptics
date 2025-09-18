//
//  HapticOption.swift
//  
//
//  Created by Nick Sarno on 5/20/24.
//

import Foundation
@preconcurrency import CoreHaptics

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
    case pop(duration: Double = 0.2)
    
    // Develop can inject custom pattern in to CoreHaptics via CHHapticEngine
    case custom(events: [CHHapticEvent], parameters: [CHHapticDynamicParameter])
    case customCurve(events: [CHHapticEvent], parameterCurves: [CHHapticParameterCurve])
    
    func getCustomPattern() throws -> CHHapticPattern {
        switch self {
        case .boing(duration: let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.boingEvents(duration: duration), 
                                      parameterCurves: SpecialEffectHapticPatterns.boingCurves(duration: duration))
        case .drums:
            return try CHHapticPattern(events: GamingHapticPatterns.drumsEvents(), parameters: [])
        case .heartBeats(count: let count, durationPerBeat: let durationPerBeat):
            return try CHHapticPattern(events: WellnessHapticPatterns.heartbeatsEvents(count: count, durationPerBeat: durationPerBeat), 
                                      parameters: [])
        case .inflate(duration: let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.inflateEvents(duration: duration), 
                                      parameterCurves: SpecialEffectHapticPatterns.inflateCurves(duration: duration))
        case .oscillate(duration: let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.oscillateEvents(duration: duration), 
                                      parameterCurves: SpecialEffectHapticPatterns.oscillateCurves(duration: duration))
        case .pop(duration: let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.popEvents(duration: duration), 
                                      parameterCurves: UIInteractionHapticPatterns.popCurves(duration: duration))
        case .custom(events: let events, parameters: let parameters):
            return try CHHapticPattern(events: events, parameters: parameters)
        case .customCurve(events: let events, parameterCurves: let parameterCurves):
            return try CHHapticPattern(events: events, parameterCurves: parameterCurves)
        // These shouldn't need custom patterns
        case .selection, .soft, .rigid, .light, .medium, .heavy, .success, .error, .warning:
            throw URLError(.unknown)
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
        case .pop: return "pop"
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
            .oscillate(),
            .pop()
        ]
    }
}

