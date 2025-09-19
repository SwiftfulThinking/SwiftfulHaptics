//
//  ToolsWritingHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct ToolsWritingHapticPatterns {
    
    // MARK: - Writing Tool Patterns
    
    static func pencilWrite() -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Scratchy writing feel - series of small friction-like pulses
        let scratchCount = 8
        for i in 0..<scratchCount {
            let randomDelay = Double(i) * 0.05 + Double.random(in: -0.01...0.01)
            let randomIntensity = Float.random(in: 0.2...0.4)
            
            let scratchIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: randomIntensity)
            let scratchSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let scratchPulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [scratchIntensity, scratchSharpness],
                relativeTime: randomDelay
            )
            events.append(scratchPulse)
        }
        
        // Underlying continuous texture
        let textureIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.15))
        let textureSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let textureVibration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [textureIntensity, textureSharpness],
            relativeTime: 0.0,
            duration: 0.4
        )
        events.append(textureVibration)
        
        return events
    }
    
    static func eraserUse() -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Rubbing sensation - back and forth motion simulation
        let rubCount = 6
        for i in 0..<rubCount {
            let delay = Double(i) * 0.08
            let intensity = Float(0.3 + (Float(i % 2) * 0.2)) // Alternating intensity for back/forth
            
            let rubIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let rubSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
            let rubPulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [rubIntensity, rubSharpness],
                relativeTime: delay
            )
            events.append(rubPulse)
        }
        
        // Continuous rubbing texture
        let frictionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.25))
        let frictionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let frictionVibration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [frictionIntensity, frictionSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(frictionVibration)
        
        return events
    }
}