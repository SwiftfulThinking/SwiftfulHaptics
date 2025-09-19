//
//  IntenseGamificationHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct IntenseGamificationHapticPatterns {
    
    // MARK: - Elemental Powers
    
    static func fireBurstEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Ignition spark
        let sparkIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let sparkSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let spark = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [sparkIntensity, sparkSharpness],
            relativeTime: 0.0
        )
        events.append(spark)
        
        // Flame whoosh
        let flameIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let flameSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let flame = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [flameIntensity, flameSharpness],
            relativeTime: 0.05,
            duration: 0.3
        )
        events.append(flame)
        
        // Heat waves
        let waveCount = 3
        for i in 0..<waveCount {
            let waveTime = 0.35 + Double(i) * 0.15
            let intensity = Float(0.6 - (Float(i) * 0.15))
            let waveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let waveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let wave = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [waveIntensity, waveSharpness],
                relativeTime: waveTime,
                duration: 0.1
            )
            events.append(wave)
        }
        
        // Ember fade
        let emberIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let emberSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let ember = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [emberIntensity, emberSharpness],
            relativeTime: 0.8,
            duration: duration - 0.8
        )
        events.append(ember)
        
        return events
    }
    
    static func fireBurstCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Flame intensity flicker
        let flickerCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.4))
            ],
            relativeTime: 0.05
        )
        
        return [flickerCurve]
    }
    
    static func iceShardEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Crystallization
        let crystalIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let crystalSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let crystallize = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [crystalIntensity, crystalSharpness],
            relativeTime: 0.0,
            duration: 0.2
        )
        events.append(crystallize)
        
        // Ice crack
        let crackIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let crackSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let crack = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [crackIntensity, crackSharpness],
            relativeTime: 0.25
        )
        events.append(crack)
        
        // Shard scatter
        let shardCount = 5
        for i in 0..<shardCount {
            let shardTime = 0.3 + Double(i) * 0.08
            let shardIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let shardSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let shard = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [shardIntensity, shardSharpness],
                relativeTime: shardTime
            )
            events.append(shard)
        }
        
        // Frost settle
        let frostIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let frostSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let frost = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [frostIntensity, frostSharpness],
            relativeTime: 0.7,
            duration: duration - 0.7
        )
        events.append(frost)
        
        return events
    }
    
    static func iceShardCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Freezing effect curve
        let freezeCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.7))
            ],
            relativeTime: 0.0
        )
        
        return [freezeCurve]
    }
    
    static func earthquakeRumbleEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Initial tremor
        let tremorIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let tremorSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let tremor = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tremorIntensity, tremorSharpness],
            relativeTime: 0.0,
            duration: 0.3
        )
        events.append(tremor)
        
        // Main quake
        let quakeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let quakeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let mainQuake = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [quakeIntensity, quakeSharpness],
            relativeTime: 0.3,
            duration: 0.8
        )
        events.append(mainQuake)
        
        // Rock impacts
        let impactCount = 5
        for i in 0..<impactCount {
            let impactTime = 0.4 + Double(i) * 0.15
            let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
            let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let impact = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [impactIntensity, impactSharpness],
                relativeTime: impactTime
            )
            events.append(impact)
        }
        
        // Aftershocks
        let aftershockIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let aftershockSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let aftershock = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [aftershockIntensity, aftershockSharpness],
            relativeTime: 1.2,
            duration: duration - 1.2
        )
        events.append(aftershock)
        
        return events
    }
    
    static func earthquakeRumbleCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Seismic intensity variation
        let seismicCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.15, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.45, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.85)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.7))
            ],
            relativeTime: 0.3
        )
        
        return [seismicCurve]
    }
    
    static func windTornadoEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Wind buildup
        let buildupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let buildupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let buildup = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildupIntensity, buildupSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(buildup)
        
        // Vortex formation
        let vortexIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let vortexSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let vortex = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [vortexIntensity, vortexSharpness],
            relativeTime: 0.5,
            duration: duration - 0.5
        )
        events.append(vortex)
        
        // Debris hits
        let debrisCount = 7
        for i in 0..<debrisCount {
            let debrisTime = 0.6 + Double(i) * 0.2
            let intensity = Float.random(in: 0.4...0.8)
            let debrisIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let debrisSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let debris = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [debrisIntensity, debrisSharpness],
                relativeTime: debrisTime
            )
            events.append(debris)
        }
        
        return events
    }
    
    static func windTornadoCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Cyclonic rotation
        let rotationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.6))
            ],
            relativeTime: 0.0
        )
        
        // Wind turbulence
        let turbulenceCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.15, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.45, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.5))
            ],
            relativeTime: 0.5
        )
        
        return [rotationCurve, turbulenceCurve]
    }
    
    // MARK: - Space & Sci-Fi
    
    static func plasmaChargeEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Energy accumulation
        let energyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let energySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let energy = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [energyIntensity, energySharpness],
            relativeTime: 0.0,
            duration: 0.6
        )
        events.append(energy)
        
        // Plasma instability pulses
        let pulseCount = 4
        for i in 0..<pulseCount {
            let pulseTime = 0.1 + Double(i) * 0.12
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Plasma discharge
        let dischargeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let dischargeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let discharge = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [dischargeIntensity, dischargeSharpness],
            relativeTime: 0.7
        )
        events.append(discharge)
        
        // Plasma stream
        let streamIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let streamSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let stream = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [streamIntensity, streamSharpness],
            relativeTime: 0.7,
            duration: 0.5
        )
        events.append(stream)
        
        // Energy dissipation
        let dissipateIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let dissipateSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let dissipate = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [dissipateIntensity, dissipateSharpness],
            relativeTime: 1.2,
            duration: duration - 1.2
        )
        events.append(dissipate)
        
        return events
    }
    
    static func plasmaChargeCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Plasma field oscillation
        let plasmaCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.7))
            ],
            relativeTime: 0.0
        )
        
        return [plasmaCurve]
    }
    
    static func gravityWellEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Space-time distortion
        let distortionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let distortionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let distortion = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [distortionIntensity, distortionSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(distortion)
        
        // Gravitational pull
        let pullIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let pullSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let pull = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [pullIntensity, pullSharpness],
            relativeTime: 0.5,
            duration: 1.0
        )
        events.append(pull)
        
        // Tidal forces
        let tidalCount = 6
        for i in 0..<tidalCount {
            let tidalTime = 0.6 + Double(i) * 0.2
            let intensity = Float(0.7 + sin(Float(i) * .pi / 3) * 0.2)
            let tidalIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let tidalSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
            let tidal = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [tidalIntensity, tidalSharpness],
                relativeTime: tidalTime
            )
            events.append(tidal)
        }
        
        // Event horizon
        let horizonIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let horizonSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let horizon = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [horizonIntensity, horizonSharpness],
            relativeTime: 1.8,
            duration: duration - 1.8
        )
        events.append(horizon)
        
        return events
    }
    
    static func gravityWellCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Gravitational field strength
        let gravityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.85)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.95)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(1.0))
            ],
            relativeTime: 0.5
        )
        
        // Space-time warping
        let warpingCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.1))
            ],
            relativeTime: 0.0
        )
        
        return [gravityCurve, warpingCurve]
    }
    
    static func photonBlastEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Photon charge
        let chargeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let chargeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let charge = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [chargeIntensity, chargeSharpness],
            relativeTime: 0.0,
            duration: 0.3
        )
        events.append(charge)
        
        // Light burst
        let burstIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let burstSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let burst = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [burstIntensity, burstSharpness],
            relativeTime: 0.3
        )
        events.append(burst)
        
        // Photon stream pulses
        let streamCount = 8
        for i in 0..<streamCount {
            let streamTime = 0.35 + Double(i) * 0.08
            let streamIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
            let streamSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.95))
            let stream = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [streamIntensity, streamSharpness],
                relativeTime: streamTime
            )
            events.append(stream)
        }
        
        // Light decay
        let decayIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let decaySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let decay = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [decayIntensity, decaySharpness],
            relativeTime: 1.0,
            duration: duration - 1.0
        )
        events.append(decay)
        
        return events
    }
    
    static func photonBlastCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Light intensity flicker
        let lightCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.95)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.4))
            ],
            relativeTime: 0.35
        )
        
        return [lightCurve]
    }
    
    static func quantumShiftEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Quantum instability
        let instabilityCount = 5
        for i in 0..<instabilityCount {
            let instabilityTime = Double(i) * 0.15
            let phase = Float.random(in: 0.3...0.7)
            let instabilityIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: phase)
            let instabilitySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let instability = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [instabilityIntensity, instabilitySharpness],
                relativeTime: instabilityTime
            )
            events.append(instability)
        }
        
        // State collapse
        let collapseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let collapseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let collapse = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [collapseIntensity, collapseSharpness],
            relativeTime: 0.8
        )
        events.append(collapse)
        
        // Quantum tunneling
        let tunnelIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let tunnelSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let tunnel = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tunnelIntensity, tunnelSharpness],
            relativeTime: 0.85,
            duration: 0.3
        )
        events.append(tunnel)
        
        // New state emergence
        let emergeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let emergeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let emerge = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [emergeIntensity, emergeSharpness],
            relativeTime: 1.2
        )
        events.append(emerge)
        
        // Quantum coherence
        let coherenceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let coherenceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let coherence = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [coherenceIntensity, coherenceSharpness],
            relativeTime: 1.3,
            duration: duration - 1.3
        )
        events.append(coherence)
        
        return events
    }
    
    static func quantumShiftCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Probability wave function
        let probabilityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.5))
            ],
            relativeTime: 0.0
        )
        
        return [probabilityCurve]
    }
    
    // MARK: - Epic Abilities
    
    static func ultimatePowerEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Power awakening
        let awakeningIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let awakeningSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let awakening = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [awakeningIntensity, awakeningSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(awakening)
        
        // Power surge waves
        let surgeCount = 3
        for i in 0..<surgeCount {
            let surgeTime = 0.1 + Double(i) * 0.2
            let surgeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6 + Float(i) * 0.1))
            let surgeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let surge = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [surgeIntensity, surgeSharpness],
                relativeTime: surgeTime
            )
            events.append(surge)
        }
        
        // Ultimate explosion
        let explosionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let explosionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let explosion = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [explosionIntensity, explosionSharpness],
            relativeTime: 0.8
        )
        events.append(explosion)
        
        // Power field
        let fieldIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let fieldSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let powerField = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [fieldIntensity, fieldSharpness],
            relativeTime: 0.8,
            duration: 1.0
        )
        events.append(powerField)
        
        // Energy waves
        let waveCount = 5
        for i in 0..<waveCount {
            let waveTime = 0.9 + Double(i) * 0.25
            let waveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let waveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let wave = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [waveIntensity, waveSharpness],
                relativeTime: waveTime
            )
            events.append(wave)
        }
        
        // Power stabilization
        let stabilizeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let stabilizeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let stabilize = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [stabilizeIntensity, stabilizeSharpness],
            relativeTime: 2.2,
            duration: duration - 2.2
        )
        events.append(stabilize)
        
        return events
    }
    
    static func ultimatePowerCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Power level curve
        let powerCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.85)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(0.95)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.8))
            ],
            relativeTime: 0.0
        )
        
        // Energy resonance
        let resonanceCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.4))
            ],
            relativeTime: 0.8
        )
        
        return [powerCurve, resonanceCurve]
    }
    
    static func dragonRoarEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Breath intake
        let intakeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let intakeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let intake = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [intakeIntensity, intakeSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(intake)
        
        // Roar burst
        let roarIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let roarSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let roar = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [roarIntensity, roarSharpness],
            relativeTime: 0.5
        )
        events.append(roar)
        
        // Roar sustain
        let sustainIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let sustainSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let sustain = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [sustainIntensity, sustainSharpness],
            relativeTime: 0.5,
            duration: 1.2
        )
        events.append(sustain)
        
        // Sound waves
        let waveCount = 4
        for i in 0..<waveCount {
            let waveTime = 0.6 + Double(i) * 0.3
            let waveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let waveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let wave = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [waveIntensity, waveSharpness],
                relativeTime: waveTime
            )
            events.append(wave)
        }
        
        // Echo fade
        let echoIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let echoSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let echo = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [echoIntensity, echoSharpness],
            relativeTime: 1.8,
            duration: duration - 1.8
        )
        events.append(echo)
        
        return events
    }
    
    static func dragonRoarCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Roar intensity modulation
        let roarCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.95)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.85)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.6))
            ],
            relativeTime: 0.5
        )
        
        return [roarCurve]
    }
    
    static func titanSmashEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Ground tremor warning
        let tremorIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let tremorSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let tremor = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tremorIntensity, tremorSharpness],
            relativeTime: 0.0,
            duration: 0.4
        )
        events.append(tremor)
        
        // Titan wind-up
        let windupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let windupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let windup = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [windupIntensity, windupSharpness],
            relativeTime: 0.4,
            duration: 0.3
        )
        events.append(windup)
        
        // Massive impact
        let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.1))
        let impact = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [impactIntensity, impactSharpness],
            relativeTime: 0.7
        )
        events.append(impact)
        
        // Shockwave
        let shockwaveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let shockwaveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let shockwave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [shockwaveIntensity, shockwaveSharpness],
            relativeTime: 0.75,
            duration: 0.4
        )
        events.append(shockwave)
        
        // Ground cracks
        let crackCount = 5
        for i in 0..<crackCount {
            let crackTime = 0.8 + Double(i) * 0.15
            let crackIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let crackSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let crack = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [crackIntensity, crackSharpness],
                relativeTime: crackTime
            )
            events.append(crack)
        }
        
        // Rubble settle
        let rubbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let rubbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let rubble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rubbleIntensity, rubbleSharpness],
            relativeTime: 1.6,
            duration: duration - 1.6
        )
        events.append(rubble)
        
        return events
    }
    
    static func titanSmashCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Impact force curve
        let impactCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.05, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.95)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.85)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.3))
            ],
            relativeTime: 0.75
        )
        
        return [impactCurve]
    }
    
    static func dimensionalRiftEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Reality tear start
        let tearCount = 4
        for i in 0..<tearCount {
            let tearTime = Double(i) * 0.15
            let tearIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5 + Float(i) * 0.1))
            let tearSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let tear = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [tearIntensity, tearSharpness],
                relativeTime: tearTime
            )
            events.append(tear)
        }
        
        // Dimension breach
        let breachIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let breachSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let breach = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [breachIntensity, breachSharpness],
            relativeTime: 0.7
        )
        events.append(breach)
        
        // Void exposure
        let voidIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let voidSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let voidExposure = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [voidIntensity, voidSharpness],
            relativeTime: 0.8,
            duration: 0.5
        )
        events.append(voidExposure)
        
        // Reality flux
        let fluxIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let fluxSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let flux = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [fluxIntensity, fluxSharpness],
            relativeTime: 1.3,
            duration: 0.7
        )
        events.append(flux)
        
        // Dimension stabilization pulses
        let stabilizeCount = 3
        for i in 0..<stabilizeCount {
            let stabilizeTime = 2.0 + Double(i) * 0.2
            let stabilizeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let stabilizeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let stabilize = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [stabilizeIntensity, stabilizeSharpness],
                relativeTime: stabilizeTime
            )
            events.append(stabilize)
        }
        
        return events
    }
    
    static func dimensionalRiftCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Reality distortion wave
        let distortionCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.15, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.45, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.75, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.5))
            ],
            relativeTime: 1.3
        )
        
        return [distortionCurve]
    }
    
    // MARK: - Power-Ups
    
    static func megaBoostEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Power surge initiation
        let surgeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6)
        let surgeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let surge = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [surgeIntensity, surgeSharpness],
            relativeTime: 0.0,
            duration: 0.3
        )
        events.append(surge)
        
        // Boost activation
        let boostIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let boostSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
        let boost = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [boostIntensity, boostSharpness],
            relativeTime: 0.3
        )
        events.append(boost)
        
        // Speed force
        let forceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9)
        let forceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let force = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [forceIntensity, forceSharpness],
            relativeTime: 0.35,
            duration: 0.8
        )
        events.append(force)
        
        // Energy ripples
        let rippleCount = 6
        for i in 0..<rippleCount {
            let rippleTime = 0.4 + Double(i) * 0.15
            let rippleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7)
            let rippleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
            let ripple = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [rippleIntensity, rippleSharpness],
                relativeTime: rippleTime
            )
            events.append(ripple)
        }
        
        return events
    }
    
    static func megaBoostCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Overcharge power curve
        let powerCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: 0.85),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 0.95),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.6)
            ],
            relativeTime: 0.35
        )
        
        return [powerCurve]
    }
    
    static func starPowerEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Star collection
        let collectIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let collectSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let collect = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [collectIntensity, collectSharpness],
            relativeTime: 0.0
        )
        events.append(collect)
        
        // Invincibility activation
        let invincibleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let invincibleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let invincible = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [invincibleIntensity, invincibleSharpness],
            relativeTime: 0.1
        )
        events.append(invincible)
        
        // Star sparkles
        let sparkleCount = 8
        for i in 0..<sparkleCount {
            let sparkleTime = 0.2 + Double(i) * 0.2
            let intensity = Float(0.5 + sin(Float(i) * .pi / 4) * 0.3)
            let sparkleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let sparkleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let sparkle = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [sparkleIntensity, sparkleSharpness],
                relativeTime: sparkleTime
            )
            events.append(sparkle)
        }
        
        // Power glow
        let glowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let glowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let glow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [glowIntensity, glowSharpness],
            relativeTime: 0.3,
            duration: duration - 0.3
        )
        events.append(glow)
        
        return events
    }
    
    static func starPowerCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Sparkle intensity variation
        let sparkleCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.125, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.25, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.375, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.625, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.75, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.875, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.3))
            ],
            relativeTime: 0.3
        )
        
        return [sparkleCurve]
    }
    
    static func berserkerRageEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Rage building - heartbeat acceleration
        let heartbeatCount = 5
        for i in 0..<heartbeatCount {
            let beatTime = Double(i) * (0.3 - Double(i) * 0.04) // Accelerating
            let beatIntensity = 0.4 + Float(i) * 0.12
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: beatIntensity)
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
            let heartbeat = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensityParam, sharpnessParam],
                relativeTime: beatTime
            )
            events.append(heartbeat)
        }
        
        // Rage explosion
        let rageIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let rageSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let rage = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [rageIntensity, rageSharpness],
            relativeTime: 0.8
        )
        events.append(rage)
        
        // Primal fury
        let furyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9)
        let furySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
        let fury = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [furyIntensity, furySharpness],
            relativeTime: 0.8,
            duration: 0.8
        )
        events.append(fury)
        
        // Wild strikes
        let strikeCount = 4
        for i in 0..<strikeCount {
            let strikeTime = 0.9 + Double(i) * 0.2
            let strikeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.85)
            let strikeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
            let strike = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [strikeIntensity, strikeSharpness],
                relativeTime: strikeTime
            )
            events.append(strike)
        }
        
        // Exhaustion tremor
        let exhaustIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let exhaustSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let exhaust = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [exhaustIntensity, exhaustSharpness],
            relativeTime: 1.7,
            duration: duration - 1.7
        )
        events.append(exhaust)
        
        return events
    }
    
    static func berserkerRageCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Rage intensity fluctuation
        let rageCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.15, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.45, value: 0.95),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.75, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.4)
            ],
            relativeTime: 0.8
        )
        
        return [rageCurve]
    }
    
    // MARK: Divine Intervention
    static func divineInterventionEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Heavenly choir buildup
        let choirIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let choirSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let choir = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [choirIntensity, choirSharpness],
            relativeTime: 0.0,
            duration: 0.6
        )
        events.append(choir)
        
        // Divine light burst
        let lightIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9)
        let lightSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let light = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [lightIntensity, lightSharpness],
            relativeTime: 0.7
        )
        events.append(light)
        
        // Holy power descending
        let holyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let holySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let holy = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [holyIntensity, holySharpness],
            relativeTime: 0.8,
            duration: 1.0
        )
        events.append(holy)
        
        // Blessing pulses
        let blessingCount = 5
        for i in 0..<blessingCount {
            let pulseTime = 0.9 + Double(i) * 0.25
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6)
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Angelic resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4)
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
        let resonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 1.8,
            duration: duration - 1.8
        )
        events.append(resonance)
        
        return events
    }
    
    static func divineInterventionCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Holy power descent
        let holyCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.6)
            ],
            relativeTime: 0.0
        )
        
        // Angelic harmony
        let harmonyCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.25, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.75, value: 0.85),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.6)
            ],
            relativeTime: 0.8
        )
        
        return [holyCurve, harmonyCurve]
    }
    
    static func divineShieldEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Holy activation
        let holyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let holySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let holy = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [holyIntensity, holySharpness],
            relativeTime: 0.0
        )
        events.append(holy)
        
        // Shield formation rings
        let ringCount = 3
        for i in 0..<ringCount {
            let ringTime = 0.1 + Double(i) * 0.2
            let ringIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let ringSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let ring = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [ringIntensity, ringSharpness],
                relativeTime: ringTime
            )
            events.append(ring)
            
            // Ring resonance
            let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let resonance = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [resonanceIntensity, resonanceSharpness],
                relativeTime: ringTime + 0.05,
                duration: 0.15
            )
            events.append(resonance)
        }
        
        // Divine protection
        let protectionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let protectionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let protection = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [protectionIntensity, protectionSharpness],
            relativeTime: 0.8,
            duration: duration - 0.8
        )
        events.append(protection)
        
        return events
    }
    
    static func divineShieldCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Holy energy pulse
        let holyCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.3))
            ],
            relativeTime: 0.8
        )
        
        return [holyCurve]
    }
    
    static func volcanicEruptionEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Seismic rumble
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let rumble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: 0.0,
            duration: 0.8
        )
        events.append(rumble)
        
        // Explosive eruption
        let eruptionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let eruptionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let eruption = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [eruptionIntensity, eruptionSharpness],
            relativeTime: 0.8
        )
        events.append(eruption)
        
        // Lava flow - hot, viscous movement
        let lavaIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let lavaSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let lavaFlow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [lavaIntensity, lavaSharpness],
            relativeTime: 0.9,
            duration: 1.5
        )
        events.append(lavaFlow)
        
        // Pyroclastic blasts
        let blastCount = 4
        for i in 0..<blastCount {
            let blastTime = 1.0 + Double(i) * 0.4
            let blastIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
            let blastSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let blast = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [blastIntensity, blastSharpness],
                relativeTime: blastTime
            )
            events.append(blast)
        }
        
        // Ash and smoke
        let ashIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let ashSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let ash = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [ashIntensity, ashSharpness],
            relativeTime: 2.4,
            duration: duration - 2.4
        )
        events.append(ash)
        
        return events
    }
    
    static func volcanicEruptionCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Lava flow intensity - bubbling and flowing
        let lavaCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.4))
            ],
            relativeTime: 0.9
        )
        
        return [lavaCurve]
    }
    
    // Additional Intense Gamification Patterns
    
    static func rocketLaunchEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Ignition sequence - countdown pulses
        let countdownPulses = 3
        for i in 0..<countdownPulses {
            let pulseTime = Double(i) * 0.3
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Engine ignition
        let ignitionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let ignitionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let ignition = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [ignitionIntensity, ignitionSharpness],
            relativeTime: 1.0
        )
        events.append(ignition)
        
        // Thrust buildup
        let thrustIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let thrustSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let thrust = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [thrustIntensity, thrustSharpness],
            relativeTime: 1.0,
            duration: duration - 1.0
        )
        events.append(thrust)
        
        // Liftoff boom
        let liftoffIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let liftoffSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let liftoff = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [liftoffIntensity, liftoffSharpness],
            relativeTime: 1.5
        )
        events.append(liftoff)
        
        return events
    }
    
    static func rocketLaunchCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Thrust acceleration curve
        let thrustCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.85)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(0.95)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.85))
            ],
            relativeTime: 1.0
        )
        
        // Engine vibration
        let vibrationCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.3))
            ],
            relativeTime: 1.0
        )
        
        return [thrustCurve, vibrationCurve]
    }
    
    static func warpDriveEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Energy charging
        let chargeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let chargeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let charge = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [chargeIntensity, chargeSharpness],
            relativeTime: 0.0,
            duration: 0.7
        )
        events.append(charge)
        
        // Reality distortion pulses
        let distortionCount = 3
        for i in 0..<distortionCount {
            let pulseTime = 0.2 + Double(i) * 0.15
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Warp engagement - reality tear
        let warpIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let warpSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let warpEngage = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [warpIntensity, warpSharpness],
            relativeTime: 0.8
        )
        events.append(warpEngage)
        
        // Hyperspace stream
        let streamIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let streamSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let hyperspace = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [streamIntensity, streamSharpness],
            relativeTime: 0.85,
            duration: 0.8
        )
        events.append(hyperspace)
        
        // Exit snap
        let exitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let exitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let exit = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [exitIntensity, exitSharpness],
            relativeTime: 1.7
        )
        events.append(exit)
        
        return events
    }
    
    static func warpDriveCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Space-time distortion
        let distortionCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        // Hyperspace wobble
        let wobbleCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.6))
            ],
            relativeTime: 0.85
        )
        
        return [distortionCurve, wobbleCurve]
    }
    
    static func laserCannonEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Capacitor charge
        let chargeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let chargeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let charge = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [chargeIntensity, chargeSharpness],
            relativeTime: 0.0,
            duration: 0.4
        )
        events.append(charge)
        
        // Pre-fire hum
        let humIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let humSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let hum = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [humIntensity, humSharpness],
            relativeTime: 0.4,
            duration: 0.2
        )
        events.append(hum)
        
        // Laser discharge
        let laserIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let laserSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let laser = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [laserIntensity, laserSharpness],
            relativeTime: 0.6
        )
        events.append(laser)
        
        // Beam sustain
        let beamIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let beamSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let beam = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [beamIntensity, beamSharpness],
            relativeTime: 0.6,
            duration: 0.6
        )
        events.append(beam)
        
        // Overheat cooldown
        let cooldownIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let cooldownSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let cooldown = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [cooldownIntensity, cooldownSharpness],
            relativeTime: 1.2,
            duration: duration - 1.2
        )
        events.append(cooldown)
        
        return events
    }
    
    static func laserCannonCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Beam intensity fluctuation
        let beamCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.95)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: Float(0.85)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.7))
            ],
            relativeTime: 0.6
        )
        
        return [beamCurve]
    }
    
    static func alienTeleportEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Phase shift initialization
        let phaseCount = 5
        for i in 0..<phaseCount {
            let phaseTime = Double(i) * 0.15
            let phaseIntensity = Float(0.4 + Float(i) * 0.1)
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: phaseIntensity)
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let phase = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensityParam, sharpnessParam],
                relativeTime: phaseTime
            )
            events.append(phase)
        }
        
        // Dimensional rift
        let riftIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let riftSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let rift = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [riftIntensity, riftSharpness],
            relativeTime: 0.8,
            duration: 0.5
        )
        events.append(rift)
        
        // Dematerialization
        let dematerialIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let dematerialSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let dematerialize = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [dematerialIntensity, dematerialSharpness],
            relativeTime: 1.0
        )
        events.append(dematerialize)
        
        // Void travel
        let voidIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let voidSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.3))
        let voidEvent = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [voidIntensity, voidSharpness],
            relativeTime: 1.1,
            duration: 0.4
        )
        events.append(voidEvent)
        
        // Rematerialization
        let rematerialIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let rematerialSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let rematerialize = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [rematerialIntensity, rematerialSharpness],
            relativeTime: 1.6
        )
        events.append(rematerialize)
        
        // Stabilization pulses
        let stabilizeCount = 3
        for i in 0..<stabilizeCount {
            let pulseTime = 1.7 + Double(i) * 0.1
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        return events
    }
    
    static func alienTeleportCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Dimensional warping
        let warpCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.7)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.5))
            ],
            relativeTime: 0.8
        )
        
        return [warpCurve]
    }
    
    static func spaceExplosionEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Warning alarms
        let alarmCount = 3
        for i in 0..<alarmCount {
            let alarmTime = Double(i) * 0.2
            let alarmIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let alarmSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let alarm = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [alarmIntensity, alarmSharpness],
                relativeTime: alarmTime
            )
            events.append(alarm)
        }
        
        // Core breach
        let breachIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let breachSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let breach = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [breachIntensity, breachSharpness],
            relativeTime: 0.8
        )
        events.append(breach)
        
        // Decompression blast
        let decompressionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.9))
        let decompressionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let decompression = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [decompressionIntensity, decompressionSharpness],
            relativeTime: 0.8,
            duration: 0.6
        )
        events.append(decompression)
        
        // Debris scatter
        let debrisCount = 8
        for i in 0..<debrisCount {
            let debrisTime = 0.9 + Double(i) * 0.15
            let debrisIntensity = Float.random(in: 0.4...0.8)
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: debrisIntensity)
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let debris = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensityParam, sharpnessParam],
                relativeTime: debrisTime
            )
            events.append(debris)
        }
        
        // Vacuum silence
        let silenceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.1))
        let silenceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.2))
        let silence = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [silenceIntensity, silenceSharpness],
            relativeTime: 2.0,
            duration: duration - 2.0
        )
        events.append(silence)
        
        return events
    }
    
    static func spaceExplosionCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Explosion shockwave expansion
        let shockwaveCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.9)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.05, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.0))
            ],
            relativeTime: 0.8
        )
        
        return [shockwaveCurve]
    }
    
    // MARK: - Thunder Storm
    static func thunderStormEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Initial distant rumble
        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
        let distantRumble = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [rumbleIntensity, rumbleSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(distantRumble)
        
        // Lightning flash - multiple strikes
        let strikeCount = 3
        for i in 0..<strikeCount {
            let strikeTime = 0.7 + Double(i) * 0.3
            let strikeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
            let strikeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
            let lightningStrike = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [strikeIntensity, strikeSharpness],
                relativeTime: strikeTime
            )
            events.append(lightningStrike)
            
            // Electric crackle after each strike
            let crackleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7)
            let crackleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
            let crackle = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [crackleIntensity, crackleSharpness],
                relativeTime: strikeTime + 0.05,
                duration: 0.2
            )
            events.append(crackle)
        }
        
        // Thunder boom - massive resonance
        let boomIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9)
        let boomSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        let thunderBoom = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [boomIntensity, boomSharpness],
            relativeTime: 1.8,
            duration: duration - 1.8
        )
        events.append(thunderBoom)
        
        return events
    }
    
    static func thunderStormCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Rolling thunder intensity curve
        let thunderCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.3),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.5),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: 0.2)
            ],
            relativeTime: 1.8
        )
        
        return [thunderCurve]
    }
    
    // MARK: - Meteor Impact
    static func meteorImpactEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Incoming whistle/whoosh
        let whooshIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4)
        let whooshSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let incoming = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [whooshIntensity, whooshSharpness],
            relativeTime: 0.0,
            duration: 1.0
        )
        events.append(incoming)
        
        // Massive impact
        let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
        let impact = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [impactIntensity, impactSharpness],
            relativeTime: 1.0
        )
        events.append(impact)
        
        // Ground shaking aftershocks
        let shockCount = 5
        for i in 0..<shockCount {
            let shockTime = 1.1 + Double(i) * 0.3
            let shockPower = 0.8 - Float(i) * 0.1
            let shockIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: shockPower)
            let shockSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
            let aftershock = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [shockIntensity, shockSharpness],
                relativeTime: shockTime
            )
            events.append(aftershock)
        }
        
        // Debris and rumbling
        let debrisIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let debrisSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let debris = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [debrisIntensity, debrisSharpness],
            relativeTime: 1.2,
            duration: duration - 1.2
        )
        events.append(debris)
        
        return events
    }
    
    static func meteorImpactCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Incoming intensity buildup
        let incomingCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.2),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 0.5),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 1.0)
            ],
            relativeTime: 0.0
        )
        
        // Debris settling
        let debrisCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.0)
            ],
            relativeTime: 1.2
        )
        
        return [incomingCurve, debrisCurve]
    }
    
    // MARK: Earthquake
    static func earthquakeEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Initial tremor warning
        let warningIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let warningSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.4)
        let warning = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [warningIntensity, warningSharpness],
            relativeTime: 0.0,
            duration: 0.3
        )
        events.append(warning)
        
        // Main quake - violent shaking
        let quakeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9)
        let quakeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let mainQuake = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [quakeIntensity, quakeSharpness],
            relativeTime: 0.4,
            duration: 1.2
        )
        events.append(mainQuake)
        
        // Multiple impact jolts during quake
        let joltCount = 8
        for i in 0..<joltCount {
            let joltTime = 0.5 + Double(i) * 0.15
            let joltIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
            let joltSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
            let jolt = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [joltIntensity, joltSharpness],
                relativeTime: joltTime
            )
            events.append(jolt)
        }
        
        // Aftershock
        let aftershockIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let aftershockSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let aftershock = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [aftershockIntensity, aftershockSharpness],
            relativeTime: 1.7,
            duration: duration - 1.7
        )
        events.append(aftershock)
        
        return events
    }
    
    static func earthquakeCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Violent shaking pattern
        let shakeCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.5)
            ],
            relativeTime: 0.4
        )
        
        return [shakeCurve]
    }
    
    // MARK: - Tornado
    static func tornadoEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Wind building up
        let windBuildIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let windBuildSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
        let windBuild = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [windBuildIntensity, windBuildSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(windBuild)
        
        // Vortex core - intense rotation
        let vortexIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let vortexSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let vortex = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [vortexIntensity, vortexSharpness],
            relativeTime: 0.5,
            duration: 1.5
        )
        events.append(vortex)
        
        // Debris hits
        let debrisCount = 10
        for i in 0..<debrisCount {
            let hitTime = 0.6 + Double(i) * 0.15
            let hitIntensity = Float.random(in: 0.5...0.9)
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: hitIntensity)
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
            let debrisHit = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensityParam, sharpnessParam],
                relativeTime: hitTime
            )
            events.append(debrisHit)
        }
        
        // Wind dying down
        let windDownIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4)
        let windDownSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let windDown = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [windDownIntensity, windDownSharpness],
            relativeTime: 2.0,
            duration: duration - 2.0
        )
        events.append(windDown)
        
        return events
    }
    
    static func tornadoCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Rotation intensity pattern
        let rotationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.5),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.7, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.6)
            ],
            relativeTime: 0.5
        )
        
        return [rotationCurve]
    }
    
    // MARK: - Titan Stomp
    static func titanStompEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Foot lifting - ground tension release
        let liftIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let liftSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.4)
        let lift = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [liftIntensity, liftSharpness],
            relativeTime: 0.0,
            duration: 0.3
        )
        events.append(lift)
        
        // Massive impact
        let impactIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let impactSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let impact = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [impactIntensity, impactSharpness],
            relativeTime: 0.5
        )
        events.append(impact)
        
        // Ground quake
        let quakeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let quakeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let quake = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [quakeIntensity, quakeSharpness],
            relativeTime: 0.5,
            duration: 0.7
        )
        events.append(quake)
        
        // Shockwave ripples
        let rippleCount = 3
        for i in 0..<rippleCount {
            let rippleTime = 0.6 + Double(i) * 0.2
            let rippleIntensity = 0.7 - Float(i) * 0.2
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: rippleIntensity)
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
            let ripple = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensityParam, sharpnessParam],
                relativeTime: rippleTime
            )
            events.append(ripple)
        }
        
        // Settling dust
        let dustIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.2)
        let dustSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let dust = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [dustIntensity, dustSharpness],
            relativeTime: 1.2,
            duration: duration - 1.2
        )
        events.append(dust)
        
        return events
    }
    
    static func titanStompCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Ground shake intensity
        let shakeCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.2)
            ],
            relativeTime: 0.5
        )
        
        return [shakeCurve]
    }
    
    // MARK: - Phoenix Rebirth
    static func phoenixRebirthEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Death throes
        let deathIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7)
        let deathSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let death = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [deathIntensity, deathSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(death)
        
        // Ash collapse
        let collapseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4)
        let collapseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let collapse = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [collapseIntensity, collapseSharpness],
            relativeTime: 0.5
        )
        events.append(collapse)
        
        // Ember glow building
        let emberIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let emberSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let embers = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [emberIntensity, emberSharpness],
            relativeTime: 0.8,
            duration: 0.8
        )
        events.append(embers)
        
        // Fiery explosion
        let explosionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let explosionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let explosion = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [explosionIntensity, explosionSharpness],
            relativeTime: 1.6
        )
        events.append(explosion)
        
        // Phoenix cry
        let cryIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let crySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
        let cry = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [cryIntensity, crySharpness],
            relativeTime: 1.7,
            duration: 0.8
        )
        events.append(cry)
        
        // Wing beats
        let beatCount = 3
        for i in 0..<beatCount {
            let beatTime = 2.0 + Double(i) * 0.25
            let beatIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6)
            let beatSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
            let beat = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [beatIntensity, beatSharpness],
                relativeTime: beatTime
            )
            events.append(beat)
        }
        
        return events
    }
    
    static func phoenixRebirthCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Life force rebirth
        let rebirthCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.2),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.9)
            ],
            relativeTime: 0.8
        )
        
        // Flame flicker
        let flameCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.5),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.8)
            ],
            relativeTime: 1.7
        )
        
        return [rebirthCurve, flameCurve]
    }
    
    // MARK: - Invincibility Activation
    static func invincibilityActivationEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Shield generation start
        let genIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let genSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
        let generation = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [genIntensity, genSharpness],
            relativeTime: 0.0,
            duration: 0.4
        )
        events.append(generation)
        
        // Shield snap into place
        let snapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9)
        let snapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let snap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [snapIntensity, snapSharpness],
            relativeTime: 0.4
        )
        events.append(snap)
        
        // Protective aura
        let auraIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7)
        let auraSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
        let aura = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [auraIntensity, auraSharpness],
            relativeTime: 0.45,
            duration: 1.2
        )
        events.append(aura)
        
        // Shield harmonics
        let harmonicCount = 4
        for i in 0..<harmonicCount {
            let harmTime = 0.6 + Double(i) * 0.3
            let harmIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
            let harmSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
            let harmonic = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [harmIntensity, harmSharpness],
                relativeTime: harmTime
            )
            events.append(harmonic)
        }
        
        // Shield stabilization
        let stabilizeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4)
        let stabilizeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let stabilize = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [stabilizeIntensity, stabilizeSharpness],
            relativeTime: 1.7,
            duration: duration - 1.7
        )
        events.append(stabilize)
        
        return events
    }
    
    static func invincibilityActivationCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Shield strength oscillation
        let shieldCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.85),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.75),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.7)
            ],
            relativeTime: 0.45
        )
        
        return [shieldCurve]
    }
    
    // MARK: - Time Freeze
    static func timeFreezeEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Temporal distortion warning
        let warnIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4)
        let warnSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let warning = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [warnIntensity, warnSharpness],
            relativeTime: 0.0,
            duration: 0.5
        )
        events.append(warning)
        
        // Time dilation pulses
        let dilationCount = 3
        for i in 0..<dilationCount {
            let pulseTime = 0.2 + Double(i) * 0.2
            let pulseIntensity = 0.5 + Float(i) * 0.15
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: pulseIntensity)
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensityParam, sharpnessParam],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Reality crystallization
        let crystalIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let crystalSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let crystal = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [crystalIntensity, crystalSharpness],
            relativeTime: 0.9
        )
        events.append(crystal)
        
        // Frozen time suspension
        let suspendIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.2)
        let suspendSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
        let suspend = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [suspendIntensity, suspendSharpness],
            relativeTime: 1.0,
            duration: 1.0
        )
        events.append(suspend)
        
        // Time resumption crack
        let resumeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let resumeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let resume = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [resumeIntensity, resumeSharpness],
            relativeTime: 2.1
        )
        events.append(resume)
        
        // Normal flow restoration
        let flowIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let flowSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let flow = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [flowIntensity, flowSharpness],
            relativeTime: 2.2,
            duration: duration - 2.2
        )
        events.append(flow)
        
        return events
    }
    
    static func timeFreezeCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Time distortion effect
        let timeCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.2),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.1),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.2)
            ],
            relativeTime: 1.0
        )
        
        return [timeCurve]
    }
    
    // MARK: - Ultra Combo
    static func ultraComboEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Combo starter
        let starterIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let starterSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.9)
        let starter = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [starterIntensity, starterSharpness],
            relativeTime: 0.0
        )
        events.append(starter)
        
        // Rapid combo hits - escalating intensity
        let hitCount = 12
        for i in 0..<hitCount {
            let hitTime = 0.2 + Double(i) * 0.15
            let baseIntensity = 0.6 + Float(i) * 0.03
            let variation = Float.random(in: -0.1...0.1)
            let hitIntensity = min(1.0, baseIntensity + variation)
            
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: hitIntensity)
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
            let hit = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensityParam, sharpnessParam],
                relativeTime: hitTime
            )
            events.append(hit)
        }
        
        // Power buildup for finisher
        let buildupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7)
        let buildupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
        let buildup = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buildupIntensity, buildupSharpness],
            relativeTime: 2.0,
            duration: 0.5
        )
        events.append(buildup)
        
        // Devastating finisher
        let finisherIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let finisherSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let finisher = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [finisherIntensity, finisherSharpness],
            relativeTime: 2.5
        )
        events.append(finisher)
        
        // Impact resonance
        let resonanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6)
        let resonanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.4)
        let resonance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resonanceIntensity, resonanceSharpness],
            relativeTime: 2.55,
            duration: duration - 2.55
        )
        events.append(resonance)
        
        return events
    }
    
    static func ultraComboCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Combo intensity escalation
        let comboCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.6),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.8),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.9),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 1.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.8)
            ],
            relativeTime: 0.2
        )
        
        return [comboCurve]
    }
    
    // MARK: - Nuclear Charge
    static func nuclearChargeEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Reactor startup
        let startupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let startupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let startup = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [startupIntensity, startupSharpness],
            relativeTime: 0.0,
            duration: 0.4
        )
        events.append(startup)
        
        // Critical mass building - accelerating pulses
        let criticalPulses = 8
        for i in 0..<criticalPulses {
            let pulseTime = 0.4 + Double(i) * (0.3 - Double(i) * 0.03) // Accelerating
            let pulseIntensity = 0.4 + Float(i) * 0.08
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: pulseIntensity)
            let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensityParam, sharpnessParam],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Core instability
        let instabilityIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let instabilitySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
        let instability = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [instabilityIntensity, instabilitySharpness],
            relativeTime: 1.5,
            duration: 0.5
        )
        events.append(instability)
        
        // Nuclear detonation
        let detonationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let detonationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let detonation = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [detonationIntensity, detonationSharpness],
            relativeTime: 2.0
        )
        events.append(detonation)
        
        // Shockwave
        let shockwaveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9)
        let shockwaveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let shockwave = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [shockwaveIntensity, shockwaveSharpness],
            relativeTime: 2.0,
            duration: 0.4
        )
        events.append(shockwave)
        
        // Radioactive aftermath
        let aftermathIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4)
        let aftermathSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let aftermath = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [aftermathIntensity, aftermathSharpness],
            relativeTime: 2.4,
            duration: duration - 2.4
        )
        events.append(aftermath)
        
        return events
    }
    
    static func nuclearChargeCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Critical mass buildup
        let criticalCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.3),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.5),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.7),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.85),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.95),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 1.0)
            ],
            relativeTime: 0.4
        )
        
        // Radiation pulse
        let radiationCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.3),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.5),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.2),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: 0.4),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.1)
            ],
            relativeTime: 2.4
        )
        
        return [criticalCurve, radiationCurve]
    }
}