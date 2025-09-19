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
        
        // Quick electric crackle - continuous but very brief
        let crackleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let crackleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let electricCrackle = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [crackleIntensity, crackleSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [electricStrike, electricCrackle]
    }
    
    static func lightningStrikeChain(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Create 4 lightning strikes that jump between targets
        let strikeCount = 4
        let timeBetweenStrikes = duration / Double(strikeCount + 1)
        
        for i in 0..<strikeCount {
            let strikeTime = Double(i + 1) * timeBetweenStrikes
            
            // Each strike decreases in intensity but maintains sharpness
            let intensity = 1.0 - (Double(i) * 0.15) // 1.0, 0.85, 0.7, 0.55
            
            // Main electric strike
            let strikeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let strikeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.95))
            let electricStrike = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [strikeIntensity, strikeSharpness],
                relativeTime: strikeTime
            )
            events.append(electricStrike)
            
            // Brief arc crackle after each strike (except the last)
            if i < strikeCount - 1 {
                let arcIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity * 0.4))
                let arcSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
                let electricArc = CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [arcIntensity, arcSharpness],
                    relativeTime: strikeTime + 0.02,
                    duration: timeBetweenStrikes * 0.3
                )
                events.append(electricArc)
            }
        }
        
        return events
    }
    
    static func lightningStrikeHeavyEvents(duration: Double) -> [CHHapticEvent] {
        // Massive initial electric blast
        let blastIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let blastSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let electricBlast = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [blastIntensity, blastSharpness],
            relativeTime: 0.0
        )
        
        // Secondary blast for emphasis
        let secondBlastIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let secondBlastSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let secondElectricBlast = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [secondBlastIntensity, secondBlastSharpness],
            relativeTime: 0.08
        )
        
        // Long thunder rumble
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let thunderRumble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: 0.15,
            duration: duration - 0.15
        )
        
        return [electricBlast, secondElectricBlast, thunderRumble]
    }
    
    static func lightningStrikeHeavyCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Intensity decay curve for the rumble - powerful start, gradual decay
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.7, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0))
            ],
            relativeTime: 0.15
        )
        
        // Sharpness curve - starts dull, gets slightly sharper for distant thunder feel
        let sharpnessCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(-0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(-0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(-0.5))
            ],
            relativeTime: 0.15
        )
        
        return [intensityCurve, sharpnessCurve]
    }
    
    // MARK: - Coin Collection Patterns
    
    static func coinCollectSingle(duration: Double) -> [CHHapticEvent] {
        // Crisp, satisfying metallic "ping" - like a coin hitting your palm
        let coinIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let coinSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let coinPing = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [coinIntensity, coinSharpness],
            relativeTime: 0.0
        )
        
        // Very brief metallic resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let coinResonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [coinPing, coinResonance]
    }
    
    static func coinCollectMulti(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Create 6-8 coins collected in rapid succession
        let coinCount = 7
        let timeBetweenCoins = duration / Double(coinCount + 1)
        
        for i in 0..<coinCount {
            let coinTime = Double(i) * timeBetweenCoins + 0.1
            
            // Each coin has slightly different characteristics for variety
            let intensityVariation = 0.5 + (0.15 * Double(i % 3)) // 0.5, 0.65, 0.8, repeat
            let sharpnessVariation = 0.85 + (0.05 * Double(i % 2)) // 0.85, 0.9, alternate
            
            let coinIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensityVariation))
            let coinSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(sharpnessVariation))
            let coinPing = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [coinIntensity, coinSharpness],
                relativeTime: coinTime
            )
            events.append(coinPing)
        }
        
        // Final satisfying "collection complete" resonance
        let finalIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let finalSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let finalResonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [finalIntensity, finalSharpness],
            relativeTime: duration * 0.85,
            duration: duration * 0.15
        )
        events.append(finalResonance)
        
        return events
    }
    
    static func coinCollectJackpotEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Phase 1: Initial cascade of coins (first 40% of duration)
        let cascadePhase = duration * 0.4
        let initialCoinCount = 12
        
        for i in 0..<initialCoinCount {
            let coinTime = Double(i) * (cascadePhase / Double(initialCoinCount))
            let intensity = 0.4 + (Double(i) * 0.03) // Gradually building intensity
            
            let coinIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(intensity))
            let coinSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.85))
            let coin = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [coinIntensity, coinSharpness],
                relativeTime: coinTime
            )
            events.append(coin)
        }
        
        // Phase 2: Excitement build-up continuous vibration
        let buildUpIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let buildUpSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let buildUp = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildUpIntensity, buildUpSharpness],
            relativeTime: cascadePhase,
            duration: duration * 0.3
        )
        events.append(buildUp)
        
        // Phase 3: Jackpot explosion
        let explosionTime = duration * 0.75
        let explosionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let explosionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let jackpotExplosion = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [explosionIntensity, explosionSharpness],
            relativeTime: explosionTime
        )
        events.append(jackpotExplosion)
        
        // Phase 4: Celebration rumble
        let celebrationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let celebrationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let celebration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [celebrationIntensity, celebrationSharpness],
            relativeTime: explosionTime + 0.05,
            duration: duration - explosionTime - 0.05
        )
        events.append(celebration)
        
        return events
    }
    
    static func coinCollectJackpotCurves(duration: Double) -> [CHHapticParameterCurve] {
        let explosionTime = duration * 0.75
        
        // Intensity curve for the celebration rumble - strong start, gentle fade
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - explosionTime) * 0.5, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - explosionTime, value: Float(0.2))
            ],
            relativeTime: explosionTime + 0.05
        )
        
        return [intensityCurve]
    }
    
    // MARK: - Sword Slash Patterns
    
    static func swordSlashLight(duration: Double) -> [CHHapticEvent] {
        // Quick, sharp cutting motion - like a blade slicing through air
        let slashIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let slashSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.95))
        let swordSlash = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [slashIntensity, slashSharpness],
            relativeTime: 0.0
        )
        
        // Brief cutting resonance - the blade cutting through
        let cutIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let cutSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let cutting = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [cutIntensity, cutSharpness],
            relativeTime: 0.03,
            duration: duration - 0.03
        )
        
        return [swordSlash, cutting]
    }
    
    static func swordSlashHeavyEvents(duration: Double) -> [CHHapticEvent] {
        // Wind-up sensation - gathering momentum
        let windUpIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let windUpSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let windUp = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [windUpIntensity, windUpSharpness],
            relativeTime: 0.0,
            duration: duration * 0.4
        )
        
        // Massive impact - the sword striking
        let impactTime = duration * 0.4
        let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let impact = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [impactIntensity, impactSharpness],
            relativeTime: impactTime
        )
        
        // Heavy cutting through with weight
        let heavyCutIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let heavyCutSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let heavyCutting = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [heavyCutIntensity, heavyCutSharpness],
            relativeTime: impactTime + 0.05,
            duration: duration - impactTime - 0.05
        )
        
        return [windUp, impact, heavyCutting]
    }
    
    static func swordSlashHeavyCurves(duration: Double) -> [CHHapticParameterCurve] {
        let impactTime = duration * 0.4
        
        // Wind-up intensity curve - builds anticipation
        let windUpCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.4, value: Float(1.0))
            ],
            relativeTime: 0.0
        )
        
        // Heavy cut decay - powerful start, gradual fade
        let cutDecayCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - impactTime) * 0.6, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - impactTime, value: Float(0.1))
            ],
            relativeTime: impactTime + 0.05
        )
        
        return [windUpCurve, cutDecayCurve]
    }
    
    // MARK: - Arrow Release Pattern
    
    static func arrowReleaseEvents(duration: Double) -> [CHHapticEvent] {
        // Tension build-up before release
        let tensionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let tensionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let tension = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tensionIntensity, tensionSharpness],
            relativeTime: 0.0,
            duration: duration * 0.3
        )
        
        // Sharp release - the moment of letting go
        let releaseTime = duration * 0.3
        let releaseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let releaseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let release = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [releaseIntensity, releaseSharpness],
            relativeTime: releaseTime
        )
        
        // Bowstring twang vibration
        let twangIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let twangSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let twang = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [twangIntensity, twangSharpness],
            relativeTime: releaseTime + 0.02,
            duration: duration - releaseTime - 0.02
        )
        
        return [tension, release, twang]
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
        // Quick, sharp explosion burst
        let blastIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let blastSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let blast = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [blastIntensity, blastSharpness],
            relativeTime: 0.0
        )
        
        // Brief shockwave rumble
        let shockwaveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let shockwaveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let shockwave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [shockwaveIntensity, shockwaveSharpness],
            relativeTime: 0.03,
            duration: duration - 0.03
        )
        
        return [blast, shockwave]
    }
    
    static func explosionMassiveEvents(duration: Double) -> [CHHapticEvent] {
        // Initial ignition
        let ignitionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let ignitionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let ignition = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [ignitionIntensity, ignitionSharpness],
            relativeTime: 0.0
        )
        
        // Building explosion pressure
        let buildupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let buildupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let buildup = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildupIntensity, buildupSharpness],
            relativeTime: 0.05,
            duration: duration * 0.25
        )
        
        // Massive explosion peak
        let explosionTime = duration * 0.3
        let explosionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let explosionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let explosion = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [explosionIntensity, explosionSharpness],
            relativeTime: explosionTime
        )
        
        // Long shockwave and debris
        let shockwaveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let shockwaveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let longShockwave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [shockwaveIntensity, shockwaveSharpness],
            relativeTime: explosionTime + 0.05,
            duration: duration - explosionTime - 0.05
        )
        
        return [ignition, buildup, explosion, longShockwave]
    }
    
    static func explosionMassiveCurves(duration: Double) -> [CHHapticParameterCurve] {
        let explosionTime = duration * 0.3
        
        // Buildup intensity curve - pressure building
        let buildupCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.15, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.25, value: Float(1.0))
            ],
            relativeTime: 0.05
        )
        
        // Shockwave decay curve - powerful start, long fade
        let shockwaveCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - explosionTime) * 0.3, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - explosionTime) * 0.7, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - explosionTime, value: Float(0.0))
            ],
            relativeTime: explosionTime + 0.05
        )
        
        return [buildupCurve, shockwaveCurve]
    }
    
    // MARK: - Other Combat Patterns
    
    static func shieldBlock(duration: Double) -> [CHHapticEvent] {
        // Initial impact on shield
        let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let shieldImpact = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [impactIntensity, impactSharpness],
            relativeTime: 0.0
        )
        
        // Shield absorption - the energy being dispersed
        let absorptionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let absorptionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let absorption = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [absorptionIntensity, absorptionSharpness],
            relativeTime: 0.05,
            duration: duration * 0.6
        )
        
        // Metallic reverb/echo from shield
        let reverbIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.25))
        let reverbSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let shieldReverb = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [reverbIntensity, reverbSharpness],
            relativeTime: duration * 0.7,
            duration: duration * 0.3
        )
        
        return [shieldImpact, absorption, shieldReverb]
    }
    
    static func criticalHit(duration: Double) -> [CHHapticEvent] {
        // First impact - the critical strike
        let firstHitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let firstHitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let firstHit = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [firstHitIntensity, firstHitSharpness],
            relativeTime: 0.0
        )
        
        // Brief pause for emphasis
        
        // Second impact - the follow-through
        let secondHitTime = duration * 0.4
        let secondHitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let secondHitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let secondHit = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [secondHitIntensity, secondHitSharpness],
            relativeTime: secondHitTime
        )
        
        // Resonating aftermath
        let aftermathIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let aftermathSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let aftermath = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [aftermathIntensity, aftermathSharpness],
            relativeTime: secondHitTime + 0.05,
            duration: duration - secondHitTime - 0.05
        )
        
        return [firstHit, secondHit, aftermath]
    }
    
    // MARK: - Combo Patterns
    
    static func comboHit3x(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Three escalating hits with increasing intensity
        let hitTimings = [0.0, duration * 0.4, duration * 0.75]
        let intensities: [Float] = [0.6, 0.75, 0.9] // Building power
        let sharpnesses: [Float] = [0.7, 0.8, 0.9] // Getting more precise
        
        for i in 0..<3 {
            let hitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensities[i])
            let hitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpnesses[i])
            let hit = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [hitIntensity, hitSharpness],
                relativeTime: hitTimings[i]
            )
            events.append(hit)
        }
        
        // Final impact resonance for the finishing blow
        let finishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let finishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let finishResonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [finishIntensity, finishSharpness],
            relativeTime: hitTimings[2] + 0.05,
            duration: duration - hitTimings[2] - 0.05
        )
        events.append(finishResonance)
        
        return events
    }
    
    static func comboHit5x(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Five rapid hits with varying intensity and a big finish
        let hitCount = 5
        let baseInterval = duration * 0.15 // Rapid succession
        
        for i in 0..<hitCount {
            let hitTime = Double(i) * baseInterval
            
            // Intensity pattern: moderate → high → low → high → maximum
            let intensityPattern: [Float] = [0.6, 0.8, 0.5, 0.85, 1.0]
            let sharpnessPattern: [Float] = [0.7, 0.8, 0.6, 0.9, 1.0]
            
            let hitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityPattern[i])
            let hitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpnessPattern[i])
            let hit = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [hitIntensity, hitSharpness],
                relativeTime: hitTime
            )
            events.append(hit)
        }
        
        // Extended finishing resonance for the final blow
        let finishTime = Double(hitCount - 1) * baseInterval + 0.05
        let finishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let finishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let extendedFinish = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [finishIntensity, finishSharpness],
            relativeTime: finishTime,
            duration: duration - finishTime
        )
        events.append(extendedFinish)
        
        return events
    }
    
    // MARK: - Movement Patterns
    
    static func footstepGrass(duration: Double) -> [CHHapticEvent] {
        // Soft, organic footstep - like stepping on soft ground
        let stepIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let stepSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let grassStep = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [stepIntensity, stepSharpness],
            relativeTime: 0.0
        )
        
        // Very brief grass rustle
        let rustleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.15))
        let rustleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let grassRustle = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rustleIntensity, rustleSharpness],
            relativeTime: 0.02,
            duration: duration - 0.02
        )
        
        return [grassStep, grassRustle]
    }
    
    static func footstepMetal(duration: Double) -> [CHHapticEvent] {
        // Sharp, metallic clank
        let clankIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let clankSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.95))
        let metalClank = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [clankIntensity, clankSharpness],
            relativeTime: 0.0
        )
        
        // Metallic echo/reverberation
        let echoIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let echoSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let metalEcho = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [echoIntensity, echoSharpness],
            relativeTime: 0.03,
            duration: duration - 0.03
        )
        
        return [metalClank, metalEcho]
    }
    
    // MARK: - Vehicle Patterns
    
    static func engineStartEvents(duration: Double) -> [CHHapticEvent] {
        // Initial ignition attempt
        let ignitionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let ignitionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let ignition = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [ignitionIntensity, ignitionSharpness],
            relativeTime: 0.0
        )
        
        // Engine cranking/struggling
        let crankingIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let crankingSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let cranking = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [crankingIntensity, crankingSharpness],
            relativeTime: 0.1,
            duration: duration * 0.3
        )
        
        // Engine catch and roar to life
        let catchTime = duration * 0.4
        let catchIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let catchSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let engineCatch = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [catchIntensity, catchSharpness],
            relativeTime: catchTime
        )
        
        // Steady engine rumble
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let engineRumble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: catchTime + 0.05,
            duration: duration - catchTime - 0.05
        )
        
        return [ignition, cranking, engineCatch, engineRumble]
    }
    
    static func engineStartCurves(duration: Double) -> [CHHapticParameterCurve] {
        let catchTime = duration * 0.4
        
        // Cranking intensity curve - struggling to start
        let crankingCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.15, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.9))
            ],
            relativeTime: 0.1
        )
        
        // Engine rumble settling curve
        let rumbleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - catchTime) * 0.3, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - catchTime, value: Float(0.6))
            ],
            relativeTime: catchTime + 0.05
        )
        
        return [crankingCurve, rumbleCurve]
    }
    
    static func turboBoostEvents(duration: Double) -> [CHHapticEvent] {
        // Turbo spool up
        let spoolIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let spoolSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let turboSpool = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [spoolIntensity, spoolSharpness],
            relativeTime: 0.0,
            duration: duration * 0.3
        )
        
        // Boost kick - the moment turbo engages
        let kickTime = duration * 0.3
        let kickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let kickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let boostKick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [kickIntensity, kickSharpness],
            relativeTime: kickTime
        )
        
        // Sustained acceleration power
        let powerIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let powerSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let acceleration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [powerIntensity, powerSharpness],
            relativeTime: kickTime + 0.05,
            duration: duration - kickTime - 0.05
        )
        
        return [turboSpool, boostKick, acceleration]
    }
    
    static func turboBoostCurves(duration: Double) -> [CHHapticParameterCurve] {
        let kickTime = duration * 0.3
        
        // Spool up curve - building pressure
        let spoolCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.15, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(1.0))
            ],
            relativeTime: 0.0
        )
        
        // Acceleration curve - strong start, gradual settling
        let accelerationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: (duration - kickTime) * 0.4, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration - kickTime, value: Float(0.6))
            ],
            relativeTime: kickTime + 0.05
        )
        
        return [spoolCurve, accelerationCurve]
    }
    
    // MARK: - Magic Patterns
    
    static func portalEnterEvents(duration: Double) -> [CHHapticEvent] {
        // Initial dimensional tear
        let tearIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let tearSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let dimensionalTear = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tearIntensity, tearSharpness],
            relativeTime: 0.0
        )
        
        // Portal energy swirl
        let swirlIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let swirlSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let energySwirl = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [swirlIntensity, swirlSharpness],
            relativeTime: 0.1,
            duration: duration * 0.6
        )
        
        // Phase shift moment - the actual teleportation
        let phaseTime = duration * 0.75
        let phaseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let phaseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let phaseShift = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [phaseIntensity, phaseSharpness],
            relativeTime: phaseTime
        )
        
        return [dimensionalTear, energySwirl, phaseShift]
    }
    
    static func portalEnterCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Swirl intensity curve - building energy
        let swirlCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(1.0))
            ],
            relativeTime: 0.1
        )
        
        return [swirlCurve]
    }
    
    static func magicChargeEvents(duration: Double) -> [CHHapticEvent] {
        // Initial magic spark
        let sparkIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let sparkSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let magicSpark = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [sparkIntensity, sparkSharpness],
            relativeTime: 0.0
        )
        
        // Building magical energy
        let energyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let energySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let buildingEnergy = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [energyIntensity, energySharpness],
            relativeTime: 0.1,
            duration: duration * 0.8
        )
        
        // Magical crescendo - power reaching peak
        let crescendoTime = duration * 0.9
        let crescendoIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let crescendoSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let magicCrescendo = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [crescendoIntensity, crescendoSharpness],
            relativeTime: crescendoTime
        )
        
        return [magicSpark, buildingEnergy, magicCrescendo]
    }
    
    static func magicChargeCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Energy building curve - slow start, dramatic crescendo
        let energyCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.8, value: Float(1.0))
            ],
            relativeTime: 0.1
        )
        
        // Sharpness curve - getting more focused as power builds
        let sharpnessCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(-0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.8, value: Float(0.5))
            ],
            relativeTime: 0.1
        )
        
        return [energyCurve, sharpnessCurve]
    }
    
    // MARK: - Machine Gun Pattern
    
    static func machineGun(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Rapid-fire pattern - 15-20 shots per second
        let shotInterval = 0.06 // ~16.7 shots per second
        let shotCount = Int(duration / shotInterval)
        
        for i in 0..<shotCount {
            let shotTime = Double(i) * shotInterval
            
            // Vary intensity slightly for realism
            let baseIntensity: Float = 0.6
            let variation = Float.random(in: -0.1...0.1)
            let shotIntensity = max(0.4, min(0.8, baseIntensity + variation))
            
            let bulletIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: shotIntensity)
            let bulletSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let bullet = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [bulletIntensity, bulletSharpness],
                relativeTime: shotTime
            )
            events.append(bullet)
        }
        
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
    
    // MARK: - Cascade Pattern
    
    static func cascadeEvents(duration: Double) -> [CHHapticEvent] {
        // Primary cascade wave
        let cascadeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let cascadeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let cascadeWave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [cascadeIntensity, cascadeSharpness],
            relativeTime: 0.0,
            duration: duration * 0.8
        )
        
        // Peak impact at the end
        let peakTime = duration * 0.8
        let peakIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let peakSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let cascadePeak = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [peakIntensity, peakSharpness],
            relativeTime: peakTime
        )
        
        return [cascadeWave, cascadePeak]
    }
    
    static func cascadeCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Cascade building curve - exponential growth
        let cascadeCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.3, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.6, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.8, value: Float(1.0))
            ],
            relativeTime: 0.0
        )
        
        return [cascadeCurve]
    }
    
    // MARK: - Elastic Bounce Pattern
    
    static func elasticBounceEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Create bouncing pattern with decreasing height
        let bounceCount = 5
        var currentTime = 0.0
        
        for i in 0..<bounceCount {
            let intensity = Float(0.8) * Float(pow(0.7, Double(i)))
            let bounceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let bounceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            
            let bounce = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [bounceIntensity, bounceSharpness],
                relativeTime: currentTime
            )
            events.append(bounce)
            
            // Time between bounces decreases
            currentTime += duration / Double(bounceCount + 2) * (1.5 - Double(i) * 0.2)
        }
        
        return events
    }
    
    static func elasticBounceCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Add subtle continuous vibration between bounces
        let vibrationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        return [vibrationCurve]
    }
}