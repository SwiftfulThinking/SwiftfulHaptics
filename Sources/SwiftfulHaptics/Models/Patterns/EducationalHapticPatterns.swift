//
//  EducationalHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct EducationalHapticPatterns {
    
    // MARK: - Achievement Patterns
    
    static func achievementUnlocked(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Initial celebration burst
        let celebrateIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let celebrateSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let celebrateBurst = CHHapticEvent(
            eventType: .hapticTransient, 
            parameters: [celebrateIntensity, celebrateSharpness], 
            relativeTime: 0.0
        )
        events.append(celebrateBurst)
        
        // Victory fanfare pulses
        let fanfareCount = 3
        for i in 0..<fanfareCount {
            let delay = 0.2 + (Double(i) * 0.15)
            let intensity = Float(0.8 - (Float(i) * 0.2))
            
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: delay
            )
            events.append(pulse)
        }
        
        // Sustained celebration vibration
        let sustainIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let sustainSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let sustainedVibration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [sustainIntensity, sustainSharpness],
            relativeTime: 0.7,
            duration: duration - 0.7
        )
        events.append(sustainedVibration)
        
        return events
    }
    
    static func levelUpEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Energy build-up vibration
        let buildupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let buildupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let buildup = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildupIntensity, buildupSharpness],
            relativeTime: 0.0,
            duration: duration * 0.6
        )
        events.append(buildup)
        
        // Level burst - powerful release
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let burst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: duration * 0.6
        )
        events.append(burst)
        
        // Celebration aftershocks
        for i in 0..<3 {
            let shockTime = (duration * 0.65) + Double(i) * 0.08
            let shockIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5 - (Double(i) * 0.1)))
            let shockSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let shock = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [shockIntensity, shockSharpness],
                relativeTime: shockTime
            )
            events.append(shock)
        }
        
        return events
    }
    
    static func levelUpCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Energy buildup curve - exponential rise
        let buildupCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration * 0.6) * 0.5, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration * 0.6) * 0.8, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(0.9))
            ],
            relativeTime: 0.0
        )
        
        return [buildupCurve]
    }
    
    static func starRating(count: Int, duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let timePerStar = duration / Double(count)
        
        for i in 0..<count {
            let starTime = Double(i) * timePerStar
            
            // Star appear
            let appearIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let appearSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let appear = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [appearIntensity, appearSharpness],
                relativeTime: starTime
            )
            events.append(appear)
            
            // Star shimmer
            let shimmerIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let shimmerSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let shimmer = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [shimmerIntensity, shimmerSharpness],
                relativeTime: starTime + 0.05,
                duration: timePerStar * 0.6
            )
            events.append(shimmer)
        }
        
        return events
    }
    
    static func badgeEarned(duration: Double) -> [CHHapticEvent] {
        // Medal placement thud
        let thudIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let thudSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let medalThud = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [thudIntensity, thudSharpness],
            relativeTime: 0.0
        )
        
        // Badge shine effect
        let shineIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let shineSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let shine = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [shineIntensity, shineSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [medalThud, shine]
    }
    
    static func streakMilestone(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Fire ignition
        let igniteIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let igniteSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let ignite = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [igniteIntensity, igniteSharpness],
            relativeTime: 0.0
        )
        events.append(ignite)
        
        // Flame flicker
        let flickerCount = 5
        for i in 0..<flickerCount {
            let time = 0.1 + (Double(i) * 0.15)
            let intensity = Float(0.4 + (Float.random(in: 0.0...0.3)))
            
            let flickerIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let flickerSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let flicker = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [flickerIntensity, flickerSharpness],
                relativeTime: time
            )
            events.append(flicker)
        }
        
        // Sustained burn
        let burnIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let burnSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let burn = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [burnIntensity, burnSharpness],
            relativeTime: 0.85,
            duration: duration - 0.85
        )
        events.append(burn)
        
        return events
    }
    
    static func perfectScore(duration: Double) -> [CHHapticEvent] {
        // Initial perfect score notification
        let perfectIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let perfectSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let perfectTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [perfectIntensity, perfectSharpness],
            relativeTime: 0.0
        )
        
        // Celebration build-up
        let celebrationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let celebrationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let celebration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [celebrationIntensity, celebrationSharpness],
            relativeTime: 0.1,
            duration: duration * 0.7
        )
        
        // Final triumphant burst
        let burstTime = duration * 0.85
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let triumphantBurst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: burstTime
        )
        
        return [perfectTap, celebration, triumphantBurst]
    }
    
    static func perfectScoreCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Celebration building curve - excitement crescendo
        let celebrationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(1.0))
            ],
            relativeTime: 0.1
        )
        
        return [celebrationCurve]
    }
    
    static func rankPromotion(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Ascending tones
        for i in 0..<4 {
            let intensity = Float(0.5 + (Float(i) * 0.125))
            let time = Double(i) * 0.2
            
            let toneIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let toneSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6 + Float(i) * 0.1))
            let tone = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [toneIntensity, toneSharpness],
                relativeTime: time
            )
            events.append(tone)
        }
        
        // Promotion burst
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let promotionBurst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: 0.85
        )
        events.append(promotionBurst)
        
        // Authority rumble
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let rumble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: 0.9,
            duration: duration - 0.9
        )
        events.append(rumble)
        
        return events
    }
    
    static func dailyGoalComplete(duration: Double) -> [CHHapticEvent] {
        // Checkmark stamp
        let stampIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.85))
        let stampSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let checkStamp = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [stampIntensity, stampSharpness],
            relativeTime: 0.0
        )
        
        // Success vibration
        let vibrateIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let vibrateSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let successVibration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [vibrateIntensity, vibrateSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [checkStamp, successVibration]
    }
    
    static func trophyUnlock(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Trophy reveal
        let revealIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let revealSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let reveal = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [revealIntensity, revealSharpness],
            relativeTime: 0.0
        )
        events.append(reveal)
        
        // Trophy gleam pulses
        for i in 0..<3 {
            let time = 0.2 + (Double(i) * 0.25)
            
            let gleamIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
            let gleamSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let gleam = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [gleamIntensity, gleamSharpness],
                relativeTime: time
            )
            events.append(gleam)
        }
        
        // Trophy presence
        let presenceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let presenceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let presence = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [presenceIntensity, presenceSharpness],
            relativeTime: 1.0,
            duration: duration - 1.0
        )
        events.append(presence)
        
        return events
    }
    
    static func questComplete(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Quest bell ring
        let bellIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let bellSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let bell = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [bellIntensity, bellSharpness],
            relativeTime: 0.0
        )
        events.append(bell)
        
        // Bell resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let resonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 0.05,
            duration: 0.4
        )
        events.append(resonance)
        
        // Victory flourish
        for i in 0..<2 {
            let time = 0.5 + (Double(i) * 0.2)
            
            let flourishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let flourishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let flourish = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [flourishIntensity, flourishSharpness],
                relativeTime: time
            )
            events.append(flourish)
        }
        
        // Completion glow
        let glowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let glowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let glow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [glowIntensity, glowSharpness],
            relativeTime: 0.9,
            duration: duration - 0.9
        )
        events.append(glow)
        
        return events
    }
    
    static func highScore(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Record breaking impact
        let breakIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let breakSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let recordBreak = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [breakIntensity, breakSharpness],
            relativeTime: 0.0
        )
        events.append(recordBreak)
        
        // Celebration cascade
        for i in 0..<5 {
            let time = 0.1 + (Double(i) * 0.12)
            let intensity = Float(0.8 - (Float(i) * 0.1))
            
            let cascadeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let cascadeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let cascade = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [cascadeIntensity, cascadeSharpness],
                relativeTime: time
            )
            events.append(cascade)
        }
        
        // Victory lap
        let lapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let lapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let victoryLap = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [lapIntensity, lapSharpness],
            relativeTime: 0.75,
            duration: duration - 0.75
        )
        events.append(victoryLap)
        
        return events
    }
    
    static func masteryAchieved(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Power surge
        let surgeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let surgeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let powerSurge = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [surgeIntensity, surgeSharpness],
            relativeTime: 0.0,
            duration: 0.3
        )
        events.append(powerSurge)
        
        // Mastery crown
        let crownIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let crownSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let crown = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [crownIntensity, crownSharpness],
            relativeTime: 0.35
        )
        events.append(crown)
        
        // Royal fanfare
        for i in 0..<3 {
            let time = 0.5 + (Double(i) * 0.2)
            
            let fanfareIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let fanfareSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let fanfare = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [fanfareIntensity, fanfareSharpness],
                relativeTime: time
            )
            events.append(fanfare)
        }
        
        // Mastery aura
        let auraIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let auraSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let aura = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [auraIntensity, auraSharpness],
            relativeTime: 1.1,
            duration: duration - 1.1
        )
        events.append(aura)
        
        return events
    }
    
    // MARK: - Learning Feedback Patterns
    
    static func correctAnswer(duration: Double) -> [CHHapticEvent] {
        // Positive chime
        let chimeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let chimeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let chime = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [chimeIntensity, chimeSharpness],
            relativeTime: 0.0
        )
        
        // Success flutter
        let flutterIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let flutterSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let flutter = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [flutterIntensity, flutterSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [chime, flutter]
    }
    
    static func incorrectGentle(duration: Double) -> [CHHapticEvent] {
        // Soft nudge
        let nudgeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let nudgeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let nudge = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [nudgeIntensity, nudgeSharpness],
            relativeTime: 0.0
        )
        
        // Gentle reminder
        let reminderIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let reminderSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let reminder = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [reminderIntensity, reminderSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [nudge, reminder]
    }
    
    static func hintAvailable(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Light bulb moment
        let bulbIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let bulbSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let lightBulb = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [bulbIntensity, bulbSharpness],
            relativeTime: 0.0
        )
        events.append(lightBulb)
        
        // Pulsing glow
        for i in 0..<2 {
            let time = 0.2 + (Double(i) * 0.3)
            
            let glowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let glowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let glow = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [glowIntensity, glowSharpness],
                relativeTime: time,
                duration: 0.2
            )
            events.append(glow)
        }
        
        return events
    }
    
    static func progressCheckpoint(duration: Double) -> [CHHapticEvent] {
        // Milestone thud
        let thudIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let thudSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let milestone = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [thudIntensity, thudSharpness],
            relativeTime: 0.0
        )
        
        // Progress hum
        let humIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let humSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let progressHum = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [humIntensity, humSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [milestone, progressHum]
    }
    
    static func encouragementTap(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Friendly pat pattern
        for i in 0..<2 {
            let time = Double(i) * 0.15
            
            let patIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let patSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
            let pat = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [patIntensity, patSharpness],
                relativeTime: time
            )
            events.append(pat)
        }
        
        // Warm presence
        let warmIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let warmSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let warmth = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [warmIntensity, warmSharpness],
            relativeTime: 0.3,
            duration: duration - 0.3
        )
        events.append(warmth)
        
        return events
    }
    
    static func skillUnlocked(duration: Double) -> [CHHapticEvent] {
        // Unlock click
        let clickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let clickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let unlockClick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [clickIntensity, clickSharpness],
            relativeTime: 0.0
        )
        
        // Skill activation
        let activationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let activationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let activation = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [activationIntensity, activationSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [unlockClick, activation]
    }
    
    static func lessonCompleteEvents(duration: Double) -> [CHHapticEvent] {
        // Fanfare pattern
        let fanfareIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let fanfareSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let fanfare = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [fanfareIntensity, fanfareSharpness],
            relativeTime: 0.0
        )
        
        // Success vibration
        let successIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let successSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let successVibe = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [successIntensity, successSharpness],
            relativeTime: 0.1,
            duration: duration - 0.3
        )
        
        // Final flourish
        let flourishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let flourishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let flourish = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [flourishIntensity, flourishSharpness],
            relativeTime: duration - 0.15
        )
        
        return [fanfare, successVibe, flourish]
    }
    
    static func lessonCompleteCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Success vibration curve
        let successCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - 0.3) * 0.5, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.3, value: Float(0.3))
            ],
            relativeTime: 0.1
        )
        
        return [successCurve]
    }
    
    static func practiceReminder(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Gentle taps
        for i in 0..<3 {
            let time = Double(i) * 0.25
            let intensity = Float(0.3 + (Float(i) * 0.1))
            
            let tapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let tapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let tap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [tapIntensity, tapSharpness],
                relativeTime: time
            )
            events.append(tap)
        }
        
        // Reminder pulse
        let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let reminderPulse = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [pulseIntensity, pulseSharpness],
            relativeTime: 0.8,
            duration: duration - 0.8
        )
        events.append(reminderPulse)
        
        return events
    }
    
    static func knowledgeGained(duration: Double) -> [CHHapticEvent] {
        // Mind expansion
        let expandIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let expandSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let expansion = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [expandIntensity, expandSharpness],
            relativeTime: 0.0,
            duration: 0.4
        )
        
        // Insight spark
        let sparkIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let sparkSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let insightSpark = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [sparkIntensity, sparkSharpness],
            relativeTime: 0.45
        )
        
        // Understanding glow
        let glowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let glowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let understandingGlow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [glowIntensity, glowSharpness],
            relativeTime: 0.5,
            duration: duration - 0.5
        )
        
        return [expansion, insightSpark, understandingGlow]
    }
    
    static func feedbackPositive(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Thumbs up motion
        let thumbIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let thumbSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let thumbsUp = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [thumbIntensity, thumbSharpness],
            relativeTime: 0.0
        )
        events.append(thumbsUp)
        
        // Positive reinforcement pulses
        for i in 0..<2 {
            let time = 0.15 + (Double(i) * 0.15)
            
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: time
            )
            events.append(pulse)
        }
        
        // Warm glow
        let glowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let glowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let warmGlow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [glowIntensity, glowSharpness],
            relativeTime: 0.45,
            duration: duration - 0.45
        )
        events.append(warmGlow)
        
        return events
    }
    
    // MARK: - Gamification Elements
    
    static func xpGainSmall(duration: Double) -> [CHHapticEvent] {
        // Subtle collection tick - barely noticeable
        let tickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let tickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let tick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tickIntensity, tickSharpness],
            relativeTime: 0.0
        )
        
        return [tick]
    }
    
    static func xpGainLargeEvents(duration: Double) -> [CHHapticEvent] {
        // Significant XP notification
        let xpBurstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let xpBurstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let xpBurst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [xpBurstIntensity, xpBurstSharpness],
            relativeTime: 0.0
        )
        
        // Building XP energy
        let energyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let energySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let xpEnergy = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [energyIntensity, energySharpness],
            relativeTime: 0.1,
            duration: duration * 0.7
        )
        
        // Final XP settlement
        let settlementTime = duration * 0.85
        let settlementIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let settlementSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let xpSettlement = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [settlementIntensity, settlementSharpness],
            relativeTime: settlementTime
        )
        
        return [xpBurst, xpEnergy, xpSettlement]
    }
    
    static func xpGainLargeCurves(duration: Double) -> [CHHapticParameterCurve] {
        // XP energy building curve
        let energyCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.8))
            ],
            relativeTime: 0.1
        )
        
        return [energyCurve]
    }
    
    static func bonusPoints(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Bonus burst
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let bonusBurst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: 0.0
        )
        events.append(bonusBurst)
        
        // Cascading points
        for i in 0..<4 {
            let time = 0.1 + (Double(i) * 0.08)
            let intensity = Float(0.5 - (Float(i) * 0.1))
            
            let cascadeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let cascadeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let cascade = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [cascadeIntensity, cascadeSharpness],
                relativeTime: time
            )
            events.append(cascade)
        }
        
        // Bonus glow
        let glowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let glowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let bonusGlow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [glowIntensity, glowSharpness],
            relativeTime: 0.45,
            duration: duration - 0.45
        )
        events.append(bonusGlow)
        
        return events
    }
    
    static func powerUpCollected(duration: Double) -> [CHHapticEvent] {
        // Power grab
        let grabIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let grabSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let powerGrab = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [grabIntensity, grabSharpness],
            relativeTime: 0.0
        )
        
        // Energy flow
        let flowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let flowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let energyFlow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [flowIntensity, flowSharpness],
            relativeTime: 0.05,
            duration: 0.4
        )
        
        // Power stabilize
        let stabilizeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let stabilizeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let stabilize = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [stabilizeIntensity, stabilizeSharpness],
            relativeTime: 0.45,
            duration: duration - 0.45
        )
        
        return [powerGrab, energyFlow, stabilize]
    }
    
    static func lifeGained(duration: Double) -> [CHHapticEvent] {
        // Heart pulse
        let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let heartPulse = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [pulseIntensity, pulseSharpness],
            relativeTime: 0.0
        )
        
        // Life flow
        let flowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let flowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let lifeFlow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [flowIntensity, flowSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [heartPulse, lifeFlow]
    }
    
    static func challengeAccepted(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Determination pulse
        let determinationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let determinationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let determination = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [determinationIntensity, determinationSharpness],
            relativeTime: 0.0
        )
        events.append(determination)
        
        // Ready stance
        for i in 0..<2 {
            let time = 0.2 + (Double(i) * 0.15)
            
            let stanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let stanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let stance = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [stanceIntensity, stanceSharpness],
                relativeTime: time
            )
            events.append(stance)
        }
        
        // Battle ready
        let readyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let readySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let battleReady = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [readyIntensity, readySharpness],
            relativeTime: 0.5,
            duration: duration - 0.5
        )
        events.append(battleReady)
        
        return events
    }
    
    static func timerTick(duration: Double) -> [CHHapticEvent] {
        // Clock tick
        let tickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let tickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let clockTick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tickIntensity, tickSharpness],
            relativeTime: 0.0
        )
        
        return [clockTick]
    }
    
    static func rewardUnlock(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Lock release
        let releaseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let releaseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let lockRelease = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [releaseIntensity, releaseSharpness],
            relativeTime: 0.0
        )
        events.append(lockRelease)
        
        // Treasure reveal
        for i in 0..<3 {
            let time = 0.15 + (Double(i) * 0.12)
            
            let revealIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let revealSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let reveal = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [revealIntensity, revealSharpness],
                relativeTime: time
            )
            events.append(reveal)
        }
        
        // Reward glow
        let glowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let glowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let rewardGlow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [glowIntensity, glowSharpness],
            relativeTime: 0.5,
            duration: duration - 0.5
        )
        events.append(rewardGlow)
        
        return events
    }
    
    static func progressBarFill(duration: Double) -> [CHHapticEvent] {
        // Filling sensation
        let fillIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let fillSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let progressFill = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [fillIntensity, fillSharpness],
            relativeTime: 0.0,
            duration: duration - 0.1
        )
        
        // Completion tick
        let tickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let tickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let completionTick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tickIntensity, tickSharpness],
            relativeTime: duration - 0.05
        )
        
        return [progressFill, completionTick]
    }
    
    static func comboMultiplier(count: Int, duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let timePerCombo = duration / Double(count)
        
        for i in 0..<count {
            let time = Double(i) * timePerCombo
            let intensity = Float(0.5 + (Float(i) * 0.1))
            
            let comboIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: min(intensity, 1.0))
            let comboSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let combo = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [comboIntensity, comboSharpness],
                relativeTime: time
            )
            events.append(combo)
            
            // Energy between combos
            if i < count - 1 {
                let energyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
                let energySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
                let energy = CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [energyIntensity, energySharpness],
                    relativeTime: time + 0.05,
                    duration: timePerCombo * 0.7
                )
                events.append(energy)
            }
        }
        
        return events
    }
    
    // MARK: - Missing Achievement Patterns from HapticTesting
    
    static func correctAnswerBasic(duration: Double) -> [CHHapticEvent] {
        // Light, pleasant confirmation tap - subtle for frequent use
        let tapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let tapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let confirmTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tapIntensity, tapSharpness],
            relativeTime: 0.0
        )
        
        // Tiny resonance for satisfaction
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let resonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [confirmTap, resonance]
    }
    
    static func correctAnswerSimple(duration: Double) -> [CHHapticEvent] {
        // Clean, positive single tap - encouraging but not overwhelming
        let correctIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let correctSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let correctTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [correctIntensity, correctSharpness],
            relativeTime: 0.0
        )
        
        // Very brief positive resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let positiveResonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [correctTap, positiveResonance]
    }
    
    static func correctAnswerStreak(streakCount: Int, duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Base intensity grows with streak
        let baseIntensity = min(0.4 + (Double(streakCount) * 0.05), 1.0)
        let tapCount = min(1 + (streakCount / 3), 4) // 1-4 taps based on streak
        
        // Initial celebration tap
        let celebrateIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(baseIntensity))
        let celebrateSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let celebrate = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [celebrateIntensity, celebrateSharpness],
            relativeTime: 0.0
        )
        events.append(celebrate)
        
        // Additional taps for longer streaks
        if tapCount > 1 {
            let tapSpacing = duration / Double(tapCount + 1)
            for i in 1..<tapCount {
                let tapTime = Double(i) * tapSpacing
                let tapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(baseIntensity * 0.7))
                let tapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
                let tap = CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [tapIntensity, tapSharpness],
                    relativeTime: tapTime
                )
                events.append(tap)
            }
        }
        
        // Building excitement vibration for streaks > 5
        if streakCount > 5 {
            let vibeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(baseIntensity * 0.5))
            let vibeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let excitement = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [vibeIntensity, vibeSharpness],
                relativeTime: 0.1,
                duration: duration * 0.6
            )
            events.append(excitement)
        }
        
        return events
    }
    
    static func correctAnswerPerfectEvents(duration: Double) -> [CHHapticEvent] {
        // Initial perfect score notification
        let perfectIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let perfectSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let perfectTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [perfectIntensity, perfectSharpness],
            relativeTime: 0.0
        )
        
        // Celebration build-up
        let celebrationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let celebrationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let celebration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [celebrationIntensity, celebrationSharpness],
            relativeTime: 0.1,
            duration: duration * 0.7
        )
        
        // Final triumphant burst
        let burstTime = duration * 0.85
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let triumphantBurst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: burstTime
        )
        
        return [perfectTap, celebration, triumphantBurst]
    }
    
    static func correctAnswerPerfectCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Celebration building curve - excitement crescendo
        let celebrationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(1.0))
            ],
            relativeTime: 0.1
        )
        
        return [celebrationCurve]
    }
    
    static func perfectLessonCompleteEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Grand opening flourish
        let flourishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let flourishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.95))
        let flourish = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [flourishIntensity, flourishSharpness],
            relativeTime: 0.0
        )
        events.append(flourish)
        
        // Sparkle effect - multiple light taps
        for i in 0..<6 {
            let sparkleTime = 0.15 + Double(i) * 0.08
            let intensity = Float(0.4 + (Double(i) * 0.05))
            
            let sparkleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let sparkleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let sparkle = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [sparkleIntensity, sparkleSharpness],
                relativeTime: sparkleTime
            )
            events.append(sparkle)
        }
        
        // Triumphant vibration
        let triumphIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let triumphSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let triumph = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [triumphIntensity, triumphSharpness],
            relativeTime: 0.6,
            duration: duration - 0.6
        )
        events.append(triumph)
        
        return events
    }
    
    static func perfectLessonCompleteCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Triumphant vibration curve - swells and fades
        let triumphCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - 0.6) * 0.3, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - 0.6) * 0.7, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.6, value: Float(0.3))
            ],
            relativeTime: 0.6
        )
        
        return [triumphCurve]
    }
    
    static func badgeUnlock(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Heavy medal drop - impactful
        let dropIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.95))
        let dropSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let medalDrop = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [dropIntensity, dropSharpness],
            relativeTime: 0.0
        )
        events.append(medalDrop)
        
        // Medal settling vibration
        let settleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let settleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let settle = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [settleIntensity, settleSharpness],
            relativeTime: 0.05,
            duration: 0.2
        )
        events.append(settle)
        
        // Achievement resonance - three pulses
        for i in 0..<3 {
            let pulseTime = 0.3 + Double(i) * 0.15
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6 - (Double(i) * 0.1)))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        return events
    }
    
    static func badgeUnlockBronze(duration: Double) -> [CHHapticEvent] {
        // Achievement notification
        let achievementIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let achievementSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let achievement = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [achievementIntensity, achievementSharpness],
            relativeTime: 0.0
        )
        
        // Bronze badge settling
        let settlingIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let settlingSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let bronzeSettling = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [settlingIntensity, settlingSharpness],
            relativeTime: 0.1,
            duration: duration - 0.1
        )
        
        return [achievement, bronzeSettling]
    }
    
    static func badgeUnlockSilverEvents(duration: Double) -> [CHHapticEvent] {
        // Strong achievement notification
        let achievementIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let achievementSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let achievement = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [achievementIntensity, achievementSharpness],
            relativeTime: 0.0
        )
        
        // Silver badge energy
        let energyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let energySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let silverEnergy = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [energyIntensity, energySharpness],
            relativeTime: 0.1,
            duration: duration * 0.7
        )
        
        // Final silver gleam
        let gleamTime = duration * 0.8
        let gleamIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let gleamSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let silverGleam = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [gleamIntensity, gleamSharpness],
            relativeTime: gleamTime
        )
        
        return [achievement, silverEnergy, silverGleam]
    }
    
    static func badgeUnlockSilverCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Silver energy building curve
        let energyCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.5))
            ],
            relativeTime: 0.1
        )
        
        return [energyCurve]
    }
    
    static func badgeUnlockGoldEvents(duration: Double) -> [CHHapticEvent] {
        // Massive achievement notification
        let achievementIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let achievementSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let achievement = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [achievementIntensity, achievementSharpness],
            relativeTime: 0.0
        )
        
        // Golden energy buildup
        let energyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let energySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let goldEnergy = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [energyIntensity, energySharpness],
            relativeTime: 0.1,
            duration: duration * 0.6
        )
        
        // Mid celebration burst
        let midBurstTime = duration * 0.5
        let midBurstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let midBurstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let midBurst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [midBurstIntensity, midBurstSharpness],
            relativeTime: midBurstTime
        )
        
        // Final golden brilliance
        let brillianceTime = duration * 0.85
        let brillianceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let brillianceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let goldBrilliance = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [brillianceIntensity, brillianceSharpness],
            relativeTime: brillianceTime
        )
        
        return [achievement, goldEnergy, midBurst, goldBrilliance]
    }
    
    static func badgeUnlockGoldCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Golden energy building curve - dramatic crescendo
        let energyCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(1.0))
            ],
            relativeTime: 0.1
        )
        
        return [energyCurve]
    }
    
    static func skillMastery(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Crown placement - weighty and regal
        let crownIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let crownSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let crown = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [crownIntensity, crownSharpness],
            relativeTime: 0.0
        )
        events.append(crown)
        
        // Royal flourish - ascending notes
        for i in 0..<5 {
            let flourishTime = 0.2 + Double(i) * 0.15
            let flourishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5 + (Double(i) * 0.08)))
            let flourishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let flourish = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [flourishIntensity, flourishSharpness],
                relativeTime: flourishTime
            )
            events.append(flourish)
        }
        
        // Majestic resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let resonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 0.9,
            duration: duration - 0.9
        )
        events.append(resonance)
        
        return events
    }
    
    static func skillMasteryCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Majestic resonance curve
        let resonanceCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - 0.9) * 0.4, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - 0.9) * 0.8, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.9, value: Float(0.3))
            ],
            relativeTime: 0.9
        )
        
        return [resonanceCurve]
    }
    
    static func leaguePromotion(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Anticipation rumble
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let rumble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(rumble)
        
        // Promotion announcement - strong impact
        let announceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let announceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let announce = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [announceIntensity, announceSharpness],
            relativeTime: 0.5
        )
        events.append(announce)
        
        // Victory march - rhythmic celebration
        for i in 0..<6 {
            let marchTime = 0.7 + Double(i) * 0.15
            let marchIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let marchSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let march = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [marchIntensity, marchSharpness],
                relativeTime: marchTime
            )
            events.append(march)
        }
        
        // Triumphant finale
        let finaleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let finaleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let finale = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [finaleIntensity, finaleSharpness],
            relativeTime: 1.6,
            duration: duration - 1.6
        )
        events.append(finale)
        
        return events
    }
    
    static func leaguePromotionCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Anticipation rumble curve - building tension
        let rumbleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.25, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.45, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.8))
            ],
            relativeTime: 0.0
        )
        
        // Finale curve - triumphant fade
        let finaleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - 1.6) * 0.5, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 1.6, value: Float(0.3))
            ],
            relativeTime: 1.6
        )
        
        return [rumbleCurve, finaleCurve]
    }
    
    static func celebrationBurst(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Create multiple rapid taps like fireworks
        let burstCount = 10
        for i in 0..<burstCount {
            let time = Double(i) * (duration / Double(burstCount))
            let intensity = Float.random(in: 0.4...0.8)
            let sharpness = Float.random(in: 0.6...1.0)
            
            let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
            let burst = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [burstIntensity, burstSharpness],
                relativeTime: time
            )
            events.append(burst)
        }
        
        return events
    }
    
    static func ascendingSuccess(duration: Double) -> [CHHapticEvent] {
        // Three taps with increasing intensity
        let tap1Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let tap1Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let tap1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tap1Intensity, tap1Sharpness],
            relativeTime: 0.0
        )
        
        let tap2Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let tap2Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let tap2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tap2Intensity, tap2Sharpness],
            relativeTime: duration * 0.4
        )
        
        let tap3Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let tap3Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let tap3 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tap3Intensity, tap3Sharpness],
            relativeTime: duration * 0.8
        )
        
        return [tap1, tap2, tap3]
    }
    
    // MARK: - Missing Learning Feedback Patterns from HapticTesting
    
    static func wrongAnswerGentle(duration: Double) -> [CHHapticEvent] {
        // Soft, non-threatening error indication for kids
        let gentleErrorIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let gentleErrorSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let gentleError = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [gentleErrorIntensity, gentleErrorSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        return [gentleError]
    }
    
    static func wrongAnswerStandard(duration: Double) -> [CHHapticEvent] {
        // Clear but not harsh error indication
        let errorPulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let errorPulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let errorPulse = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [errorPulseIntensity, errorPulseSharpness],
            relativeTime: 0.0
        )
        
        // Brief error buzz
        let errorBuzzIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let errorBuzzSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let errorBuzz = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [errorBuzzIntensity, errorBuzzSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [errorPulse, errorBuzz]
    }
    
    static func nearMissAnswer(duration: Double) -> [CHHapticEvent] {
        // Initial soft tap - acknowledging the attempt
        let attemptIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let attemptSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let attemptTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [attemptIntensity, attemptSharpness],
            relativeTime: 0.0
        )
        
        // Encouraging "almost there" wave pattern
        let waveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let waveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let encourageWave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [waveIntensity, waveSharpness],
            relativeTime: 0.1,
            duration: duration * 0.6
        )
        
        // Positive nudge at the end
        let nudgeTime = duration * 0.8
        let nudgeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let nudgeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let nudgeTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [nudgeIntensity, nudgeSharpness],
            relativeTime: nudgeTime
        )
        
        return [attemptTap, encourageWave, nudgeTap]
    }
    
    static func grammarError(duration: Double) -> [CHHapticEvent] {
        // Gentle ripple effect - like a subtle underlining motion
        let rippleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.25))
        let rippleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        
        var events: [CHHapticEvent] = []
        let rippleCount = 3
        let rippleInterval = duration / Double(rippleCount)
        
        for i in 0..<rippleCount {
            let ripple = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [rippleIntensity, rippleSharpness],
                relativeTime: Double(i) * rippleInterval
            )
            events.append(ripple)
        }
        
        // Soft continuous background to connect the ripples
        let backgroundIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.15))
        let backgroundSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let background = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [backgroundIntensity, backgroundSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        events.append(background)
        return events
    }
    
    static func hintActivation(duration: Double) -> [CHHapticEvent] {
        // Gentle "lightbulb" moment - soft rise with bright tap
        let riseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let riseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let gentleRise = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [riseIntensity, riseSharpness],
            relativeTime: 0.0,
            duration: duration * 0.6
        )
        
        // "Aha!" moment tap
        let ahaTime = duration * 0.5
        let ahaIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let ahaSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let ahaTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [ahaIntensity, ahaSharpness],
            relativeTime: ahaTime
        )
        
        // Soft fade out
        let fadeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.15))
        let fadeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let fadeOut = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [fadeIntensity, fadeSharpness],
            relativeTime: ahaTime + 0.05,
            duration: duration - ahaTime - 0.05
        )
        
        return [gentleRise, ahaTap, fadeOut]
    }
    
    static func hintReveal(duration: Double) -> [CHHapticEvent] {
        // Gentle nudge pattern
        let nudgeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let nudgeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let nudge1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [nudgeIntensity, nudgeSharpness],
            relativeTime: 0.0
        )
        
        let nudge2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [nudgeIntensity, nudgeSharpness],
            relativeTime: duration * 0.5
        )
        
        return [nudge1, nudge2]
    }
    
    static func timeCriticalWarning(duration: Double) -> [CHHapticEvent] {
        // Escalating heartbeat-like pattern
        var events: [CHHapticEvent] = []
        let beatCount = 5
        let beatInterval = duration / Double(beatCount + 1)
        
        for i in 0..<beatCount {
            let intensity = Float(0.4 + (Float(i) * 0.12)) // Escalating from 0.4 to 0.88
            let beatIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let beatSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            
            let beat = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [beatIntensity, beatSharpness],
                relativeTime: Double(i) * beatInterval
            )
            events.append(beat)
        }
        
        // Continuous tension underneath
        let tensionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let tensionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let tension = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tensionIntensity, tensionSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        events.append(tension)
        return events
    }
    
    static func timeCriticalWarningCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Intensity escalation curve
        let escalationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.8, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(1.0))
            ],
            relativeTime: 0.0
        )
        
        return [escalationCurve]
    }
    
    static func partialCredit(duration: Double) -> [CHHapticEvent] {
        // Positive reinforcement for partial correctness
        // Initial acknowledgment tap
        let acknowledgeTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5)),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            ],
            relativeTime: 0.0
        )
        
        // Building encouragement
        let buildIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let buildSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let buildUp = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildIntensity, buildSharpness],
            relativeTime: 0.1,
            duration: duration * 0.5
        )
        
        // Positive conclusion taps (half credit feel)
        let tap1Time = duration * 0.65
        let tap2Time = duration * 0.8
        
        let halfTap1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4)),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            ],
            relativeTime: tap1Time
        )
        
        let halfTap2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4)),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            ],
            relativeTime: tap2Time
        )
        
        return [acknowledgeTap, buildUp, halfTap1, halfTap2]
    }
    
    static func tryAgainEncouragement(duration: Double) -> [CHHapticEvent] {
        // Motivating "you can do it" pulse
        // Gentle lift-up pattern
        let liftIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let liftSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let gentleLift = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [liftIntensity, liftSharpness],
            relativeTime: 0.0,
            duration: duration * 0.6
        )
        
        // Encouraging tap
        let encourageTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6)),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            ],
            relativeTime: duration * 0.7
        )
        
        return [gentleLift, encourageTap]
    }
    
    static func learningProgress(duration: Double) -> [CHHapticEvent] {
        // Subtle milestone acknowledgment - climbing steps
        var events: [CHHapticEvent] = []
        let stepCount = 3
        let stepInterval = duration / Double(stepCount + 1)
        
        for i in 0..<stepCount {
            let intensity = Float(0.3 + (Float(i) * 0.15)) // Ascending from 0.3 to 0.6
            let stepTap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [
                    CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                    CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
                ],
                relativeTime: Double(i + 1) * stepInterval
            )
            events.append(stepTap)
        }
        
        // Continuous progress feeling
        let progressFlow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.25)),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            ],
            relativeTime: 0.0,
            duration: duration
        )
        
        events.append(progressFlow)
        return events
    }
    
    static func focusReminder(duration: Double) -> [CHHapticEvent] {
        // Gentle attention getter
        let focusIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let focusSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let focus = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [focusIntensity, focusSharpness],
            relativeTime: 0.0
        )
        
        // Gentle sustain
        let sustainIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let sustainSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let sustain = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [sustainIntensity, sustainSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [focus, sustain]
    }
    
    // MARK: - Streak Patterns
    
    static func streakRiskWarning(duration: Double) -> [CHHapticEvent] {
        // Attention-getting pattern without being punishing
        // Double tap with emphasis
        let tap1Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let tap1Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let tap1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tap1Intensity, tap1Sharpness],
            relativeTime: 0.0
        )
        
        let tap2Time = 0.15
        let tap2Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let tap2Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let tap2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tap2Intensity, tap2Sharpness],
            relativeTime: tap2Time
        )
        
        // Warning vibration
        let warningIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let warningSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let warningVibe = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [warningIntensity, warningSharpness],
            relativeTime: tap2Time + 0.05,
            duration: duration - tap2Time - 0.05
        )
        
        return [tap1, tap2, warningVibe]
    }
    
    static func streakLost(duration: Double) -> [CHHapticEvent] {
        // Empathetic, non-punishing acknowledgment
        // Soft descending pattern - like a gentle sigh
        let sighIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let sighSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let sigh = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [sighIntensity, sighSharpness],
            relativeTime: 0.0,
            duration: duration * 0.7
        )
        
        // Comforting pulse at the end - "it's okay, try again"
        let comfortTime = duration * 0.8
        let comfortIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let comfortSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let comfortPulse = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [comfortIntensity, comfortSharpness],
            relativeTime: comfortTime
        )
        
        return [sigh, comfortPulse]
    }
    
    static func streakBuilding(streakCount: Int = 3) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let duration = 1.0
        
        // Base intensity scales with streak length
        let baseIntensity = min(1.0, 0.3 + Float(streakCount) * 0.05)
        
        // Initial streak tap
        let streakIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: baseIntensity)
        let streakSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let streakTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [streakIntensity, streakSharpness],
            relativeTime: 0.0
        )
        events.append(streakTap)
        
        // Building momentum pulses
        let pulseCount = min(streakCount, 5)
        for i in 0..<pulseCount {
            let pulseTime = 0.15 + Double(i) * 0.1
            let pulseIntensity = baseIntensity * (0.5 + Float(i) / Float(pulseCount) * 0.3)
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: pulseIntensity)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Streak fire effect for longer streaks
        if streakCount >= 7 {
            let fireIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: baseIntensity * 0.4)
            let fireSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
            let fire = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [fireIntensity, fireSharpness],
                relativeTime: 0.2,
                duration: duration - 0.2
            )
            events.append(fire)
        }
        
        return events
    }
    
    static func streakBuildingCurves(streakCount: Int = 3) -> [CHHapticParameterCurve] {
        guard streakCount >= 7 else { return [] }
        
        // Fire flickering effect
        let flickerCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: Float(0.3))
            ],
            relativeTime: 0.2
        )
        
        return [flickerCurve]
    }
    
    static func streakMilestone5(duration: Double) -> [CHHapticEvent] {
        // Light celebration - two taps
        let milestone1Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let milestone1Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let milestone1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [milestone1Intensity, milestone1Sharpness],
            relativeTime: 0.0
        )
        
        let milestone2Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let milestone2Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let milestone2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [milestone2Intensity, milestone2Sharpness],
            relativeTime: duration * 0.6
        )
        
        return [milestone1, milestone2]
    }
    
    static func streakMilestone7Days(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Weekly achievement fanfare - 7 quick taps
        for i in 0..<7 {
            let tapTime = Double(i) * (duration * 0.7 / 7.0)
            let tapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let tapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let tap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [tapIntensity, tapSharpness],
                relativeTime: tapTime
            )
            events.append(tap)
        }
        
        // Celebration vibration
        let celebrateIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let celebrateSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let celebrate = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [celebrateIntensity, celebrateSharpness],
            relativeTime: duration * 0.7,
            duration: duration * 0.3
        )
        events.append(celebrate)
        
        return events
    }
    
    static func streakMilestone10(duration: Double) -> [CHHapticEvent] {
        // Medium celebration - three taps with vibration
        let tap1Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let tap1Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let tap1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tap1Intensity, tap1Sharpness],
            relativeTime: 0.0
        )
        
        let tap2Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let tap2Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let tap2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tap2Intensity, tap2Sharpness],
            relativeTime: duration * 0.3
        )
        
        let tap3Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let tap3Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let tap3 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tap3Intensity, tap3Sharpness],
            relativeTime: duration * 0.6
        )
        
        // Brief celebration vibration
        let vibeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let vibeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let celebration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [vibeIntensity, vibeSharpness],
            relativeTime: duration * 0.7,
            duration: duration * 0.3
        )
        
        return [tap1, tap2, tap3, celebration]
    }
    
    static func streakMilestone25Events(duration: Double) -> [CHHapticEvent] {
        // Major celebration - multiple taps and sustained vibration
        var events: [CHHapticEvent] = []
        
        // Opening fanfare
        let fanfareIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let fanfareSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let fanfare = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [fanfareIntensity, fanfareSharpness],
            relativeTime: 0.0
        )
        events.append(fanfare)
        
        // Celebration taps
        for i in 0..<5 {
            let tapTime = 0.2 + Double(i) * 0.15
            let tapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let tapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let tap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [tapIntensity, tapSharpness],
                relativeTime: tapTime
            )
            events.append(tap)
        }
        
        // Victory vibration
        let victoryIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let victorySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let victory = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [victoryIntensity, victorySharpness],
            relativeTime: 0.9,
            duration: duration - 0.9
        )
        events.append(victory)
        
        return events
    }
    
    static func streakMilestone25Curves(duration: Double) -> [CHHapticParameterCurve] {
        // Victory vibration curve
        let victoryCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - 0.9) * 0.5, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - 0.9, value: Float(0.4))
            ],
            relativeTime: 0.9
        )
        
        return [victoryCurve]
    }
    
    static func streakMilestone30Days(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Opening drum roll
        let drumIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let drumSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let drumroll = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [drumIntensity, drumSharpness],
            relativeTime: 0.0,
            duration: 0.3
        )
        events.append(drumroll)
        
        // Three strong celebration beats
        for i in 0..<3 {
            let beatTime = 0.35 + Double(i) * 0.2
            let beatIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8 + (Double(i) * 0.05)))
            let beatSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let beat = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [beatIntensity, beatSharpness],
                relativeTime: beatTime
            )
            events.append(beat)
        }
        
        // Victory vibration
        let victoryIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let victorySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let victory = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [victoryIntensity, victorySharpness],
            relativeTime: 0.8,
            duration: duration - 0.8
        )
        events.append(victory)
        
        return events
    }
    
    static func streakMilestone100Days(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Epic opening blast
        let blastIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let blastSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let blast = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [blastIntensity, blastSharpness],
            relativeTime: 0.0
        )
        events.append(blast)
        
        // Building celebration rhythm
        let celebrationBeats = 10 // Representing 100 days
        for i in 0..<celebrationBeats {
            let beatTime = 0.2 + Double(i) * (duration * 0.6 / Double(celebrationBeats))
            let intensity = 0.5 + (Double(i) / Double(celebrationBeats)) * 0.3
            let beatIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let beatSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.85))
            let beat = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [beatIntensity, beatSharpness],
                relativeTime: beatTime
            )
            events.append(beat)
        }
        
        // Grand finale vibration
        let finaleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let finaleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let finale = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [finaleIntensity, finaleSharpness],
            relativeTime: duration * 0.8,
            duration: duration * 0.2
        )
        events.append(finale)
        
        return events
    }
    
    static func streakMilestone100DaysCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Grand finale curve - triumphant swell
        let finaleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration * 0.2) * 0.3, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration * 0.2) * 0.7, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.2, value: Float(0.4))
            ],
            relativeTime: duration * 0.8
        )
        
        return [finaleCurve]
    }
    
    // MARK: - XP & Progress Patterns
    
    static func xpGainDynamicEvents(xpAmount: Int, duration: Double) -> [CHHapticEvent] {
        // Scale intensity based on XP amount (10-100+ XP)
        let normalizedIntensity = min(1.0, 0.3 + (Float(xpAmount) / 100.0) * 0.7)
        let pulseCount = min(5, 1 + xpAmount / 25) // 1-5 pulses based on amount
        
        var events: [CHHapticEvent] = []
        
        // Initial collection burst
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: normalizedIntensity)
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let burst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: 0.0
        )
        events.append(burst)
        
        // Multiple ascending pulses for larger amounts
        let pulseDuration = duration * 0.6
        for i in 0..<pulseCount {
            let pulseTime = 0.1 + (pulseDuration / Double(pulseCount)) * Double(i)
            let pulseIntensity = normalizedIntensity * (0.4 + Float(i) / Float(pulseCount) * 0.3)
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: pulseIntensity)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Satisfying rumble for larger amounts
        if xpAmount >= 50 {
            let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: normalizedIntensity * 0.3)
            let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
            let rumble = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [rumbleIntensity, rumbleSharpness],
                relativeTime: 0.05,
                duration: duration * 0.7
            )
            events.append(rumble)
        }
        
        return events
    }
    
    static func xpGainDynamicCurves(xpAmount: Int, duration: Double) -> [CHHapticParameterCurve] {
        guard xpAmount >= 50 else { return [] }
        
        // Rumble envelope for larger XP gains
        let rumbleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.0))
            ],
            relativeTime: 0.05
        )
        
        return [rumbleCurve]
    }
    
    static func xpGainBonus(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Exciting collection burst
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let burst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: 0.0
        )
        events.append(burst)
        
        // Bonus sparkles
        for i in 0..<3 {
            let sparkleTime = 0.1 + Double(i) * 0.12
            let sparkleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let sparkleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.85))
            let sparkle = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [sparkleIntensity, sparkleSharpness],
                relativeTime: sparkleTime
            )
            events.append(sparkle)
        }
        
        return events
    }
    
    static func progress25() -> [CHHapticEvent] {
        // Quarter milestone tap
        let quarterIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let quarterSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let quarter = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [quarterIntensity, quarterSharpness],
            relativeTime: 0.0
        )
        
        return [quarter]
    }
    
    static func progress50() -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Halfway double tap
        for i in 0..<2 {
            let time = Double(i) * 0.15
            
            let halfIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let halfSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let half = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [halfIntensity, halfSharpness],
                relativeTime: time
            )
            events.append(half)
        }
        
        return events
    }
    
    static func progress75() -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Three-quarter triple tap
        for i in 0..<3 {
            let time = Double(i) * 0.12
            
            let threeQuarterIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let threeQuarterSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let threeQuarter = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [threeQuarterIntensity, threeQuarterSharpness],
                relativeTime: time
            )
            events.append(threeQuarter)
        }
        
        return events
    }
    
    static func progressBarFillingEvents(startPercent: Float, endPercent: Float, duration: Double) -> [CHHapticEvent] {
        let progressAmount = endPercent - startPercent
        let tickCount = Int(progressAmount * 20) // More ticks for larger progress
        
        var events: [CHHapticEvent] = []
        
        // Continuous subtle vibration representing the fill
        let fillIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.15))
        let fillSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let continuousFill = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [fillIntensity, fillSharpness],
            relativeTime: 0.0,
            duration: duration * 0.9
        )
        events.append(continuousFill)
        
        // Subtle ticks as progress increases
        for i in 0..<tickCount {
            let tickTime = (duration * 0.8) * Double(i) / Double(tickCount)
            let tickIntensity = 0.2 + (Float(i) / Float(tickCount)) * 0.1
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: tickIntensity)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let tick = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: tickTime
            )
            events.append(tick)
        }
        
        // Completion tap if reaching 100%
        if endPercent >= 1.0 {
            let completeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
            let completeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let completeTap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [completeIntensity, completeSharpness],
                relativeTime: duration * 0.95
            )
            events.append(completeTap)
        }
        
        return events
    }
    
    static func progressBarFillingCurves(startPercent: Float, endPercent: Float, duration: Double) -> [CHHapticParameterCurve] {
        // Intensity increases as bar fills
        let fillCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.9, value: Float(1.0))
            ],
            relativeTime: 0.0
        )
        
        return [fillCurve]
    }
    
    // MARK: - Educational Gamification Patterns
    
    static func dailyGoalCheckpoint(checkpointNumber: Int, duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Checkpoint arrival notification
        let arrivalIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let arrivalSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let arrival = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [arrivalIntensity, arrivalSharpness],
            relativeTime: 0.0
        )
        events.append(arrival)
        
        // Checkpoint number pulses (1-5 pulses)
        let pulseCount = min(5, checkpointNumber)
        for i in 0..<pulseCount {
            let pulseTime = 0.2 + Double(i) * 0.15
            let pulseIntensity = 0.4 + Float(i) * 0.05
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: pulseIntensity)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Success flourish
        let flourishTime = 0.2 + Double(pulseCount) * 0.15 + 0.1
        let flourishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let flourishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let flourish = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [flourishIntensity, flourishSharpness],
            relativeTime: flourishTime,
            duration: duration - flourishTime
        )
        events.append(flourish)
        
        return events
    }
    
    static func leagueAdvancementEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Drum roll buildup
        let drumRollIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let drumRollSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let drumRoll = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [drumRollIntensity, drumRollSharpness],
            relativeTime: 0.0,
            duration: duration * 0.6
        )
        events.append(drumRoll)
        
        // Rapid drum taps during buildup
        let drumTapCount = 8
        for i in 0..<drumTapCount {
            let tapTime = Double(i) * (duration * 0.5 / Double(drumTapCount))
            let tapIntensity = 0.2 + Float(i) / Float(drumTapCount) * 0.3
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: tapIntensity)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let tap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: tapTime
            )
            events.append(tap)
        }
        
        // Massive promotion celebration
        let celebrationTime = duration * 0.65
        let celebrationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let celebrationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let celebration = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [celebrationIntensity, celebrationSharpness],
            relativeTime: celebrationTime
        )
        events.append(celebration)
        
        // Victory fanfare pulses
        for i in 0..<3 {
            let fanfareTime = celebrationTime + 0.1 + Double(i) * 0.12
            let fanfareIntensity = 0.7 - Float(i) * 0.1
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: fanfareIntensity)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let fanfare = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: fanfareTime
            )
            events.append(fanfare)
        }
        
        return events
    }
    
    static func leagueAdvancementCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Building intensity curve for drum roll
        let buildupCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(1.0))
            ],
            relativeTime: 0.0
        )
        
        return [buildupCurve]
    }
    
    static func crownGemCollection() -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Magical sparkle appearance
        let sparkleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let sparkleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let sparkle = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [sparkleIntensity, sparkleSharpness],
            relativeTime: 0.0
        )
        events.append(sparkle)
        
        // Crown settling with shimmer
        let shimmerCount = 5
        for i in 0..<shimmerCount {
            let shimmerTime = 0.1 + Double(i) * 0.08
            let shimmerIntensity = 0.3 + Float(shimmerCount - i) / Float(shimmerCount) * 0.2
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: shimmerIntensity)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let shimmer = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: shimmerTime
            )
            events.append(shimmer)
        }
        
        // Regal completion tone (1.0s total duration)
        let regalIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let regalSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let regal = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [regalIntensity, regalSharpness],
            relativeTime: 0.6,
            duration: 0.4  // 1.0 - 0.6 = 0.4
        )
        events.append(regal)
        
        return events
    }
    
    static func powerUpActivation(powerUpType: String = "default") -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let duration = 1.2
        
        // Power-up charge
        let chargeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let chargeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let charge = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [chargeIntensity, chargeSharpness],
            relativeTime: 0.0,
            duration: duration * 0.4
        )
        events.append(charge)
        
        // Activation burst
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let burst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: duration * 0.45
        )
        events.append(burst)
        
        // Power-up specific pattern
        if powerUpType == "streakFreeze" {
            // Icy crystallization effect
            for i in 0..<3 {
                let freezeTime = duration * 0.5 + Double(i) * 0.1
                let freezeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
                let freezeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.95))
                let freeze = CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [freezeIntensity, freezeSharpness],
                    relativeTime: freezeTime
                )
                events.append(freeze)
            }
        } else if powerUpType == "doubleOrNothing" {
            // Double pulse pattern
            let double1Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let double1Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let double1 = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [double1Intensity, double1Sharpness],
                relativeTime: duration * 0.6
            )
            events.append(double1)
            
            let double2Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
            let double2Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let double2 = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [double2Intensity, double2Sharpness],
                relativeTime: duration * 0.75
            )
            events.append(double2)
        }
        
        return events
    }
    
    static func powerUpActivationCurves() -> [CHHapticParameterCurve] {
        let duration = 1.2
        
        // Charging curve
        let chargeCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.2, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(1.0))
            ],
            relativeTime: 0.0
        )
        
        return [chargeCurve]
    }
    
    static func challengeCompletion(isPerfect: Bool = false) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let duration = 1.2
        
        if isPerfect {
            // Perfect run celebration - multiple ascending bursts
            for i in 0..<4 {
                let burstTime = Double(i) * 0.2
                let burstIntensity = 0.6 + Float(i) * 0.1
                
                let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: burstIntensity)
                let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
                let burst = CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [intensity, sharpness],
                    relativeTime: burstTime
                )
                events.append(burst)
            }
            
            // Victory fanfare
            let fanfareIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let fanfareSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
            let fanfare = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [fanfareIntensity, fanfareSharpness],
                relativeTime: 0.9,
                duration: duration - 0.9
            )
            events.append(fanfare)
        } else {
            // Standard completion - satisfying double tap
            let tap1Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let tap1Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let tap1 = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [tap1Intensity, tap1Sharpness],
                relativeTime: 0.0
            )
            events.append(tap1)
            
            let tap2Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let tap2Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let tap2 = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [tap2Intensity, tap2Sharpness],
                relativeTime: 0.15
            )
            events.append(tap2)
            
            // Completion tone
            let toneIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let toneSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let tone = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [toneIntensity, toneSharpness],
                relativeTime: 0.3,
                duration: duration - 0.3
            )
            events.append(tone)
        }
        
        return events
    }
    
    static func challengeCompletionCurves(isPerfect: Bool = false) -> [CHHapticParameterCurve] {
        let duration = 1.2
        
        if isPerfect {
            // Crescendo for perfect runs
            let crescendoCurve = CHHapticParameterCurve(
                parameterID: .hapticIntensityControl,
                controlPoints: [
                    CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                    CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.7)),
                    CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.8, value: Float(1.0)),
                    CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.6))
                ],
                relativeTime: 0.0
            )
            return [crescendoCurve]
        }
        
        return []
    }
    
    static func lessonPathProgress(nodeType: String = "default") -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        if nodeType == "unlock" {
            // Node unlocking sensation
            let unlockIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let unlockSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let unlock = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [unlockIntensity, unlockSharpness],
                relativeTime: 0.0
            )
            events.append(unlock)
            
            // Path opening vibration
            let pathIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
            let pathSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let pathOpen = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [pathIntensity, pathSharpness],
                relativeTime: 0.1,
                duration: 0.3
            )
            events.append(pathOpen)
            
        } else if nodeType == "complete" {
            // Node completion satisfaction
            let completeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let completeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let complete = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [completeIntensity, completeSharpness],
                relativeTime: 0.0
            )
            events.append(complete)
            
            // Golden glow effect
            let glowCount = 3
            for i in 0..<glowCount {
                let glowTime = 0.15 + Double(i) * 0.1
                let glowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
                let glowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
                let glow = CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [glowIntensity, glowSharpness],
                    relativeTime: glowTime
                )
                events.append(glow)
            }
        }
        
        return events
    }
    
    // MARK: - Time Warning Patterns
    
    static func timeWarning30s(duration: Double) -> [CHHapticEvent] {
        // Gentle reminder pulse
        let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let pulse = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [pulseIntensity, pulseSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        return [pulse]
    }
    
    static func timeWarning10s(duration: Double) -> [CHHapticEvent] {
        // Urgent double pulse
        let pulse1Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let pulse1Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let pulse1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [pulse1Intensity, pulse1Sharpness],
            relativeTime: 0.0
        )
        
        let pulse2Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let pulse2Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let pulse2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [pulse2Intensity, pulse2Sharpness],
            relativeTime: duration * 0.5
        )
        
        // Urgent vibration between pulses
        let urgentIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let urgentSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let urgentVibe = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [urgentIntensity, urgentSharpness],
            relativeTime: 0.1,
            duration: duration * 0.3
        )
        
        return [pulse1, urgentVibe, pulse2]
    }
    
    // MARK: - Quiz and Progress Patterns
    
    static func quizStart(duration: Double) -> [CHHapticEvent] {
        // Ready-set-go pattern
        let readyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let readySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let ready = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [readyIntensity, readySharpness],
            relativeTime: 0.0
        )
        
        let setIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let setSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let set = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [setIntensity, setSharpness],
            relativeTime: duration * 0.35
        )
        
        let goIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let goSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let go = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [goIntensity, goSharpness],
            relativeTime: duration * 0.7
        )
        
        return [ready, set, go]
    }
    
    static func progress25(duration: Double) -> [CHHapticEvent] {
        // Single tap for quarter milestone
        let progressIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let progressSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let milestone = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [progressIntensity, progressSharpness],
            relativeTime: 0.0
        )
        
        return [milestone]
    }
    
    static func progress50(duration: Double) -> [CHHapticEvent] {
        // Double tap for halfway
        let progressIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let progressSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        
        let tap1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [progressIntensity, progressSharpness],
            relativeTime: 0.0
        )
        
        let tap2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [progressIntensity, progressSharpness],
            relativeTime: duration * 0.6
        )
        
        return [tap1, tap2]
    }
    
    static func progress75(duration: Double) -> [CHHapticEvent] {
        // Triple tap for three-quarters
        let progressIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let progressSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        
        var events: [CHHapticEvent] = []
        for i in 0..<3 {
            let tap = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [progressIntensity, progressSharpness],
                relativeTime: Double(i) * (duration / 3.5)
            )
            events.append(tap)
        }
        
        return events
    }
    
    static func flashcardFlip(duration: Double) -> [CHHapticEvent] {
        // Quick flip motion
        let flipIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let flipSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let flipStart = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [flipIntensity, flipSharpness],
            relativeTime: 0.0
        )
        
        // Card settling
        let settleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let settleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let cardSettle = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [settleIntensity, settleSharpness],
            relativeTime: duration * 0.7
        )
        
        return [flipStart, cardSettle]
    }
    
    static func softTick(duration: Double) -> [CHHapticEvent] {
        // Fine ratchet feeling
        var events: [CHHapticEvent] = []
        let tickCount = 5
        
        for i in 0..<tickCount {
            let tickTime = Double(i) * (duration / Double(tickCount))
            let tickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.25))
            let tickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let tick = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [tickIntensity, tickSharpness],
                relativeTime: tickTime
            )
            events.append(tick)
        }
        
        return events
    }
    
    static func pencilWrite(duration: Double) -> [CHHapticEvent] {
        // Scratchy writing texture
        let scratchIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let scratchSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let scratch = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [scratchIntensity, scratchSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        return [scratch]
    }
    
    static func eraserUse(duration: Double) -> [CHHapticEvent] {
        // Rubbing sensation - continuous with texture
        let rubIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let rubSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let rubbing = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rubIntensity, rubSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        // Add some texture taps
        var events: [CHHapticEvent] = [rubbing]
        let textureCount = 4
        for i in 0..<textureCount {
            let textureTime = Double(i) * (duration / Double(textureCount))
            let textureIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
            let textureSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let texture = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [textureIntensity, textureSharpness],
                relativeTime: textureTime
            )
            events.append(texture)
        }
        
        return events
    }
    
    static func socialFeatureNotification(notificationType: String = "default") -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        if notificationType == "friendAchievement" {
            // Friendly notification pattern
            let notifyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let notifySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let notify = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [notifyIntensity, notifySharpness],
                relativeTime: 0.0
            )
            events.append(notify)
            
            // Happy pulse
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let pulse = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: 0.1,
                duration: 0.2
            )
            events.append(pulse)
            
            // Celebration tap
            let celebrateIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let celebrateSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let celebrate = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [celebrateIntensity, celebrateSharpness],
                relativeTime: 0.35
            )
            events.append(celebrate)
            
        } else if notificationType == "leaderboardChange" {
            // Competitive notification
            let alertIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let alertSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let alert = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [alertIntensity, alertSharpness],
                relativeTime: 0.0
            )
            events.append(alert)
            
            // Ranking movement sensation
            let moveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let moveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let movement = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [moveIntensity, moveSharpness],
                relativeTime: 0.1,
                duration: 0.3
            )
            events.append(movement)
            
            // Position lock
            let lockIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let lockSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let lock = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [lockIntensity, lockSharpness],
                relativeTime: 0.45
            )
            events.append(lock)
        }
        
        return events
    }
    
    // MARK: - Book Page Turn Pattern
    
    static func bookPageTurn(duration: Double = 0.25) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Initial page grab - slight resistance
        let grabIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let grabSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let pageGrab = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [grabIntensity, grabSharpness],
            relativeTime: 0.0
        )
        events.append(pageGrab)
        
        // Page sliding texture
        let slideIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let slideSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let pageSlide = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [slideIntensity, slideSharpness],
            relativeTime: 0.02,
            duration: duration * 0.7
        )
        events.append(pageSlide)
        
        // Page settling - the satisfying end of turn
        let settleTime = duration * 0.75
        let settleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let settleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let pageSettle = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [settleIntensity, settleSharpness],
            relativeTime: settleTime
        )
        events.append(pageSettle)
        
        return events
    }
    
    // MARK: - Build Up Pattern
    
    static func buildUp(duration: Double = 1.5) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Initial spark to start the build
        let sparkIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let sparkSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let initialSpark = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [sparkIntensity, sparkSharpness],
            relativeTime: 0.0
        )
        events.append(initialSpark)
        
        // Building energy continuous vibration
        let buildIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let buildSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let buildingEnergy = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildIntensity, buildSharpness],
            relativeTime: 0.1,
            duration: duration * 0.85
        )
        events.append(buildingEnergy)
        
        // Intermediate pulses for tension
        let pulseCount = 3
        for i in 0..<pulseCount {
            let pulseTime = 0.3 + (Double(i) * (duration * 0.2))
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4 + (Float(i) * 0.15)))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let tensionPulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(tensionPulse)
        }
        
        // Climactic peak
        let peakTime = duration * 0.95
        let peakIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let peakSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let climax = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [peakIntensity, peakSharpness],
            relativeTime: peakTime
        )
        events.append(climax)
        
        return events
    }
    
    static func buildUpCurves(duration: Double = 1.5) -> [CHHapticParameterCurve] {
        // Intensity curve - exponential growth
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.85, value: Float(1.0))
            ],
            relativeTime: 0.1
        )
        
        return [intensityCurve]
    }
}