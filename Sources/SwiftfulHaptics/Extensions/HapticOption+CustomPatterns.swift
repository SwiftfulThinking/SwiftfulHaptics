//
//  HapticOption+CustomPatterns.swift
//  
//
//  Created by Nick Sarno on 9/17/25.
//

import Foundation
import CoreHaptics

// MARK: - Custom Pattern Extensions
// This file extends HapticOption with all custom haptic patterns

public extension HapticOption {
    
    // MARK: - Gaming Patterns
    
    /// Lightning Strike - Quick: Sharp electric zap with instant decay
    /// Duration: 0.3s, Usage: Quick spell cast, electric attack
    static func lightningStrikeQuick(duration: Double = 0.3) -> HapticOption {
        return .custom(events: GamingHapticPatterns.lightningStrikeQuick(duration: duration), parameters: [])
    }
    
    /// Lightning Strike - Chain: Multiple electric pulses jumping between targets
    /// Duration: 1.2s, Usage: Chain lightning spell, combo attacks
    static func lightningStrikeChain(duration: Double = 1.2) -> HapticOption {
        return .custom(events: GamingHapticPatterns.lightningStrikeChain(duration: duration), parameters: [])
    }
    
    /// Lightning Strike - Heavy: Massive electric blast with long rumble
    /// Duration: 1.5s, Usage: Ultimate ability, boss attacks
    static func lightningStrikeHeavy(duration: Double = 1.5) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.lightningStrikeHeavyEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.lightningStrikeHeavyCurves(duration: duration))
    }
    
    /// Coin Collection - Single: Light, satisfying tap with high sharpness
    /// Duration: 0.15s, Usage: Single coin pickup
    static func coinCollectSingle(duration: Double = 0.15) -> HapticOption {
        return .custom(events: GamingHapticPatterns.coinCollectSingle(duration: duration), parameters: [])
    }
    
    /// Coin Collection - Multi: Rapid succession of coin collection taps
    /// Duration: 0.8s, Usage: Multiple coins, treasure chest
    static func coinCollectMulti(duration: Double = 0.8) -> HapticOption {
        return .custom(events: GamingHapticPatterns.coinCollectMulti(duration: duration), parameters: [])
    }
    
    /// Coin Collection - Jackpot: Building cascade of coins with celebration
    /// Duration: 2.0s, Usage: Jackpot win, bonus collection
    static func coinCollectJackpot(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.coinCollectJackpotEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.coinCollectJackpotCurves(duration: duration))
    }
    
    /// Sword Slash - Light: Quick cutting motion with sharp edge
    /// Duration: 0.25s, Usage: Light attack, quick slash
    static func swordSlashLight(duration: Double = 0.25) -> HapticOption {
        return .custom(events: GamingHapticPatterns.swordSlashLight(duration: duration), parameters: [])
    }
    
    /// Sword Slash - Heavy: Powerful swing with weight and impact
    /// Duration: 0.6s, Usage: Heavy attack, charged strike
    static func swordSlashHeavy(duration: Double = 0.6) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.swordSlashHeavyEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.swordSlashHeavyCurves(duration: duration))
    }
    
    /// Arrow Release: Tension build and release with twang
    /// Duration: 0.5s, Usage: Archery, projectile launch
    static func arrowRelease(duration: Double = 0.5) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.arrowReleaseEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.arrowReleaseCurves(duration: duration))
    }
    
    /// Explosion - Small: Quick burst with decay
    /// Duration: 0.4s, Usage: Grenade, small explosion
    static func explosionSmall(duration: Double = 0.4) -> HapticOption {
        return .custom(events: GamingHapticPatterns.explosionSmall(duration: duration), parameters: [])
    }
    
    /// Explosion - Massive: Building rumble with massive blast
    /// Duration: 1.8s, Usage: Nuclear blast, destruction
    static func explosionMassive(duration: Double = 1.8) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.explosionMassiveEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.explosionMassiveCurves(duration: duration))
    }
    
    /// Shield Block: Impact absorbed with reverb
    /// Duration: 0.35s, Usage: Defensive moves, parry
    static func shieldBlock(duration: Double = 0.35) -> HapticOption {
        return .custom(events: GamingHapticPatterns.shieldBlock(duration: duration), parameters: [])
    }
    
    /// Portal Enter: Warping sensation with phase shift
    /// Duration: 0.8s, Usage: Teleportation, dimensional travel
    static func portalEnter(duration: Double = 0.8) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.portalEnterEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.portalEnterCurves(duration: duration))
    }
    
    /// Magic Charge: Building magical energy
    /// Duration: 1.2s, Usage: Spell charging, power gathering
    static func magicCharge(duration: Double = 1.2) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.magicChargeEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.magicChargeCurves(duration: duration))
    }
    
    /// Critical Hit: Emphatic double pulse
    /// Duration: 0.3s, Usage: Critical strikes, bonus damage
    static func criticalHit(duration: Double = 0.3) -> HapticOption {
        return .custom(events: GamingHapticPatterns.criticalHit(duration: duration), parameters: [])
    }
    
    /// Combo Hit - 3x: Three escalating hits
    /// Duration: 0.6s, Usage: Fighting games, combo attacks
    static func comboHit3x(duration: Double = 0.6) -> HapticOption {
        return .custom(events: GamingHapticPatterns.comboHit3x(duration: duration), parameters: [])
    }
    
    /// Combo Hit - 5x: Five rapid hits with finish
    /// Duration: 1.0s, Usage: Extended combos, special moves
    static func comboHit5x(duration: Double = 1.0) -> HapticOption {
        return .custom(events: GamingHapticPatterns.comboHit5x(duration: duration), parameters: [])
    }
    
    /// Footstep - Grass: Soft, muffled step
    /// Duration: 0.15s, Usage: Walking on soft surfaces
    static func footstepGrass(duration: Double = 0.15) -> HapticOption {
        return .custom(events: GamingHapticPatterns.footstepGrass(duration: duration), parameters: [])
    }
    
    /// Footstep - Metal: Hard, clanking step
    /// Duration: 0.15s, Usage: Walking on hard surfaces
    static func footstepMetal(duration: Double = 0.15) -> HapticOption {
        return .custom(events: GamingHapticPatterns.footstepMetal(duration: duration), parameters: [])
    }
    
    /// Engine Start: Ignition with engine rumble
    /// Duration: 1.5s, Usage: Vehicle start, machinery
    static func engineStart(duration: Double = 1.5) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.engineStartEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.engineStartCurves(duration: duration))
    }
    
    /// Turbo Boost: Acceleration surge
    /// Duration: 0.8s, Usage: Speed boost, nitro
    static func turboBoost(duration: Double = 0.8) -> HapticOption {
        return .customCurve(events: GamingHapticPatterns.turboBoostEvents(duration: duration),
                           parameterCurves: GamingHapticPatterns.turboBoostCurves(duration: duration))
    }
    
    /// Machine Gun: Rapid fire pulses
    /// Duration: 1.0s, Usage: Automatic weapons, rapid attacks
    static func machineGun(duration: Double = 1.0) -> HapticOption {
        return .custom(events: GamingHapticPatterns.machineGun(duration: duration), parameters: [])
    }
    
    // MARK: - Educational Achievement Patterns
    
    /// Achievement Unlocked: Celebratory burst with victory fanfare
    /// Duration: 1.2s, Usage: Achievements, milestones, goals completed
    static func achievementUnlocked(duration: Double = 1.2) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.achievementUnlocked(duration: duration), parameters: [])
    }
    
    /// Level Up: Rising energy with peak celebration
    /// Duration: 1.0s, Usage: Level progression, rank increase
    static func levelUp(duration: Double = 1.0) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.levelUp(duration: duration), parameters: [])
    }
    
    /// Star Rating: Sequential star appearances with shimmer
    /// Duration: 1.5s, Usage: Performance rating, score display
    static func starRating(count: Int = 3, duration: Double = 1.5) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.starRating(count: count, duration: duration), parameters: [])
    }
    
    /// Badge Earned: Medal placement with shine effect
    /// Duration: 0.6s, Usage: Badge unlock, certification earned
    static func badgeEarned(duration: Double = 0.6) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.badgeEarned(duration: duration), parameters: [])
    }
    
    /// Streak Milestone: Fire ignition with sustained burn
    /// Duration: 1.2s, Usage: Streak achievements, consistency rewards
    static func streakMilestone(duration: Double = 1.2) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.streakMilestone(duration: duration), parameters: [])
    }
    
    /// Perfect Score: Triple crown with grand finale
    /// Duration: 1.5s, Usage: Perfect performance, maximum score
    static func perfectScore(duration: Double = 1.5) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.perfectScore(duration: duration), parameters: [])
    }
    
    /// Rank Promotion: Ascending tones with authority rumble
    /// Duration: 1.3s, Usage: Rank advancement, tier upgrade
    static func rankPromotion(duration: Double = 1.3) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.rankPromotion(duration: duration), parameters: [])
    }
    
    /// Daily Goal Complete: Checkmark stamp with success vibration
    /// Duration: 0.5s, Usage: Daily goals, task completion
    static func dailyGoalComplete(duration: Double = 0.5) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.dailyGoalComplete(duration: duration), parameters: [])
    }
    
    /// Trophy Unlock: Trophy reveal with gleaming pulses
    /// Duration: 1.4s, Usage: Major achievements, special rewards
    static func trophyUnlock(duration: Double = 1.4) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.trophyUnlock(duration: duration), parameters: [])
    }
    
    /// Quest Complete: Quest bell with victory flourish
    /// Duration: 1.3s, Usage: Mission complete, objective achieved
    static func questComplete(duration: Double = 1.3) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.questComplete(duration: duration), parameters: [])
    }
    
    /// High Score: Record breaking with celebration cascade
    /// Duration: 1.5s, Usage: New high score, personal best
    static func highScore(duration: Double = 1.5) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.highScore(duration: duration), parameters: [])
    }
    
    /// Mastery Achieved: Power surge with royal fanfare
    /// Duration: 1.8s, Usage: Skill mastery, expertise gained
    static func masteryAchieved(duration: Double = 1.8) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.masteryAchieved(duration: duration), parameters: [])
    }
    
    // MARK: - Educational Learning Feedback Patterns
    
    /// Correct Answer: Positive chime with success flutter
    /// Duration: 0.4s, Usage: Correct responses, right answers
    static func correctAnswer(duration: Double = 0.4) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.correctAnswer(duration: duration), parameters: [])
    }
    
    /// Incorrect Gentle: Soft nudge with gentle reminder
    /// Duration: 0.3s, Usage: Wrong answers (encouraging)
    static func incorrectGentle(duration: Double = 0.3) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.incorrectGentle(duration: duration), parameters: [])
    }
    
    /// Hint Available: Light bulb moment with pulsing glow
    /// Duration: 0.8s, Usage: Hint system, help available
    static func hintAvailable(duration: Double = 0.8) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.hintAvailable(duration: duration), parameters: [])
    }
    
    /// Progress Checkpoint: Milestone thud with progress hum
    /// Duration: 0.6s, Usage: Progress saves, checkpoints reached
    static func progressCheckpoint(duration: Double = 0.6) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.progressCheckpoint(duration: duration), parameters: [])
    }
    
    /// Encouragement Tap: Friendly pat with warm presence
    /// Duration: 0.5s, Usage: Motivation, keep going feedback
    static func encouragementTap(duration: Double = 0.5) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.encouragementTap(duration: duration), parameters: [])
    }
    
    /// Skill Unlocked: Unlock click with skill activation
    /// Duration: 0.5s, Usage: New abilities, features unlocked
    static func skillUnlocked(duration: Double = 0.5) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.skillUnlocked(duration: duration), parameters: [])
    }
    
    /// Lesson Complete: Book close with completion chime
    /// Duration: 0.9s, Usage: Module finished, lesson done
    static func lessonComplete(duration: Double = 0.9) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.lessonComplete(duration: duration), parameters: [])
    }
    
    /// Practice Reminder: Gentle taps with reminder pulse
    /// Duration: 0.8s, Usage: Study reminders, practice prompts
    static func practiceReminder(duration: Double = 0.8) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.practiceReminder(duration: duration), parameters: [])
    }
    
    /// Knowledge Gained: Mind expansion with insight spark
    /// Duration: 0.9s, Usage: Learning moments, understanding
    static func knowledgeGained(duration: Double = 0.9) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.knowledgeGained(duration: duration), parameters: [])
    }
    
    /// Feedback Positive: Thumbs up with reinforcement pulses
    /// Duration: 0.6s, Usage: Positive feedback, good job
    static func feedbackPositive(duration: Double = 0.6) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.feedbackPositive(duration: duration), parameters: [])
    }
    
    // MARK: - Educational Gamification Elements
    
    /// XP Gain Small: Light sparkle with absorption
    /// Duration: 0.3s, Usage: Small XP gains, minor rewards
    static func xpGainSmall(duration: Double = 0.3) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.xpGainSmall(duration: duration), parameters: [])
    }
    
    /// XP Gain Large: Multiple sparkles with power surge
    /// Duration: 0.6s, Usage: Large XP gains, level ups
    static func xpGainLarge(duration: Double = 0.6) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.xpGainLarge(duration: duration), parameters: [])
    }
    
    /// Bonus Points: Bonus burst with cascading points
    /// Duration: 0.5s, Usage: Bonus rewards, extra points
    static func bonusPoints(duration: Double = 0.5) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.bonusPoints(duration: duration), parameters: [])
    }
    
    /// Power-Up Collected: Power grab with energy flow
    /// Duration: 0.7s, Usage: Power-up collection, boosts
    static func powerUpCollected(duration: Double = 0.7) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.powerUpCollected(duration: duration), parameters: [])
    }
    
    /// Life Gained: Heart pulse with life flow
    /// Duration: 0.4s, Usage: Health restore, extra lives
    static func lifeGained(duration: Double = 0.4) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.lifeGained(duration: duration), parameters: [])
    }
    
    /// Challenge Accepted: Determination pulse with ready stance
    /// Duration: 0.7s, Usage: Challenge start, competition begin
    static func challengeAccepted(duration: Double = 0.7) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.challengeAccepted(duration: duration), parameters: [])
    }
    
    /// Timer Tick: Simple clock tick
    /// Duration: 0.1s, Usage: Countdown timers, time pressure
    static func timerTick(duration: Double = 0.1) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.timerTick(duration: duration), parameters: [])
    }
    
    /// Reward Unlock: Lock release with treasure reveal
    /// Duration: 0.8s, Usage: Reward chests, prize unlocks
    static func rewardUnlock(duration: Double = 0.8) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.rewardUnlock(duration: duration), parameters: [])
    }
    
    /// Progress Bar Fill: Filling sensation with completion tick
    /// Duration: 0.7s, Usage: Progress indicators, loading
    static func progressBarFill(duration: Double = 0.7) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.progressBarFill(duration: duration), parameters: [])
    }
    
    /// Combo Multiplier: Escalating combo hits
    /// Duration: 1.0s, Usage: Combo systems, multiplier feedback
    static func comboMultiplier(count: Int = 3, duration: Double = 1.0) -> HapticOption {
        return .custom(events: EducationalHapticPatterns.comboMultiplier(count: count, duration: duration), parameters: [])
    }
    
    // MARK: - Intense Gamification Patterns
    
    /// Fire Burst: Ignition spark with flame whoosh
    /// Duration: 1.2s, Usage: Fire spells, flame attacks
    static func fireBurst(duration: Double = 1.2) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.fireBurstEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.fireBurstCurves(duration: duration))
    }
    
    /// Ice Shard: Crystallization with shattering ice
    /// Duration: 1.0s, Usage: Ice attacks, freeze spells
    static func iceShard(duration: Double = 1.0) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.iceShardEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.iceShardCurves(duration: duration))
    }
    
    /// Earthquake Rumble: Ground tremor with massive impacts
    /// Duration: 2.0s, Usage: Earth magic, ground attacks
    static func earthquakeRumble(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.earthquakeRumbleEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.earthquakeRumbleCurves(duration: duration))
    }
    
    /// Wind Tornado: Vortex formation with debris
    /// Duration: 2.5s, Usage: Wind magic, tornado attacks
    static func windTornado(duration: Double = 2.5) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.windTornadoEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.windTornadoCurves(duration: duration))
    }
    
    /// Plasma Charge: Energy accumulation with discharge
    /// Duration: 1.5s, Usage: Sci-fi weapons, energy attacks
    static func plasmaCharge(duration: Double = 1.5) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.plasmaChargeEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.plasmaChargeCurves(duration: duration))
    }
    
    /// Gravity Well: Space-time distortion pull
    /// Duration: 2.5s, Usage: Black holes, gravity weapons
    static func gravityWell(duration: Double = 2.5) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.gravityWellEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.gravityWellCurves(duration: duration))
    }
    
    /// Photon Blast: Light burst with photon stream
    /// Duration: 1.3s, Usage: Laser weapons, light attacks
    static func photonBlast(duration: Double = 1.3) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.photonBlastEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.photonBlastCurves(duration: duration))
    }
    
    /// Quantum Shift: Reality phase transition
    /// Duration: 1.8s, Usage: Quantum abilities, phase shifts
    static func quantumShift(duration: Double = 1.8) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.quantumShiftEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.quantumShiftCurves(duration: duration))
    }
    
    /// Ultimate Power: Massive energy release
    /// Duration: 3.0s, Usage: Ultimate abilities, final attacks
    static func ultimatePower(duration: Double = 3.0) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.ultimatePowerEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.ultimatePowerCurves(duration: duration))
    }
    
    /// Dragon Roar: Breath intake with massive roar
    /// Duration: 2.2s, Usage: Dragon attacks, beast roars
    static func dragonRoar(duration: Double = 2.2) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.dragonRoarEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.dragonRoarCurves(duration: duration))
    }
    
    /// Titan Smash: Ground-shaking impact
    /// Duration: 2.0s, Usage: Giant attacks, massive impacts
    static func titanSmash(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.titanSmashEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.titanSmashCurves(duration: duration))
    }
    
    /// Dimensional Rift: Reality tear with void exposure
    /// Duration: 2.6s, Usage: Portal creation, dimension travel
    static func dimensionalRift(duration: Double = 2.6) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.dimensionalRiftEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.dimensionalRiftCurves(duration: duration))
    }
    
    /// Mega Boost: Power surge activation
    /// Duration: 1.2s, Usage: Speed boosts, power-ups
    static func megaBoost(duration: Double = 1.2) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.megaBoostEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.megaBoostCurves(duration: duration))
    }
    
    /// Star Power: Invincibility with sparkles
    /// Duration: 2.0s, Usage: Mario star, invincibility
    static func starPower(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.starPowerEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.starPowerCurves(duration: duration))
    }
    
    /// Berserker Rage: Heartbeat fury mode
    /// Duration: 2.5s, Usage: Rage modes, berserk states
    static func berserkerRage(duration: Double = 2.5) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.berserkerRageEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.berserkerRageCurves(duration: duration))
    }
    
    /// Divine Shield: Holy protection barrier
    /// Duration: 1.5s, Usage: Shield abilities, protection
    static func divineShield(duration: Double = 1.5) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.divineShieldEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.divineShieldCurves(duration: duration))
    }
    
    /// Volcanic Eruption: Lava burst with pyroclastic flow
    /// Duration: 3.5s, Usage: Volcanic attacks, lava abilities
    static func volcanicEruption(duration: Double = 3.5) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.volcanicEruptionEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.volcanicEruptionCurves(duration: duration))
    }
    
    /// Rocket Launch: Countdown to liftoff
    /// Duration: 2.5s, Usage: Rocket abilities, launches
    static func rocketLaunch(duration: Double = 2.5) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.rocketLaunchEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.rocketLaunchCurves(duration: duration))
    }
    
    /// Warp Drive: Hyperspace jump
    /// Duration: 2.0s, Usage: Space travel, warp abilities
    static func warpDrive(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.warpDriveEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.warpDriveCurves(duration: duration))
    }
    
    /// Laser Cannon: Charge and fire
    /// Duration: 1.8s, Usage: Laser weapons, beam attacks
    static func laserCannon(duration: Double = 1.8) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.laserCannonEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.laserCannonCurves(duration: duration))
    }
    
    /// Alien Teleport: Dimensional phase shift
    /// Duration: 2.0s, Usage: Teleportation, alien tech
    static func alienTeleport(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.alienTeleportEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.alienTeleportCurves(duration: duration))
    }
    
    /// Space Explosion: Decompression blast
    /// Duration: 2.5s, Usage: Space destruction, ship explosions
    static func spaceExplosion(duration: Double = 2.5) -> HapticOption {
        return .customCurve(events: IntenseGamificationHapticPatterns.spaceExplosionEvents(duration: duration),
                           parameterCurves: IntenseGamificationHapticPatterns.spaceExplosionCurves(duration: duration))
    }
    
    // MARK: - UI & Interaction Patterns
    
    /// Double Tap Like: Quick double pulse for like confirmation
    /// Duration: 0.2s, Usage: Like/heart animations
    static func doubleTapLike(duration: Double = 0.2) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.doubleTapLike(duration: duration), parameters: [])
    }
    
    /// Message Sent: Swoosh effect with quick fade
    /// Duration: 0.3s, Usage: Message sent, post published
    static func messageSent(duration: Double = 0.3) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.messageSent(duration: duration), parameters: [])
    }
    
    /// Notification Pop: Attention-grabbing pop with sharp attack
    /// Duration: 0.25s, Usage: New notification, alert
    static func notificationPop(duration: Double = 0.25) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.notificationPop(duration: duration), parameters: [])
    }
    
    /// Typing Indicator: Three dots animation feedback
    /// Duration: 1.0s, Usage: Chat typing indicators
    static func typingIndicator(duration: Double = 1.0) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.typingIndicator(duration: duration), parameters: [])
    }
    
    /// Comment Posted: Quick confirmation with success
    /// Duration: 0.35s, Usage: Comment submissions, replies
    static func commentPosted(duration: Double = 0.35) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.commentPosted(duration: duration), parameters: [])
    }
    
    /// Pull to Refresh: Elastic tension with snap release
    /// Duration: 0.4s, Usage: Content refresh in scrollable views
    static func pullToRefresh(duration: Double = 0.4) -> HapticOption {
        return .customCurve(events: UIInteractionHapticPatterns.pullToRefreshEvents(duration: duration),
                           parameterCurves: UIInteractionHapticPatterns.pullToRefreshCurves(duration: duration))
    }
    
    /// Swipe Action: Progressive feedback for list item actions
    /// Duration: 0.35s, Usage: Delete, archive, or other swipe actions
    static func swipeAction(actionType: String = "delete", duration: Double = 0.35) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.swipeActionEvents(duration: duration, actionType: actionType), parameters: [])
    }
    
    /// Toggle Switch: Satisfying state change with momentum
    /// Duration: 0.2s, Usage: Settings switches, option toggles
    static func toggleSwitch(duration: Double = 0.2) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.toggleSwitchEvents(duration: duration), parameters: [])
    }
    
    /// Picker Wheel Detent: Mechanical click for value selection
    /// Duration: 0.08s, Usage: Date pickers, value selectors
    static func pickerDetent(duration: Double = 0.08) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.pickerDetentEvents(duration: duration), parameters: [])
    }
    
    /// Long Press Activation: Building pressure with release
    /// Duration: 0.6s, Usage: Context menus, force touch actions
    static func longPressActivation(duration: Double = 0.6) -> HapticOption {
        return .customCurve(events: UIInteractionHapticPatterns.longPressActivationEvents(duration: duration),
                           parameterCurves: UIInteractionHapticPatterns.longPressActivationCurves(duration: duration))
    }
    
    /// Tab Selection: Clean transition between sections
    /// Duration: 0.15s, Usage: Tab bars, segmented controls
    static func tabSelection(duration: Double = 0.15) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.tabSelectionEvents(duration: duration), parameters: [])
    }
    
    /// Navigation Push: Forward movement confirmation
    /// Duration: 0.2s, Usage: Screen transitions, navigation stacks
    static func navigationPush(duration: Double = 0.2) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.navigationPushEvents(duration: duration), parameters: [])
    }
    
    /// Navigation Pop: Backward movement confirmation
    /// Duration: 0.18s, Usage: Back navigation, dismissal
    static func navigationPop(duration: Double = 0.18) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.navigationPopEvents(duration: duration), parameters: [])
    }
    
    /// Modal Present: Sheet appearance feedback
    /// Duration: 0.25s, Usage: Modal presentations, overlays
    static func modalPresent(duration: Double = 0.25) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.modalPresentEvents(duration: duration), parameters: [])
    }
    
    /// Modal Dismiss: Sheet dismissal feedback
    /// Duration: 0.22s, Usage: Modal closures, overlay dismissals
    static func modalDismiss(duration: Double = 0.22) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.modalDismissEvents(duration: duration), parameters: [])
    }
    
    /// Keyboard Tap: Realistic key press simulation
    /// Duration: 0.05s, Usage: Custom keyboards, typing feedback
    static func keyboardTap(duration: Double = 0.05) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.keyboardTapEvents(duration: duration), parameters: [])
    }
    
    /// Slider Value Change: Discrete step feedback
    /// Duration: 0.06s, Usage: Volume sliders, brightness controls
    static func sliderStep(duration: Double = 0.06) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.sliderStepEvents(duration: duration), parameters: [])
    }
    
    /// Selection Tick: Light feedback for multi-select
    /// Duration: 0.1s, Usage: Checkbox selection, multi-item picking
    static func selectionTick(duration: Double = 0.1) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.selectionTickEvents(duration: duration), parameters: [])
    }
    
    /// Segment Change: Section switch feedback
    /// Duration: 0.12s, Usage: Segmented controls, view switchers
    static func segmentChange(duration: Double = 0.12) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.segmentChangeEvents(duration: duration), parameters: [])
    }
    
    /// Zoom Boundary: Elastic limit feedback
    /// Duration: 0.3s, Usage: Pinch zoom limits, scale boundaries
    static func zoomBoundary(duration: Double = 0.3) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.zoomBoundaryEvents(duration: duration), parameters: [])
    }
    
    /// Drag and Drop: Pickup, hover, and release feedback
    /// Duration: 0.8s, Usage: Reordering items, file management
    static func dragAndDrop(phase: String = "complete", duration: Double = 0.8) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.dragAndDropEvents(duration: duration, phase: phase), parameters: [])
    }
    
    /// Form Submit: Submission confirmation
    /// Duration: 0.4s, Usage: Form submissions, save actions
    static func formSubmit(duration: Double = 0.4) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.formSubmitEvents(duration: duration), parameters: [])
    }
    
    /// Input Error: Field validation failure
    /// Duration: 0.3s, Usage: Form validation, input errors
    static func inputError(duration: Double = 0.3) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.inputErrorEvents(duration: duration), parameters: [])
    }
    
    /// Loading Complete: Async operation finished
    /// Duration: 0.35s, Usage: Data loading, async operations
    static func loadingComplete(duration: Double = 0.35) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.loadingCompleteEvents(duration: duration), parameters: [])
    }
    
    /// App Icon Tap: Springy app launch feedback
    /// Duration: 0.15s, Usage: App icon interactions, shortcuts
    static func appIconTap(duration: Double = 0.15) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.appIconTapEvents(duration: duration), parameters: [])
    }
    
    /// Custom Pop: Sharp, instant feedback with maximum intensity
    /// Duration: 0.2s, Usage: Button presses, instant confirmations
    static func customPop(duration: Double = 0.2) -> HapticOption {
        return .customCurve(events: UIInteractionHapticPatterns.customPopEvents(duration: duration),
                           parameterCurves: UIInteractionHapticPatterns.customPopCurves(duration: duration))
    }
    
    /// Scroll Bounce: Elastic scroll boundary feedback
    /// Duration: 0.25s, Usage: List/scroll boundaries
    static func scrollBounce(duration: Double = 0.25) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.scrollBounce(duration: duration), parameters: [])
    }
    
    /// Page Flip: Book page turn effect
    /// Duration: 0.3s, Usage: eBook readers, page navigation
    static func pageFlip(duration: Double = 0.3) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.pageFlip(duration: duration), parameters: [])
    }
    
    /// Photo Capture: Camera shutter feedback
    /// Duration: 0.2s, Usage: Camera apps, screenshots
    static func photoCapture(duration: Double = 0.2) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.photoCapture(duration: duration), parameters: [])
    }
    
    /// Share Action: Share sheet interaction
    /// Duration: 0.2s, Usage: Share buttons, social sharing
    static func shareAction(duration: Double = 0.2) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.shareAction(duration: duration), parameters: [])
    }
    
    /// Download Complete: File download success
    /// Duration: 0.3s, Usage: Downloads, file saves
    static func downloadComplete(duration: Double = 0.3) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.downloadComplete(duration: duration), parameters: [])
    }
    
    /// Refresh Data: Pull to refresh success
    /// Duration: 0.6s, Usage: Data refresh, sync operations
    static func refreshData(duration: Double = 0.6) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.refreshData(duration: duration), parameters: [])
    }
    
    /// Gesture Recognized: Custom gesture confirmation
    /// Duration: 0.25s, Usage: Gesture recognizers, custom input
    static func gestureRecognized(duration: Double = 0.25) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.gestureRecognized(duration: duration), parameters: [])
    }
    
    /// Page Turn: Reading page turn effect
    /// Duration: 0.25s, Usage: Reading apps, document viewers
    static func pageTurn(duration: Double = 0.25) -> HapticOption {
        return .custom(events: UIInteractionHapticPatterns.pageTurn(duration: duration), parameters: [])
    }
    
    // MARK: - Special Effect Patterns
    
    /// Magic Sparkle: Random sparkle pattern
    /// Duration: 0.8s, Usage: Magic effects, fairy dust
    static func magicSparkle(duration: Double = 0.8) -> HapticOption {
        return .custom(events: SpecialEffectHapticPatterns.magicSparkle(duration: duration), parameters: [])
    }
    
    /// Water Drop: Drop impact with ripples
    /// Duration: 0.5s, Usage: Water effects, liquid interactions
    static func waterDrop(duration: Double = 0.5) -> HapticOption {
        return .customCurve(events: SpecialEffectHapticPatterns.waterDropEvents(duration: duration),
                           parameterCurves: SpecialEffectHapticPatterns.waterDropCurves(duration: duration))
    }
    
    /// Earthquake: Rumbling with random jolts
    /// Duration: 2.0s, Usage: Environmental effects, destruction
    static func earthquake(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: SpecialEffectHapticPatterns.earthquakeEvents(duration: duration),
                           parameterCurves: SpecialEffectHapticPatterns.earthquakeCurves(duration: duration))
    }
    
    /// Laser Beam: Sharp start with sustained beam
    /// Duration: 0.6s, Usage: Sci-fi weapons, cutting effects
    static func laserBeam(duration: Double = 0.6) -> HapticOption {
        return .customCurve(events: SpecialEffectHapticPatterns.laserBeamEvents(duration: duration),
                           parameterCurves: SpecialEffectHapticPatterns.laserBeamCurves(duration: duration))
    }
    
    /// Typewriter: Mechanical key press
    /// Duration: 0.05s, Usage: Typing effects, mechanical feedback
    static func typewriter(duration: Double = 0.05) -> HapticOption {
        return .custom(events: SpecialEffectHapticPatterns.typewriter(duration: duration), parameters: [])
    }
    
    /// Rubber Band: Stretch and snap
    /// Duration: 0.4s, Usage: Elastic effects, spring actions
    static func rubberBand(duration: Double = 0.4) -> HapticOption {
        return .customCurve(events: SpecialEffectHapticPatterns.rubberBandEvents(duration: duration),
                           parameterCurves: SpecialEffectHapticPatterns.rubberBandCurves(duration: duration))
    }
    
    /// Electric Spark: Sharp discharge with crackles
    /// Duration: 0.3s, Usage: Electric effects, short circuits
    static func electricSpark(duration: Double = 0.3) -> HapticOption {
        return .custom(events: SpecialEffectHapticPatterns.electricSpark(duration: duration), parameters: [])
    }
    
    // MARK: - Wellness Patterns
    
    /// Breathing Guide: Inhale, hold, exhale cycle
    /// Duration: 4.0s, Usage: Meditation, breathing exercises
    static func breathingGuide(duration: Double = 4.0) -> HapticOption {
        return .customCurve(events: WellnessHapticPatterns.breathingGuideEvents(duration: duration),
                           parameterCurves: WellnessHapticPatterns.breathingGuideCurves(duration: duration))
    }
    
    /// Calm Pulse: Gentle heartbeat rhythm
    /// Duration: 1.2s, Usage: Relaxation, meditation
    static func calmPulse(duration: Double = 1.2) -> HapticOption {
        return .customCurve(events: WellnessHapticPatterns.calmPulseEvents(duration: duration),
                           parameterCurves: WellnessHapticPatterns.calmPulseCurves(duration: duration))
    }
    
    /// Meditation Bell: Bell strike with resonance
    /// Duration: 2.0s, Usage: Meditation timer, mindfulness
    static func meditationBell(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: WellnessHapticPatterns.meditationBell(duration: duration),
                           parameterCurves: WellnessHapticPatterns.meditationBellCurves(duration: duration))
    }
    
    /// Relaxation Wave: Smooth wave pattern
    /// Duration: 2.5s, Usage: Stress relief, calming
    static func relaxationWave(duration: Double = 2.5) -> HapticOption {
        return .customCurve(events: WellnessHapticPatterns.relaxationWave(duration: duration),
                           parameterCurves: WellnessHapticPatterns.relaxationWaveCurves(duration: duration))
    }
    
    /// Zen Notification: Gentle awareness tap
    /// Duration: 0.4s, Usage: Mindful alerts, gentle reminders
    static func zenNotification(duration: Double = 0.4) -> HapticOption {
        return .custom(events: WellnessHapticPatterns.zenNotification(duration: duration), parameters: [])
    }
    
    // MARK: - Productivity Patterns
    
    /// Timer Complete: Strong notification with fade
    /// Duration: 0.8s, Usage: Pomodoro timer, alarms
    static func timerComplete(duration: Double = 0.8) -> HapticOption {
        return .customCurve(events: ProductivityHapticPatterns.timerCompleteEvents(duration: duration),
                           parameterCurves: ProductivityHapticPatterns.timerCompleteCurves(duration: duration))
    }
    
    /// Task Check: Satisfying completion feedback
    /// Duration: 0.2s, Usage: Todo lists, task completion
    static func taskCheck(duration: Double = 0.2) -> HapticOption {
        return .custom(events: ProductivityHapticPatterns.taskCheck(duration: duration), parameters: [])
    }
    
    /// Focus Start: Deep focus activation
    /// Duration: 0.6s, Usage: Focus modes, concentration
    static func focusStart(duration: Double = 0.6) -> HapticOption {
        return .custom(events: ProductivityHapticPatterns.focusStart(duration: duration), parameters: [])
    }
    
    /// Break Reminder: Gentle work break prompt
    /// Duration: 0.8s, Usage: Break reminders, timeouts
    static func breakReminder(duration: Double = 0.8) -> HapticOption {
        return .custom(events: ProductivityHapticPatterns.breakReminder(duration: duration), parameters: [])
    }
    
    // MARK: - Finance Patterns
    
    /// Payment Success: Confident confirmation
    /// Duration: 0.1s, Usage: Transactions, purchases
    static func paymentSuccess(duration: Double = 0.1) -> HapticOption {
        return .custom(events: FinanceHapticPatterns.paymentSuccess(duration: duration), parameters: [])
    }
    
    /// Payment Processing: Gentle waiting pulse
    /// Duration: 2.0s, Usage: Transaction processing
    static func paymentProcessing(duration: Double = 2.0) -> HapticOption {
        return .customCurve(events: FinanceHapticPatterns.paymentProcessingEvents(duration: duration),
                           parameterCurves: FinanceHapticPatterns.paymentProcessingCurves(duration: duration))
    }
    
    /// Transaction Alert: Double tap notification
    /// Duration: 0.3s, Usage: Banking alerts, notifications
    static func transactionAlert(duration: Double = 0.3) -> HapticOption {
        return .custom(events: FinanceHapticPatterns.transactionAlert(duration: duration), parameters: [])
    }
    
    /// Receipt Saved: Document save confirmation
    /// Duration: 0.35s, Usage: Receipt storage, document saves
    static func receiptSaved(duration: Double = 0.35) -> HapticOption {
        return .custom(events: FinanceHapticPatterns.receiptSaved(duration: duration), parameters: [])
    }
    
    // MARK: - Emotional Patterns
    
    /// Excitement Build: Accelerating pulses
    /// Duration: 1.5s, Usage: Anticipation, building energy
    static func excitementBuild(duration: Double = 1.5) -> HapticOption {
        return .customCurve(events: EmotionalHapticPatterns.excitementBuildEvents(duration: duration),
                           parameterCurves: EmotionalHapticPatterns.excitementBuildCurves(duration: duration))
    }
    
    /// Disappointment: Descending energy drain
    /// Duration: 1.0s, Usage: Failure states, letdowns
    static func disappointment(duration: Double = 1.0) -> HapticOption {
        return .customCurve(events: EmotionalHapticPatterns.disappointmentEvents(duration: duration),
                           parameterCurves: EmotionalHapticPatterns.disappointmentCurves(duration: duration))
    }
    
    /// Surprise: Pause then burst
    /// Duration: 0.5s, Usage: Unexpected events, reveals
    static func surprise(duration: Double = 0.5) -> HapticOption {
        return .custom(events: EmotionalHapticPatterns.surprise(duration: duration), parameters: [])
    }
    
    /// Joy: Happy bouncing pattern
    /// Duration: 0.8s, Usage: Celebrations, happiness
    static func joy(duration: Double = 0.8) -> HapticOption {
        return .custom(events: EmotionalHapticPatterns.joy(duration: duration), parameters: [])
    }
    
    /// Anticipation: Building tension
    /// Duration: 1.2s, Usage: Waiting states, loading
    static func anticipation(duration: Double = 1.2) -> HapticOption {
        return .customCurve(events: EmotionalHapticPatterns.anticipation(duration: duration),
                           parameterCurves: EmotionalHapticPatterns.anticipationCurves(duration: duration))
    }
}