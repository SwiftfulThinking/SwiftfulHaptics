//
//  GamingHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/17/25.
//

import Foundation
import CoreHaptics

struct GamingHapticPatterns {
    
    // MARK: - Lightning Strike Patterns
    
    static func lightningStrikeQuick(duration: Double) -> [CHHapticEvent] {
        // Sharp initial electric strike - maximum intensity and sharpness
        let strikeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let strikeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let electricStrike = CHHapticEvent(
            eventType: .hapticTransient, 
            parameters: [strikeIntensity, strikeSharpness], 
            relativeTime: 0.0
        )
        
        // Quick decay vibration
        let decayIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let decaySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let electricDecay = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [decayIntensity, decaySharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [electricStrike, electricDecay]
    }
    
    static func lightningStrikeChain(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let chainCount = 4
        let timeBetweenStrikes = duration / Double(chainCount)
        
        for i in 0..<chainCount {
            let intensity = Float(0.9 - (Float(i) * 0.15)) // Decreasing intensity
            let strikeTime = Double(i) * timeBetweenStrikes
            
            let strikeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let strikeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let strike = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [strikeIntensity, strikeSharpness],
                relativeTime: strikeTime
            )
            events.append(strike)
            
            // Electric buzz between strikes
            if i < chainCount - 1 {
                let buzzIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
                let buzzSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
                let buzz = CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [buzzIntensity, buzzSharpness],
                    relativeTime: strikeTime + 0.05,
                    duration: timeBetweenStrikes * 0.6
                )
                events.append(buzz)
            }
        }
        
