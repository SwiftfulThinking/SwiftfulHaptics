//
//  SpecialEffectHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct SpecialEffectHapticPatterns {
    
    // MARK: - Special Effect Patterns
    
    static func magicSparkle(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Create random sparkle taps throughout duration
        let sparkleCount = 8
        for i in 0..<sparkleCount {
            // Random timing with some variance
            let baseTime = (Double(i) / Double(sparkleCount - 1)) * duration
            let timeVariance = Double.random(in: -0.05...0.05)
            let sparkleTime = max(0, min(duration - 0.01, baseTime + timeVariance))
            
            // Random intensity and sharpness for sparkle variety
            let intensity = Float.random(in: 0.2...0.6)
            let sharpness = Float.random(in: 0.6...1.0)
            
            let sparkleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let sparkleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
            let sparkle = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [sparkleIntensity, sparkleSharpness],
                relativeTime: sparkleTime
            )
            events.append(sparkle)
        }
        
        return events
    }
    
    static func waterDropEvents(duration: Double) -> [CHHapticEvent] {
        // Initial drop impact
        let dropIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let dropSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let drop = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [dropIntensity, dropSharpness],
            relativeTime: 0.0
        )
        
        // Ripple effect - expanding circles
        let rippleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let rippleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.2))
        let ripple = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rippleIntensity, rippleSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [drop, ripple]
    }
    
    static func waterDropCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Ripple decay curve - expanding and fading
        let rippleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - 0.05) * 0.3, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.05, value: Float(0.0))
            ],
            relativeTime: 0.05
        )
        
        return [rippleCurve]
    }
    
    static func earthquakeEvents(duration: Double) -> [CHHapticEvent] {
        // Main rumbling earthquake
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.8))
        let earthquake = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        // Add some random stronger jolts
        var events: [CHHapticEvent] = [earthquake]
        let joltCount = 4
        for i in 0..<joltCount {
            let joltTime = Double(i + 1) * (duration / Double(joltCount + 1))
            let joltIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
            let joltSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.3))
            let jolt = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [joltIntensity, joltSharpness],
                relativeTime: joltTime
            )
            events.append(jolt)
        }
        
        return events
    }
    
    static func earthquakeCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Varying intensity curve for realistic earthquake feel
        let earthquakeCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.2, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.8, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.1))
            ],
            relativeTime: 0.0
        )
        
        return [earthquakeCurve]
    }
    
    static func laserBeamEvents(duration: Double) -> [CHHapticEvent] {
        // Sharp laser start
        let laserIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let laserSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let laserStart = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [laserIntensity, laserSharpness],
            relativeTime: 0.0
        )
        
        // Sustained beam
        let beamIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let beamSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let beam = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [beamIntensity, beamSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [laserStart, beam]
    }
    
    static func laserBeamCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Beam intensity curve - starts strong, slight decay
        let beamCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.02, value: Float(0.5))
            ],
            relativeTime: 0.02
        )
        
        return [beamCurve]
    }
    
    static func typewriter(duration: Double) -> [CHHapticEvent] {
        // Sharp mechanical click
        let clickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let clickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let mechanicalClick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [clickIntensity, clickSharpness],
            relativeTime: 0.0
        )
        
        return [mechanicalClick]
    }
    
    static func heartbeatEvents(duration: Double) -> [CHHapticEvent] {
        // Realistic heartbeat pattern: lub-dub with proper spacing
        var events: [CHHapticEvent] = []
        let beatCount = Int(duration / 0.8) // About 75 bpm
        
        for i in 0..<beatCount {
            let beatTime = Double(i) * 0.8
            
            // Lub (first sound) - stronger, lower frequency
            let lubIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let lubSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.2))
            let lub = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [lubIntensity, lubSharpness],
                relativeTime: beatTime
            )
            events.append(lub)
            
            // Dub (second sound) - slightly weaker, higher frequency
            let dubIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let dubSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
            let dub = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [dubIntensity, dubSharpness],
                relativeTime: beatTime + 0.15
            )
            events.append(dub)
        }
        
        return events
    }
    
    static func heartbeatCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Subtle intensity variation to simulate natural heartbeat
        let heartbeatCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.6))
            ],
            relativeTime: 0.0
        )
        
        return [heartbeatCurve]
    }
    
    static func rubberBandEvents(duration: Double) -> [CHHapticEvent] {
        // Stretch phase - building tension
        let stretchIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let stretchSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let stretch = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [stretchIntensity, stretchSharpness],
            relativeTime: 0.0,
            duration: duration * 0.7
        )
        
        // Snap back - quick release
        let snapTime = duration * 0.7
        let snapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let snapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let snapBack = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [snapIntensity, snapSharpness],
            relativeTime: snapTime
        )
        
        // Brief bounce resonance
        let bounceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let bounceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let bounce = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [bounceIntensity, bounceSharpness],
            relativeTime: snapTime + 0.02,
            duration: duration - snapTime - 0.02
        )
        
        return [stretch, snapBack, bounce]
    }
    
    static func rubberBandCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Stretch building tension curve
        let stretchCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.5))
            ],
            relativeTime: 0.0
        )
        
        // Bounce decay curve
        let snapTime = duration * 0.7
        let bounceCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - snapTime - 0.02, value: Float(0.0))
            ],
            relativeTime: snapTime + 0.02
        )
        
        return [stretchCurve, bounceCurve]
    }
    
    static func electricSpark(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Main electric discharge
        let dischargeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let dischargeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let discharge = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [dischargeIntensity, dischargeSharpness],
            relativeTime: 0.0
        )
        events.append(discharge)
        
        // Electric crackle aftermath
        let crackleCount = 3
        for i in 0..<crackleCount {
            let crackleTime = 0.05 + Double(i) * 0.08
            let crackleIntensity = Float(0.4 - Float(i) * 0.1)
            
            let crackleIntensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: crackleIntensity)
            let crackleSharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let crackle = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [crackleIntensityParam, crackleSharpnessParam],
                relativeTime: crackleTime
            )
            events.append(crackle)
        }
        
        return events
    }
    
    // MARK: - Boing Pattern
    
    static func boingEvents(duration: Double) -> [CHHapticEvent] {
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0)
        
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity2, sharpness2], relativeTime: 0.015, duration: duration)
        
        return [event1, event2]
    }
    
    static func boingCurves(duration: Double) -> [CHHapticParameterCurve] {
        let curve1 = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.5)),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0)),
        ], relativeTime: 0.015)

        let curve2 = CHHapticParameterCurve(parameterID: .hapticSharpnessControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.0)),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(-0.3)),
        ], relativeTime: 0.015)

        return [curve1, curve2]
    }
    
    // MARK: - Inflate Pattern
    
    static func inflateEvents(duration: Double) -> [CHHapticEvent] {
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let intensity1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let event1 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness1], relativeTime: 0.0, duration: duration)

        return [event1]
    }
    
    static func inflateCurves(duration: Double) -> [CHHapticParameterCurve] {
        let curve1 = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.0)),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration / 2, value: Float(0.5)),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0)),
        ], relativeTime: 0.0)

        let curve2 = CHHapticParameterCurve(parameterID: .hapticSharpnessControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(-0.8)),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.8)),
        ], relativeTime: 0.0)

        return [curve1, curve2]
    }
    
    // MARK: - Oscillate Pattern
    
    static func oscillateEvents(duration: Double) -> [CHHapticEvent] {
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
        let event1 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness1], relativeTime: 0, duration: duration)
        
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.075))
        let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity2, sharpness2], relativeTime: 0, duration: duration)

        return [event1, event2]
    }
    
    static func oscillateCurves(duration: Double) -> [CHHapticParameterCurve] {
        let curve = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
            CHHapticParameterCurve.ControlPoint(relativeTime: (0.5/3.0) * duration, value: Float(1.0)),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0)),
        ], relativeTime: 0.0)

        return [curve]
    }
    
    // MARK: - Build Up
    
    static func buildUpEvents(duration: Double) -> [CHHapticEvent] {
        // Continuous building vibration
        let buildIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let buildSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
        let buildVibration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildIntensity, buildSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        return [buildVibration]
    }
    
    static func buildUpCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Gradual intensity increase
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.9))
            ],
            relativeTime: 0.0
        )
        
        // Sharpness increases too
        let sharpnessCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(-0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.5))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve, sharpnessCurve]
    }
}