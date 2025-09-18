//
//  EmotionalHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct EmotionalHapticPatterns {
    
    // MARK: - Emotional Patterns
    
    static func excitementBuildEvents(duration: Double) -> [CHHapticEvent] {
        // Building excitement with accelerating pulses
        var events: [CHHapticEvent] = []
        let pulseCount = 8
        
        for i in 0..<pulseCount {
            // Accelerating timing - starts slow, gets faster
            let normalizedTime = Double(i) / Double(pulseCount - 1)
            let acceleratedTime = normalizedTime * normalizedTime
            let pulseTime = acceleratedTime * duration
            
            // Increasing intensity
            let intensity = Float(0.3 + (0.5 * normalizedTime))
            let sharpness = Float(0.4 + (0.4 * normalizedTime))
            
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        return events
    }
    
    static func excitementBuildCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Overall building curve
        let buildCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.9))
            ],
            relativeTime: 0.0
        )
        
        return [buildCurve]
    }
    
    static func disappointmentEvents(duration: Double) -> [CHHapticEvent] {
        // Initial impact of disappointment
        let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let impact = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [impactIntensity, impactSharpness],
            relativeTime: 0.0
        )
        
        // Descending energy drain
        let drainIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let drainSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.2))
        let energyDrain = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [drainIntensity, drainSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [impact, energyDrain]
    }
    
    static func disappointmentCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Descending disappointment curve
        let disappointmentCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.1, value: Float(0.0))
            ],
            relativeTime: 0.1
        )
        
        return [disappointmentCurve]
    }
    
    static func surprise(duration: Double) -> [CHHapticEvent] {
        // Brief pause, then sudden burst
        let pauseDuration = duration * 0.3
        
        // Sudden surprise burst
        let surpriseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let surpriseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let surpriseBurst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [surpriseIntensity, surpriseSharpness],
            relativeTime: pauseDuration
        )
        
        // Quick realization resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let realization = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: pauseDuration + 0.02,
            duration: duration - pauseDuration - 0.02
        )
        
        return [surpriseBurst, realization]
    }
    
    static func joy(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Joyful bounces
        let bounceCount = 4
        for i in 0..<bounceCount {
            let bounceTime = Double(i) * (duration / Double(bounceCount))
            let bounceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let bounceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let bounce = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [bounceIntensity, bounceSharpness],
                relativeTime: bounceTime
            )
            events.append(bounce)
            
            // Light vibration between bounces
            if i < bounceCount - 1 {
                let vibrateIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
                let vibrateSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
                let vibration = CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [vibrateIntensity, vibrateSharpness],
                    relativeTime: bounceTime + 0.05,
                    duration: (duration / Double(bounceCount)) - 0.1
                )
                events.append(vibration)
            }
        }
        
        return events
    }
    
    static func anticipation(duration: Double) -> [CHHapticEvent] {
        // Building tension with subtle vibration
        let tensionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let tensionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let tension = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tensionIntensity, tensionSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        return [tension]
    }
    
    static func anticipationCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Gradually building anticipation
        let anticipationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.7))
            ],
            relativeTime: 0.0
        )
        
        return [anticipationCurve]
    }
}