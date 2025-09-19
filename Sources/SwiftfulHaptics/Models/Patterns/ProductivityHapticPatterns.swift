//
//  ProductivityHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct ProductivityHapticPatterns {
    
    // MARK: - Productivity Patterns
    
    static func timerCompleteEvents(duration: Double) -> [CHHapticEvent] {
        // Strong initial completion notification
        let completeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let completeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let completion = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [completeIntensity, completeSharpness],
            relativeTime: 0.0
        )
        
        // Extended declining vibration
        let declineIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let declineSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let timerFade = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [declineIntensity, declineSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [completion, timerFade]
    }
    
    static func timerCompleteCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Declining intensity curve
        let declineCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.1, value: Float(0.0))
            ],
            relativeTime: 0.1
        )
        
        return [declineCurve]
    }
    
    static func taskCheck(duration: Double) -> [CHHapticEvent] {
        // Satisfying check mark completion
        let checkIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let checkSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let checkMark = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [checkIntensity, checkSharpness],
            relativeTime: 0.0
        )
        
        // Brief satisfaction resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let checkResonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [checkMark, checkResonance]
    }
    
    static func focusStart(duration: Double) -> [CHHapticEvent] {
        // Focus mode activation
        let activationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let activationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let activation = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [activationIntensity, activationSharpness],
            relativeTime: 0.0
        )
        
        // Deep focus hum
        let focusIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let focusSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.5))
        let focusHum = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [focusIntensity, focusSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [activation, focusHum]
    }
    
    static func breakReminder(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Gentle reminder pulses
        let pulseCount = 2
        for i in 0..<pulseCount {
            let pulseTime = Double(i) * 0.3
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Soft persistence
        let persistIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let persistSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let persistence = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [persistIntensity, persistSharpness],
            relativeTime: 0.6,
            duration: duration - 0.6
        )
        events.append(persistence)
        
        return events
    }
    
    static func focusReminder(duration: Double) -> [CHHapticEvent] {
        // Gentle attention getter - like a soft tap on the shoulder
        let gentleTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4)),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            ],
            relativeTime: 0.0
        )
        
        // Brief attention wave
        let waveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let waveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let attentionWave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [waveIntensity, waveSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [gentleTap, attentionWave]
    }
}