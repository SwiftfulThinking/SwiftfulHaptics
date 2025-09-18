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
    
    static func levelUp(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Rising energy build-up
        for i in 0..<5 {
            let intensity = Float(0.3 + (Float(i) * 0.14))
            let time = Double(i) * 0.08
            
            let buildIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let buildSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let buildPulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [buildIntensity, buildSharpness],
                relativeTime: time
            )
            events.append(buildPulse)
        }
        
        // Peak celebration
        let peakIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let peakSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let peakBurst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [peakIntensity, peakSharpness],
            relativeTime: 0.45
        )
        events.append(peakBurst)
        
        // Echo celebration
        let echoIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let echoSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let echo = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [echoIntensity, echoSharpness],
            relativeTime: 0.5,
            duration: duration - 0.5
        )
        events.append(echo)
        
        return events
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
        var events: [CHHapticEvent] = []
        
        // Triple crown effect
        for i in 0..<3 {
            let time = Double(i) * 0.25
            
            let crownIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
            let crownSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let crown = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [crownIntensity, crownSharpness],
                relativeTime: time
            )
            events.append(crown)
            
            // Echo effect
            let echoIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let echoSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let echo = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [echoIntensity, echoSharpness],
                relativeTime: time + 0.05,
                duration: 0.15
            )
            events.append(echo)
        }
        
        // Grand finale
        let finaleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let finaleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let finale = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [finaleIntensity, finaleSharpness],
            relativeTime: 0.8,
            duration: duration - 0.8
        )
        events.append(finale)
        
        return events
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
    
    static func lessonComplete(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Book closing thud
        let closeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let closeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let bookClose = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [closeIntensity, closeSharpness],
            relativeTime: 0.0
        )
        events.append(bookClose)
        
        // Completion chime
        for i in 0..<2 {
            let time = 0.2 + (Double(i) * 0.2)
            let intensity = Float(0.6 + (Float(i) * 0.1))
            
            let chimeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let chimeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let chime = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [chimeIntensity, chimeSharpness],
                relativeTime: time
            )
            events.append(chime)
        }
        
        // Satisfaction hum
        let humIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let humSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let satisfactionHum = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [humIntensity, humSharpness],
            relativeTime: 0.6,
            duration: duration - 0.6
        )
        events.append(satisfactionHum)
        
        return events
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
        // Light sparkle
        let sparkleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let sparkleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let sparkle = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [sparkleIntensity, sparkleSharpness],
            relativeTime: 0.0
        )
        
        // XP absorption
        let absorbIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let absorbSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let absorption = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [absorbIntensity, absorbSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [sparkle, absorption]
    }
    
    static func xpGainLarge(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Multiple sparkles
        for i in 0..<3 {
            let time = Double(i) * 0.1
            let intensity = Float(0.6 + (Float(i) * 0.1))
            
            let sparkleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let sparkleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let sparkle = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [sparkleIntensity, sparkleSharpness],
                relativeTime: time
            )
            events.append(sparkle)
        }
        
        // Power surge
        let surgeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let surgeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let powerSurge = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [surgeIntensity, surgeSharpness],
            relativeTime: 0.3,
            duration: duration - 0.3
        )
        events.append(powerSurge)
        
        return events
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
}