        return events
    }
    
    static func lightningStrikeHeavyEvents(duration: Double) -> [CHHapticEvent] {
        // Massive initial strike
        let strikeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let strikeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let massiveStrike = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [strikeIntensity, strikeSharpness],
            relativeTime: 0.0
        )
        
        // Continuous rumble
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.5))
        let thunderRumble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [massiveStrike, thunderRumble]
    }
    
    static func lightningStrikeHeavyCurves(duration: Double) -> [CHHapticParameterCurve] {
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve]
    }
    
    // MARK: - Coin Collection Patterns
    
    static func coinCollectSingle(duration: Double) -> [CHHapticEvent] {
        // Light but sharp metallic tap
        let coinIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let coinSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let coinTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [coinIntensity, coinSharpness],
            relativeTime: 0.0
        )
        
        // Quick shimmer
        let shimmerIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let shimmerSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let shimmer = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [shimmerIntensity, shimmerSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [coinTap, shimmer]
    }
    
    static func coinCollectMulti(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let coinCount = 8
        let timeBetweenCoins = duration / Double(coinCount)
        
        for i in 0..<coinCount {
            let intensity = Float(0.5 + (Float(i) * 0.05)) // Increasing intensity
            let coinTime = Double(i) * timeBetweenCoins
            
            let coinIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let coinSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
            let coin = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [coinIntensity, coinSharpness],
                relativeTime: coinTime
            )
            events.append(coin)
        }
        
        return events
    }
    
    static func coinCollectJackpotEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Building cascade of coins
        let cascadeCount = 15
        let cascadeDuration = duration * 0.7
        
        for i in 0..<cascadeCount {
            let coinTime = (Double(i) / Double(cascadeCount)) * cascadeDuration
            let intensity = Float(0.4 + (Float(i) / Float(cascadeCount)) * 0.4)
            
            let coinIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let coinSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
            let coin = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [coinIntensity, coinSharpness],
                relativeTime: coinTime
            )
            events.append(coin)
        }
        
        // Celebration rumble
        let celebrationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let celebrationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let celebration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [celebrationIntensity, celebrationSharpness],
            relativeTime: cascadeDuration,
            duration: duration - cascadeDuration
        )
        events.append(celebration)
        
        return events
    }
    
    static func coinCollectJackpotCurves(duration: Double) -> [CHHapticParameterCurve] {
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.5))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve]
    }
    
    // MARK: - Sword Slash Patterns
    
    static func swordSlashLight(duration: Double) -> [CHHapticEvent] {
        // Sharp cutting motion
        let slashIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let slashSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let slash = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [slashIntensity, slashSharpness],
            relativeTime: 0.0
        )
        
        // Whoosh effect
        let whooshIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let whooshSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let whoosh = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [whooshIntensity, whooshSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [slash, whoosh]
    }
    
    static func swordSlashHeavyEvents(duration: Double) -> [CHHapticEvent] {
        // Wind up
        let windupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let windupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let windup = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [windupIntensity, windupSharpness],
            relativeTime: 0.0,
            duration: duration * 0.4
        )
        
        // Heavy strike
        let strikeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let strikeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let strike = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [strikeIntensity, strikeSharpness],
            relativeTime: duration * 0.45
        )
        
        // Impact vibration
        let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let impact = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [impactIntensity, impactSharpness],
            relativeTime: duration * 0.5,
            duration: duration * 0.5
        )
        
        return [windup, strike, impact]
    }
    
    static func swordSlashHeavyCurves(duration: Double) -> [CHHapticParameterCurve] {
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.45, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve]
    }
    
    // MARK: - Arrow Release Pattern
    
    static func arrowReleaseEvents(duration: Double) -> [CHHapticEvent] {
        // Tension build
        let tensionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let tensionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let tension = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tensionIntensity, tensionSharpness],
            relativeTime: 0.0,
            duration: duration * 0.6
        )
        
        // Release snap
        let releaseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let releaseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let release = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [releaseIntensity, releaseSharpness],
            relativeTime: duration * 0.65
        )
        
        // String vibration
        let vibrationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let vibrationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let vibration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [vibrationIntensity, vibrationSharpness],
            relativeTime: duration * 0.7,
            duration: duration * 0.3
        )
        
        return [tension, release, vibration]
    }
    
    static func arrowReleaseCurves(duration: Double) -> [CHHapticParameterCurve] {
        let tensionCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.65, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        return [tensionCurve]
    }
    
    // MARK: - Explosion Patterns
    
    static func explosionSmall(duration: Double) -> [CHHapticEvent] {
        // Initial blast
        let blastIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let blastSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let blast = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [blastIntensity, blastSharpness],
            relativeTime: 0.0
        )
        
        // Rumble decay
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let rumble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [blast, rumble]
    }
    
    static func explosionMassiveEvents(duration: Double) -> [CHHapticEvent] {
        // Building rumble
        let buildupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let buildupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.3))
        let buildup = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildupIntensity, buildupSharpness],
            relativeTime: 0.0,
            duration: duration * 0.4
        )
        
        // Massive blast
        let blastIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let blastSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let blast = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [blastIntensity, blastSharpness],
            relativeTime: duration * 0.42
        )
        
        // Shockwave rumble
        let shockwaveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let shockwaveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.5))
        let shockwave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [shockwaveIntensity, shockwaveSharpness],
            relativeTime: duration * 0.45,
            duration: duration * 0.55
        )
        
        // Aftershocks
        for i in 0..<3 {
            let aftershockTime = duration * 0.6 + (Double(i) * 0.12)
            let aftershockIntensity = Float(0.5 - Float(i) * 0.1)
            
            let shockIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: aftershockIntensity)
            let shockSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let shock = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [shockIntensity, shockSharpness],
                relativeTime: aftershockTime
            )
            
            return [buildup, blast, shockwave, shock]
        }
        
        return [buildup, blast, shockwave]
    }
    
    static func explosionMassiveCurves(duration: Double) -> [CHHapticParameterCurve] {
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.42, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve]
    }
    
    // MARK: - Other Combat Patterns
    
    static func shieldBlock(duration: Double) -> [CHHapticEvent] {
        // Impact hit
        let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let impact = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [impactIntensity, impactSharpness],
            relativeTime: 0.0
        )
        
        // Shield reverb
        let reverbIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let reverbSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let reverb = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [reverbIntensity, reverbSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [impact, reverb]
    }
    
    static func criticalHit(duration: Double) -> [CHHapticEvent] {
        // First hit
        let hit1Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let hit1Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let hit1 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [hit1Intensity, hit1Sharpness],
            relativeTime: 0.0
        )
        
        // Emphasis hit
        let hit2Intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let hit2Sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let hit2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [hit2Intensity, hit2Sharpness],
            relativeTime: duration * 0.4
        )
        
        // Success vibration
        let successIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let successSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let success = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [successIntensity, successSharpness],
            relativeTime: duration * 0.5,
            duration: duration * 0.5
        )
        
        return [hit1, hit2, success]
    }
    
    // MARK: - Combo Patterns
    
    static func comboHit3x(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let hitTimes = [0.0, 0.33, 0.66]
        let intensities: [Float] = [0.6, 0.7, 0.9]
        
        for (index, time) in hitTimes.enumerated() {
            let hitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensities[index])
            let hitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let hit = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [hitIntensity, hitSharpness],
                relativeTime: time * duration
            )
            events.append(hit)
        }
        
        return events
    }
    
    static func comboHit5x(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let hitCount = 5
        
        for i in 0..<hitCount {
            let hitTime = (Double(i) / Double(hitCount - 1)) * duration * 0.8
            let intensity = Float(0.5 + (Float(i) / Float(hitCount)) * 0.4)
            
            let hitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let hitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let hit = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [hitIntensity, hitSharpness],
                relativeTime: hitTime
            )
            events.append(hit)
        }
        
        // Finishing hit
        let finishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let finishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let finish = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [finishIntensity, finishSharpness],
            relativeTime: duration * 0.9
        )
        events.append(finish)
        
        return events
    }
    
    // MARK: - Movement Patterns
    
    static func footstepGrass(duration: Double) -> [CHHapticEvent] {
        // Soft, muffled step
        let stepIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let stepSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let step = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [stepIntensity, stepSharpness],
            relativeTime: 0.0
        )
        
        // Soft landing
        let landIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let landSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
        let land = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [landIntensity, landSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [step, land]
    }
    
    static func footstepMetal(duration: Double) -> [CHHapticEvent] {
        // Hard, clanking step
        let stepIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let stepSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let step = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [stepIntensity, stepSharpness],
            relativeTime: 0.0
        )
        
        // Metallic ring
        let ringIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let ringSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let ring = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [ringIntensity, ringSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [step, ring]
    }
    
    // MARK: - Vehicle Patterns
    
    static func engineStartEvents(duration: Double) -> [CHHapticEvent] {
        // Ignition turn
        let ignitionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let ignitionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let ignition = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [ignitionIntensity, ignitionSharpness],
            relativeTime: 0.0
        )
        
        // Engine cranking
        let crankingIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let crankingSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let cranking = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [crankingIntensity, crankingSharpness],
            relativeTime: 0.1,
            duration: duration * 0.4
        )
        
        // Engine catch and rumble
        let catchIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let catchSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let engineCatch = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [catchIntensity, catchSharpness],
            relativeTime: duration * 0.5
        )
        
        // Idle rumble
        let idleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let idleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.2))
        let idle = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [idleIntensity, idleSharpness],
            relativeTime: duration * 0.55,
            duration: duration * 0.45
        )
        
        return [ignition, cranking, engineCatch, idle]
    }
    
    static func engineStartCurves(duration: Double) -> [CHHapticParameterCurve] {
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.4))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve]
    }
    
    static func turboBoostEvents(duration: Double) -> [CHHapticEvent] {
        // Charge up
        let chargeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let chargeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let charge = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [chargeIntensity, chargeSharpness],
            relativeTime: 0.0,
            duration: duration * 0.3
        )
        
        // Boost kick
        let kickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let kickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let kick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [kickIntensity, kickSharpness],
            relativeTime: duration * 0.35
        )
        
        // Acceleration
        let accelIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let accelSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let acceleration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [accelIntensity, accelSharpness],
            relativeTime: duration * 0.4,
            duration: duration * 0.6
        )
        
        return [charge, kick, acceleration]
    }
    
    static func turboBoostCurves(duration: Double) -> [CHHapticParameterCurve] {
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.35, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.3))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve]
    }
    
    // MARK: - Magic Patterns
    
    static func portalEnterEvents(duration: Double) -> [CHHapticEvent] {
        // Phase shift start
        let phaseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let phaseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let phase = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [phaseIntensity, phaseSharpness],
            relativeTime: 0.0
        )
        
        // Warping effect
        let warpIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let warpSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let warp = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [warpIntensity, warpSharpness],
            relativeTime: 0.05,
            duration: duration * 0.7
        )
        
        // Arrival
        let arrivalIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let arrivalSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let arrival = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [arrivalIntensity, arrivalSharpness],
            relativeTime: duration * 0.8
        )
        
        return [phase, warp, arrival]
    }
    
    static func portalEnterCurves(duration: Double) -> [CHHapticParameterCurve] {
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.2, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.8, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve]
    }
    
    static func magicChargeEvents(duration: Double) -> [CHHapticEvent] {
        // Initial spark
        let sparkIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let sparkSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let spark = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [sparkIntensity, sparkSharpness],
            relativeTime: 0.0
        )
        
        // Building energy
        let energyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let energySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let energy = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [energyIntensity, energySharpness],
            relativeTime: 0.05,
            duration: duration * 0.8
        )
        
        // Power pulses
        let pulseCount = 4
        for i in 0..<pulseCount {
            let pulseTime = 0.2 + (Double(i) * ((duration - 0.2) / Double(pulseCount)))
            let pulseIntensity = Float(0.5 + (Float(i) / Float(pulseCount)) * 0.3)
            
            let pulseIntensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: pulseIntensity)
            let pulseSharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensityParam, pulseSharpnessParam],
                relativeTime: pulseTime
            )
            
            return [spark, energy, pulse]
        }
        
        return [spark, energy]
    }
    
    static func magicChargeCurves(duration: Double) -> [CHHapticParameterCurve] {
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.9, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(1.0))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve]
    }
    
    // MARK: - Machine Gun Pattern
    
    static func machineGun(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        let shotsPerSecond = 10.0
        let shotCount = Int(duration * shotsPerSecond)
        
        for i in 0..<shotCount {
            let shotTime = Double(i) / shotsPerSecond
            let intensity = Float(0.6 + (Float.random(in: -0.1...0.1))) // Slight variation
            
            let shotIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let shotSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let shot = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [shotIntensity, shotSharpness],
                relativeTime: shotTime
            )
            events.append(shot)
        }
        
        // Barrel heat vibration
        let heatIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let heatSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let heat = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [heatIntensity, heatSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        events.append(heat)
        
        return events
    }
    
    // MARK: - Drums Pattern
    
    static func drumsEvents() -> [CHHapticEvent] {
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
        let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness1], relativeTime: 0)

        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let event2 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness2, intensity2], relativeTime: 0.391)

        let sharpness3 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let intensity3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let event3 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness3, intensity3], relativeTime: 0.8)

        let sharpness4 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
        let intensity4 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let event4 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness4, intensity4], relativeTime: 1.2)

        let sharpness5 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
        let intensity5 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let event5 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness5, intensity5], relativeTime: 1.41)

        let sharpness6 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.0))
        let event6 = CHHapticEvent(eventType: .hapticTransient, parameters: [sharpness6], relativeTime: 1.6)

        let intensity7 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let event7 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity7], relativeTime: 0.0, duration: 0.2)

        let intensity8 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let event8 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity8], relativeTime: 0.2, duration: 0.2)

        let intensity9 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.25))
        let sharpness9 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let event9 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity9, sharpness9], relativeTime: 0.4, duration: 0.15)

        let intensity10 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.25))
        let sharpness10 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let event10 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity10, sharpness10], relativeTime: 0.8, duration: 0.15)

        let intensity11 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.25))
        let sharpness11 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let event11 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity11, sharpness11], relativeTime: 1.2, duration: 0.15)

        let intensity12 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.45))
        let sharpness12 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let decay12 = CHHapticEventParameter(parameterID: .decayTime, value: Float(1.0))
        let sustained12 = CHHapticEventParameter(parameterID: .sustained, value: Float(0.0))
        let event12 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity12, sharpness12, decay12, sustained12], relativeTime: 1.6, duration: 1.0)

        return [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12]
    }
}