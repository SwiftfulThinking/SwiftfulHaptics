//
//  WellnessHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct WellnessHapticPatterns {
    
    // MARK: - Wellness & Meditation Patterns
    
    static func breathingGuideEvents(duration: Double) -> [CHHapticEvent] {
        // Inhale phase - gentle building pressure
        let inhaleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let inhaleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.5))
        let inhale = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [inhaleIntensity, inhaleSharpness],
            relativeTime: 0.0,
            duration: duration * 0.4
        )
        
        // Hold phase - steady gentle pressure
        let holdTime = duration * 0.4
        let holdIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let holdSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.7))
        let hold = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [holdIntensity, holdSharpness],
            relativeTime: holdTime,
            duration: duration * 0.2
        )
        
        // Exhale phase - gentle release
        let exhaleTime = duration * 0.6
        let exhaleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let exhaleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.8))
        let exhale = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [exhaleIntensity, exhaleSharpness],
            relativeTime: exhaleTime,
            duration: duration * 0.4
        )
        
        return [inhale, hold, exhale]
    }
    
    static func breathingGuideCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Inhale curve - gradual building
        let inhaleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.5))
            ],
            relativeTime: 0.0
        )
        
        // Exhale curve - gentle release
        let exhaleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.0))
            ],
            relativeTime: duration * 0.6
        )
        
        return [inhaleCurve, exhaleCurve]
    }
    
    static func calmPulseEvents(duration: Double) -> [CHHapticEvent] {
        // Create 3-4 gentle heartbeat-like pulses
        var events: [CHHapticEvent] = []
        let pulseCount = 4
        let pulseDuration = 0.15
        let timeBetweenPulses = (duration - (Double(pulseCount) * pulseDuration)) / Double(pulseCount - 1)
        
        for i in 0..<pulseCount {
            let pulseTime = Double(i) * (pulseDuration + timeBetweenPulses)
            
            // Gentle pulse like a calm heartbeat
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.5))
            let pulse = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime,
                duration: pulseDuration
            )
            events.append(pulse)
        }
        
        return events
    }
    
    static func calmPulseCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Each pulse has a gentle rise and fall
        var curves: [CHHapticParameterCurve] = []
        let pulseCount = 4
        let pulseDuration = 0.15
        let timeBetweenPulses = (duration - (Double(pulseCount) * pulseDuration)) / Double(pulseCount - 1)
        
        for i in 0..<pulseCount {
            let pulseTime = Double(i) * (pulseDuration + timeBetweenPulses)
            
            let pulseCurve = CHHapticParameterCurve(
                parameterID: .hapticIntensityControl,
                controlPoints: [
                    CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                    CHHapticParameterCurve.ControlPoint(relativeTime: pulseDuration * 0.3, value: Float(0.5)),
                    CHHapticParameterCurve.ControlPoint(relativeTime: pulseDuration, value: Float(0.1))
                ],
                relativeTime: pulseTime
            )
            curves.append(pulseCurve)
        }
        
        return curves
    }
    
    static func meditationBell(duration: Double) -> [CHHapticEvent] {
        // Initial bell strike
        let strikeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let strikeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let bellStrike = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [strikeIntensity, strikeSharpness],
            relativeTime: 0.0
        )
        
        // Long resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.4))
        let resonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [bellStrike, resonance]
    }
    
    static func meditationBellCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Slow decay of bell resonance
        let decayCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.05, value: Float(0.0))
            ],
            relativeTime: 0.05
        )
        
        return [decayCurve]
    }
    
    static func relaxationWave(duration: Double) -> [CHHapticEvent] {
        // Smooth wave pattern
        let waveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let waveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.7))
        let wave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [waveIntensity, waveSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        return [wave]
    }
    
    static func relaxationWaveCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Gentle sine wave pattern
        let waveCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.25, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.75, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.2))
            ],
            relativeTime: 0.0
        )
        
        return [waveCurve]
    }
    
    static func zenNotification(duration: Double) -> [CHHapticEvent] {
        // Gentle awareness tap
        let tapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let tapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let gentleTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tapIntensity, tapSharpness],
            relativeTime: 0.0
        )
        
        // Soft fade
        let fadeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let fadeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.3))
        let fade = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [fadeIntensity, fadeSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [gentleTap, fade]
    }
    
    // MARK: - Heartbeats Pattern
    
    static func heartbeatsEvents(count: Int, durationPerBeat: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        for x in 0..<count {
            let pauseBetweenBeats: Double = (durationPerBeat * 3) * Double(x)
            let beatTimeSoFar: Double = durationPerBeat * Double(x)
            let baseline = beatTimeSoFar + pauseBetweenBeats
            
            let sharpness1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
            let intensity1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
            let relative1 = 0.0
            let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: relative1)

            let sharpness2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
            let intensity2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
            let relative2 = (0.013/0.255) * durationPerBeat + baseline
            let event2 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness2], relativeTime: relative2)

            let sharpness3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
            let intensity3 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
            let relative3 = (0.220/0.255) * durationPerBeat + baseline
            let event3 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity3, sharpness3], relativeTime: relative3)

            let sharpness4 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let intensity4 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
            let relative4 = durationPerBeat + baseline
            let event4 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity4, sharpness4], relativeTime: relative4)
            
            events.append(contentsOf: [event1, event2, event3, event4])
        }
        
        return events
    }
}