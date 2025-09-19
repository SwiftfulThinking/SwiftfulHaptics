//
//  RatingsFeedbackHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct RatingsFeedbackHapticPatterns {
    
    // MARK: - Star Rating Patterns
    
    static func starRating1(duration: Double) -> [CHHapticEvent] {
        // Single star tap
        let starIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let starSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let star = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [starIntensity, starSharpness],
            relativeTime: 0.0
        )
        
        return [star]
    }
    
    static func starRating3(duration: Double) -> [CHHapticEvent] {
        // Three ascending taps
        var events: [CHHapticEvent] = []
        
        for i in 0..<3 {
            let intensity = Float(0.4 + Double(i) * 0.1)
            let starIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let starSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let star = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [starIntensity, starSharpness],
                relativeTime: Double(i) * (duration / 3.5)
            )
            events.append(star)
        }
        
        return events
    }
    
    static func starRating5(duration: Double) -> [CHHapticEvent] {
        // Five star celebration
        var events: [CHHapticEvent] = []
        
        for i in 0..<5 {
            let intensity = Float(0.3 + Double(i) * 0.12)
            let starIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let starSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let star = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [starIntensity, starSharpness],
                relativeTime: Double(i) * (duration / 6)
            )
            events.append(star)
        }
        
        // Final celebration burst
        let celebrateIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let celebrateSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let celebration = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [celebrateIntensity, celebrateSharpness],
            relativeTime: duration * 0.9
        )
        events.append(celebration)
        
        return events
    }
    
    // MARK: - Social Notification Patterns
    
    static func socialNotification(notificationType: String, duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        switch notificationType.lowercased() {
        case "friendachievement":
            // Friend achievement - warm positive notification
            let warmIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let warmSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
            let warmTap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [warmIntensity, warmSharpness],
                relativeTime: 0.0
            )
            events.append(warmTap)
            
            // Follow-up gentle pulse
            let followIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let followSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
            let followPulse = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [followIntensity, followSharpness],
                relativeTime: 0.1,
                duration: 0.3
            )
            events.append(followPulse)
            
        case "leaderboardchange":
            // Leaderboard change - ranking update alert
            let alertIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
            let alertSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let alertTap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [alertIntensity, alertSharpness],
                relativeTime: 0.0
            )
            events.append(alertTap)
            
            // Quick follow-up to emphasize change
            let emphasisIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let emphasisSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let emphasisTap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [emphasisIntensity, emphasisSharpness],
                relativeTime: 0.15
            )
            events.append(emphasisTap)
            
        default:
            // Generic social notification
            let genericIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let genericSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let genericTap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [genericIntensity, genericSharpness],
                relativeTime: 0.0
            )
            events.append(genericTap)
        }
        
        return events
    }
}