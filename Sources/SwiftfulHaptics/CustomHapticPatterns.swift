//
//  CustomHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 5/20/24.
//

import Foundation
import CoreHaptics

// Adapted from Apple's Custom Haptics project: https://developer.apple.com/documentation/corehaptics/playing-a-custom-haptic-pattern-from-a-file
// Note: did not adapt Gravel, Rumble, or Sparkle yet.

struct CustomHapticPatterns {
    
    static func boing(duration: Double) throws -> CHHapticPattern {
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.4)
        let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0)
        
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.4)
        let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity2, sharpness2], relativeTime: 0.015, duration: duration)
        
        let curve1 = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 1.0),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: 0.5),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: 0.0),
        ], relativeTime: 0.015)

        let curve2 = CHHapticParameterCurve(parameterID: .hapticSharpnessControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.0),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: -0.3),
        ], relativeTime: 0.015)

        return try CHHapticPattern(events: [event1, event2], parameterCurves: [curve1, curve2])
    }
    
    static func drums() throws -> CHHapticPattern {
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
        let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness1], relativeTime: 0)

        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let event2 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness2, intensity2], relativeTime: 0.391)

        let sharpness3 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let intensity3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let event3 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness3, intensity3], relativeTime: 0.8)

        let sharpness4 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
        let intensity4 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let event4 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness4, intensity4], relativeTime: 1.2)

        let sharpness5 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
        let intensity5 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let event5 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness5, intensity5], relativeTime: 1.41)

        let sharpness6 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
        let event6 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness6], relativeTime: 1.6)

        let intensity7 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6)
        let event7 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity7], relativeTime: 0.0, duration: 0.2)

        let intensity8 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let event8 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity8], relativeTime: 0.2, duration: 0.2)

        let intensity9 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.25)
        let sharpness9 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let event9 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity9, sharpness9], relativeTime: 0.4, duration: 0.15)

        let intensity10 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.25)
        let sharpness10 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let event10 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity10, sharpness10], relativeTime: 0.8, duration: 0.15)

        let intensity11 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.25)
        let sharpness11 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let event11 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity11, sharpness11], relativeTime: 1.2, duration: 0.15)

        let intensity12 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.45)
        let sharpness12 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
        let decay12 = CHHapticEventParameter(parameterID: .decayTime, value: 1.0)
        let sustained12 = CHHapticEventParameter(parameterID: .sustained, value: 0.0)
        let event12 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity12, sharpness12, decay12, sustained12], relativeTime: 1.6, duration: 1.0)

        return try CHHapticPattern(events: [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12], parameters: [])
    }
        
    static func heartbeats(count: Int, durationPerBeat: Double) throws -> CHHapticPattern {
        var events: [CHHapticEvent] = []
        
        for x in 0..<count {
            let pauseBetweenBeats: Double = (durationPerBeat * 3) * Double(x)
            let beatTimeSoFar: Double = durationPerBeat * Double(x)
            let baseline = beatTimeSoFar + pauseBetweenBeats
            
            let sharpness1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
            let intensity1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
            let relative1 = 0.0
            let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: relative1)

            let sharpness2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
            let intensity2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
            let relative2 = (0.013/0.255) * durationPerBeat + baseline
            let event2 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness2], relativeTime: relative2)

            let sharpness3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
            let intensity3 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
            let relative3 = (0.220/0.255) * durationPerBeat + baseline
            let event3 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity3, sharpness3], relativeTime: relative3)

            let sharpness4 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7)
            let intensity4 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
            let relative4 = durationPerBeat + baseline
            let event4 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity4, sharpness4], relativeTime: relative4)
            
            events.append(contentsOf: [event1, event2, event3, event4])
        }
        
        return try CHHapticPattern(events: events, parameters: [])
    }
    
    static func inflate(duration: Double) throws -> CHHapticPattern {
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let intensity1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let event1 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness1], relativeTime: 0.0, duration: duration)

        let curve1 = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.0),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration / 2, value: 0.5),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: 0.0),
        ], relativeTime: 0.0)

        let curve2 = CHHapticParameterCurve(parameterID: .hapticSharpnessControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: -0.8),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: 0.8),
        ], relativeTime: 0.0)

        return try CHHapticPattern(events: [event1], parameterCurves: [curve1, curve2])
    }

    static func oscillate(duration: Double) throws -> CHHapticPattern {
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
        let event1 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness1], relativeTime: 0, duration: duration)
        
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.075)
        let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity2, sharpness2], relativeTime: 0, duration: duration)

        let curve = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 1.0),
            CHHapticParameterCurve.ControlPoint(relativeTime: (0.5/3.0) * duration, value: 1.0),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: 0.0),
        ], relativeTime: 0.0)

        return try CHHapticPattern(events: [event1, event2], parameterCurves: [curve])
    }
}
