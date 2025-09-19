//
//  HapticOption.swift
//  
//
//  Created by Nick Sarno on 5/20/24.
//

import Foundation
@preconcurrency import CoreHaptics

public enum HapticOption: Sendable {
    case basic(BasicHaptic)
    case gaming(GamingHaptic)
    case educational(EducationalHaptic)
    case uiInteraction(UIInteractionHaptic)
    case specialEffect(SpecialEffectHaptic)
    case wellness(WellnessHaptic)
    case productivity(ProductivityHaptic)
    case finance(FinanceHaptic)
    case emotional(EmotionalHaptic)
    case intenseGamification(IntenseGamificationHaptic)
    case ratingsFeedback(RatingsFeedbackHaptic)
    case toolsWriting(ToolsWritingHaptic)
    case custom(events: [CHHapticEvent], parameters: [CHHapticDynamicParameter])
    case customCurve(events: [CHHapticEvent], parameterCurves: [CHHapticParameterCurve])
    
    // MARK: - Basic Haptics
    public enum BasicHaptic: String, CaseIterable, Sendable {
        // UISelectionFeedbackGenerator
        case selection
        
        // UIImpactFeedbackGenerator
        case soft
        case rigid
        case light
        case medium
        case heavy
        
        // UINotificationFeedbackGenerator
        case success
        case error
        case warning
    }
    
    // MARK: - Gaming Haptics
    public enum GamingHaptic: Sendable {
        // Lightning Strike Patterns
        case lightningStrikeQuick(duration: Double = 0.3)
        case lightningStrikeChain(duration: Double = 1.2)
        case lightningStrikeHeavy(duration: Double = 1.5)
        
        // Coin Collection Patterns
        case coinCollectSingle(duration: Double = 0.15)
        case coinCollectMulti(duration: Double = 0.8)
        case coinCollectJackpot(duration: Double = 2.0)
        
        // Sword Slash Patterns
        case swordSlashLight(duration: Double = 0.25)
        case swordSlashHeavy(duration: Double = 0.6)
        
        // Combat Patterns
        case arrowRelease(duration: Double = 0.5)
        case explosionSmall(duration: Double = 0.4)
        case explosionMassive(duration: Double = 1.8)
        case shieldBlock(duration: Double = 0.35)
        case criticalHit(duration: Double = 0.5)
        case comboHit3x(duration: Double = 0.8)
        case comboHit5x(duration: Double = 1.2)
        
        // Movement & Effects
        case footstepGrass(duration: Double = 0.2)
        case footstepMetal(duration: Double = 0.2)
        case engineStart(duration: Double = 2.0)
        case turboBoost(duration: Double = 1.5)
        case portalEnter(duration: Double = 0.8)
        case magicCharge(duration: Double = 1.0)
        case machineGun(duration: Double = 2.0)
        case cascade(duration: Double = 0.8)
        case elasticBounce(duration: Double = 2.0)
        
        // Apple-inspired
        case drums
    }
    
    // MARK: - Educational Haptics
    public enum EducationalHaptic: Sendable {
        // Achievement Patterns
        case achievementUnlocked(duration: Double = 1.2)
        case levelUp(duration: Double = 1.5)
        case starRating(count: Int = 3, duration: Double = 0.2)
        case badgeEarned(duration: Double = 0.8)
        case streakMilestone(duration: Double = 1.0)
        case perfectScore(duration: Double = 1.0)
        case rankPromotion(duration: Double = 1.5)
        case dailyGoalComplete(duration: Double = 1.0)
        case trophyUnlock(duration: Double = 1.8)
        case questComplete(duration: Double = 1.5)
        case highScore(duration: Double = 1.5)
        case masteryAchieved(duration: Double = 2.0)
        
        // Missing Achievement Patterns from HapticTesting
        case correctAnswerBasic(duration: Double = 0.2)
        case correctAnswerSimple(duration: Double = 0.25)
        case correctAnswerStreak(streakCount: Int = 3, duration: Double = 0.5)
        case correctAnswerPerfect(duration: Double = 0.8)
        case perfectLessonComplete(duration: Double = 2.0)
        case badgeUnlock(duration: Double = 0.8)
        case skillMastery(duration: Double = 1.5)
        case leaguePromotion(duration: Double = 1.5)
        case celebrationBurst(duration: Double = 1.0)
        case ascendingSuccess(duration: Double = 0.6)
        
        // Learning Feedback
        case correctAnswer(duration: Double = 0.3)
        case incorrectGentle(duration: Double = 0.4)
        case hintAvailable(duration: Double = 0.5)
        case progressCheckpoint(duration: Double = 0.6)
        case encouragementTap(duration: Double = 0.3)
        case skillUnlocked(duration: Double = 0.8)
        case lessonComplete(duration: Double = 1.0)
        case practiceReminder(duration: Double = 0.5)
        case knowledgeGained(duration: Double = 0.7)
        case feedbackPositive(duration: Double = 0.4)
        
        // Missing Learning Feedback Patterns from HapticTesting
        case wrongAnswerGentle(duration: Double = 0.5)
        case wrongAnswerStandard(duration: Double = 0.3)
        case nearMissAnswer(duration: Double = 0.35)
        case grammarError(duration: Double = 0.25)
        case hintActivation(duration: Double = 0.3)
        case hintReveal(duration: Double = 0.3)
        case timeCriticalWarning(duration: Double = 0.8)
        case partialCredit(duration: Double = 0.4)
        case tryAgainEncouragement(duration: Double = 0.3)
        case learningProgress(duration: Double = 0.5)
        case focusReminder(duration: Double = 0.3)
        
        // Gamification
        case xpGainSmall(duration: Double = 0.3)
        case xpGainLarge(duration: Double = 1.0)
        case bonusPoints(duration: Double = 0.7)
        case powerUpCollected(duration: Double = 0.5)
        case lifeGained(duration: Double = 0.6)
        case challengeAccepted(duration: Double = 0.5)
        case timerTick(duration: Double = 0.1)
        case rewardUnlock(duration: Double = 1.0)
        case progressBarFill(duration: Double = 0.8)
        case comboMultiplier(count: Int = 3, duration: Double = 0.6)
        
        // Missing Gamification Patterns from HapticTesting
        case xpGainBonus(duration: Double = 0.5)
        case xpGainDynamic(xpAmount: Int, duration: Double = 0.3)
        case progress25(duration: Double = 0.2)
        case progress50(duration: Double = 0.3)
        case progress75(duration: Double = 0.4)
        case progressBarFilling(startPercent: Double, endPercent: Double, duration: Double = 1.0)
        case dailyGoalCheckpoint(checkpointNumber: Int, duration: Double = 0.5)
        case leagueAdvancement(duration: Double = 1.2)
        case crownGemCollection(duration: Double = 0.6)
        case powerUpActivation(powerUpType: String, duration: Double = 0.5)
        case challengeCompletion(isPerfect: Bool, duration: Double = 1.0)
        case lessonPathProgress(nodeType: String, duration: Double = 0.4)
        case socialFeatureNotification(notificationType: String = "default", duration: Double = 0.6)
        
        // Missing Streaks & Milestones Patterns from HapticTesting
        case streakRiskWarning(duration: Double = 0.6)
        case streakLost(duration: Double = 0.5)
        case streakBuilding(streakCount: Int, duration: Double = 0.5)
        case streakMilestone5(duration: Double = 0.6)
        case streakMilestone7Days(duration: Double = 1.0)
        case streakMilestone10(duration: Double = 0.8)
        case streakMilestone25(duration: Double = 1.2)
        case streakMilestone30Days(duration: Double = 1.5)
        case streakMilestone100Days(duration: Double = 2.0)
    }
    
    // MARK: - UI Interaction Haptics
    public enum UIInteractionHaptic: Sendable {
        // Social Media Patterns
        case doubleTapLike(duration: Double = 0.2)
        case messageSent(duration: Double = 0.25)
        case notificationPop(duration: Double = 0.3)
        case typingIndicator(duration: Double = 0.1)
        case commentPosted(duration: Double = 0.2)
        
        // Navigation Patterns
        case pullToRefresh(duration: Double = 0.4)
        case swipeAction(duration: Double = 0.25, actionType: String = "default")
        case toggleSwitch(duration: Double = 0.2)
        case pickerDetent(duration: Double = 0.1)
        case longPressActivation(duration: Double = 0.4)
        case tabSelection(duration: Double = 0.15)
        case navigationPush(duration: Double = 0.25)
        case navigationPop(duration: Double = 0.2)
        case modalPresent(duration: Double = 0.3)
        case modalDismiss(duration: Double = 0.25)
        
        // Input & Controls
        case keyboardTap(duration: Double = 0.05)
        case sliderStep(duration: Double = 0.05)
        case sliderTick(duration: Double = 0.05)
        case buttonPress(duration: Double = 0.03)
        case selectionTick(duration: Double = 0.1)
        case segmentChange(duration: Double = 0.15)
        case zoomBoundary(duration: Double = 0.2)
        case dragAndDrop(duration: Double = 0.25, phase: String = "start")
        case formSubmit(duration: Double = 0.3)
        case inputError(duration: Double = 0.4)
        case loadingComplete(duration: Double = 0.5)
        case appIconTap(duration: Double = 0.15)
        
        // Additional Patterns
        case scrollBounce(duration: Double = 0.3)
        case pageFlip(duration: Double = 0.3)
        case photoCapture(duration: Double = 0.2)
        case shareAction(duration: Double = 0.3)
        case downloadComplete(duration: Double = 0.5)
        case refreshData(duration: Double = 0.4)
        case gestureRecognized(duration: Double = 0.2)
        case pageTurn(duration: Double = 0.3)
        
        // Missing UI Patterns from HapticTesting
        
        // Custom patterns
        case customPop(duration: Double = 0.15)
        case contextualMenu(duration: Double = 0.25)
        case sliderValueChange(duration: Double = 0.06)
        
        // Apple-inspired
        case pop(duration: Double = 0.2)
    }
    
    // MARK: - Special Effect Haptics
    public enum SpecialEffectHaptic: Sendable {
        case magicSparkle(duration: Double = 1.2)
        case waterDrop(duration: Double = 0.6)
        case earthquake(duration: Double = 2.5)
        case laserBeam(duration: Double = 0.8)
        case typewriter(duration: Double = 0.04)
        case heartbeat(duration: Double = 1.5)
        case electricSpark(duration: Double = 0.3)
        
        // Missing Special Effects from HapticTesting
        case rubberBand(duration: Double = 0.4)
        case buildUp(duration: Double = 2.0)
        
        // Apple-inspired
        case boing(duration: Double = 0.25)
        case inflate(duration: Double = 1.7)
        case oscillate(duration: Double = 3.0)
    }
    
    // MARK: - Wellness Haptics
    public enum WellnessHaptic: Sendable {
        case breathingGuide(duration: Double = 4.0)
        case calmPulse(duration: Double = 2.0)
        case meditationBell(duration: Double = 1.5)
        case relaxationWave(duration: Double = 3.0)
        case zenNotification(duration: Double = 1.2)
        
        // Missing Wellness Patterns from HapticTesting
        case timeWarning30s(duration: Double = 0.5)
        case timeWarning10s(duration: Double = 0.8)
        
        // Apple-inspired
        case heartBeats(count: Int = 3, durationPerBeat: Double = 0.255)
    }
    
    // MARK: - Productivity Haptics
    public enum ProductivityHaptic: Sendable {
        case timerComplete(duration: Double = 1.5)
        case taskCheck(duration: Double = 0.2)
        case focusStart(duration: Double = 0.8)
        case breakReminder(duration: Double = 1.2)
        case focusReminder(duration: Double = 0.25)
    }
    
    // MARK: - Finance Haptics
    public enum FinanceHaptic: Sendable {
        case paymentSuccess(duration: Double = 0.1)
        case paymentProcessing(duration: Double = 2.0)
        case transactionAlert(duration: Double = 0.5)
        case receiptSaved(duration: Double = 0.4)
    }
    
    // MARK: - Emotional Haptics
    public enum EmotionalHaptic: Sendable {
        case excitementBuild(duration: Double = 2.0)
        case disappointment(duration: Double = 0.8)
        case surprise(duration: Double = 0.5)
        case joy(duration: Double = 1.2)
        case anticipation(duration: Double = 2.0)
    }
    
    // MARK: - Intense Gamification Haptics
    public enum IntenseGamificationHaptic: Sendable {
        // Elemental Powers
        case fireBurst(duration: Double = 1.0)
        case iceShard(duration: Double = 1.5)
        case earthquakeRumble(duration: Double = 2.5)
        case windTornado(duration: Double = 1.8)
        
        // Missing Elemental Powers from HapticTesting
        case thunderStorm(duration: Double = 2.5)
        case meteorImpact(duration: Double = 3.0)
        case earthquake(duration: Double = 2.5)
        case tornado(duration: Double = 1.8)
        
        // Space & Sci-Fi
        case plasmaCharge(duration: Double = 1.5)
        case gravityWell(duration: Double = 2.0)
        case photonBlast(duration: Double = 0.8)
        case quantumShift(duration: Double = 0.6)
        case rocketLaunch(duration: Double = 3.0)
        case warpDrive(duration: Double = 2.0)
        case laserCannon(duration: Double = 0.5)
        case alienTeleport(duration: Double = 1.0)
        case spaceExplosion(duration: Double = 2.5)
        
        // Epic Abilities
        case ultimatePower(duration: Double = 3.0)
        case dragonRoar(duration: Double = 2.0)
        case titanSmash(duration: Double = 1.5)
        case dimensionalRift(duration: Double = 2.5)
        case volcanicEruption(duration: Double = 3.5)
        
        // Missing Epic Abilities from HapticTesting
        case titanStomp(duration: Double = 1.5)
        case phoenixRebirth(duration: Double = 2.0)
        case divineIntervention(duration: Double = 2.5)
        
        // Power-ups & Boosts
        case megaBoost(duration: Double = 1.5)
        case starPower(duration: Double = 2.0)
        case berserkerRage(duration: Double = 2.0)
        case divineShield(duration: Double = 1.5)
        
        // Missing Power-ups from HapticTesting
        case invincibilityActivation(duration: Double = 2.0)
        case timeFreeze(duration: Double = 2.5)
        case ultraCombo(duration: Double = 3.0)
        case nuclearCharge(duration: Double = 2.5)
    }
    
    // MARK: - Ratings & Feedback Haptics
    public enum RatingsFeedbackHaptic: Sendable {
        case starRating1(duration: Double = 0.1)
        case starRating3(duration: Double = 0.3)
        case starRating5(duration: Double = 0.8)
        case socialNotification(notificationType: String, duration: Double = 0.4)
    }
    
    // MARK: - Tools & Writing Haptics
    public enum ToolsWritingHaptic: Sendable {
        case pencilWrite(duration: Double = 0.05)
        case eraserUse(duration: Double = 0.2)
    }
}

// MARK: - Pattern Generation
extension HapticOption {
    func getCustomPattern() throws -> CHHapticPattern {
        switch self {
        case .basic(_):
            // Basic patterns use UIKit feedback generators, not custom patterns
            throw URLError(.unknown)
            
        case .gaming(let pattern):
            return try getGamingPattern(pattern)
            
        case .educational(let pattern):
            return try getEducationalPattern(pattern)
            
        case .uiInteraction(let pattern):
            return try getUIInteractionPattern(pattern)
            
        case .specialEffect(let pattern):
            return try getSpecialEffectPattern(pattern)
            
        case .wellness(let pattern):
            return try getWellnessPattern(pattern)
            
        case .productivity(let pattern):
            return try getProductivityPattern(pattern)
            
        case .finance(let pattern):
            return try getFinancePattern(pattern)
            
        case .emotional(let pattern):
            return try getEmotionalPattern(pattern)
            
        case .intenseGamification(let pattern):
            return try getIntenseGamificationPattern(pattern)
            
        case .ratingsFeedback(let pattern):
            return try getRatingsFeedbackPattern(pattern)
            
        case .toolsWriting(let pattern):
            return try getToolsWritingPattern(pattern)
            
        case .custom(events: let events, parameters: let parameters):
            return try CHHapticPattern(events: events, parameters: parameters)
            
        case .customCurve(events: let events, parameterCurves: let parameterCurves):
            return try CHHapticPattern(events: events, parameterCurves: parameterCurves)
        }
    }
    
    private func getGamingPattern(_ pattern: GamingHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .lightningStrikeQuick(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.lightningStrikeQuick(duration: duration), parameters: [])
        case .lightningStrikeChain(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.lightningStrikeChain(duration: duration), parameters: [])
        case .lightningStrikeHeavy(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.lightningStrikeHeavyEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.lightningStrikeHeavyCurves(duration: duration))
        case .coinCollectSingle(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.coinCollectSingle(duration: duration), parameters: [])
        case .coinCollectMulti(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.coinCollectMulti(duration: duration), parameters: [])
        case .coinCollectJackpot(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.coinCollectJackpotEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.coinCollectJackpotCurves(duration: duration))
        case .swordSlashLight(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.swordSlashLight(duration: duration), parameters: [])
        case .swordSlashHeavy(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.swordSlashHeavyEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.swordSlashHeavyCurves(duration: duration))
        case .arrowRelease(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.arrowReleaseEvents(duration: duration), parameters: [])
        case .explosionSmall(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.explosionSmall(duration: duration), parameters: [])
        case .explosionMassive(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.explosionMassiveEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.explosionMassiveCurves(duration: duration))
        case .shieldBlock(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.shieldBlock(duration: duration), parameters: [])
        case .criticalHit(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.criticalHit(duration: duration), parameters: [])
        case .comboHit3x(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.comboHit3x(duration: duration), parameters: [])
        case .comboHit5x(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.comboHit5x(duration: duration), parameters: [])
        case .footstepGrass(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.footstepGrass(duration: duration), parameters: [])
        case .footstepMetal(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.footstepMetal(duration: duration), parameters: [])
        case .engineStart(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.engineStartEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.engineStartCurves(duration: duration))
        case .turboBoost(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.turboBoostEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.turboBoostCurves(duration: duration))
        case .portalEnter(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.portalEnterEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.portalEnterCurves(duration: duration))
        case .magicCharge(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.magicChargeEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.magicChargeCurves(duration: duration))
        case .machineGun(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.machineGun(duration: duration), parameters: [])
        case .drums:
            return try CHHapticPattern(events: GamingHapticPatterns.drumsEvents(), parameters: [])
        case .cascade(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.cascadeEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.cascadeCurves(duration: duration))
        case .elasticBounce(let duration):
            return try CHHapticPattern(events: GamingHapticPatterns.elasticBounceEvents(duration: duration),
                                      parameterCurves: GamingHapticPatterns.elasticBounceCurves(duration: duration))
        }
    }
    
    private func getEducationalPattern(_ pattern: EducationalHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .achievementUnlocked(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.achievementUnlocked(duration: duration), parameters: [])
        case .levelUp(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.levelUpEvents(duration: duration), parameterCurves: EducationalHapticPatterns.levelUpCurves(duration: duration))
        case .starRating(let count, let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.starRating(count: count, duration: duration), parameters: [])
        case .badgeEarned(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.badgeEarned(duration: duration), parameters: [])
        case .streakMilestone(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakMilestone(duration: duration), parameters: [])
        case .perfectScore(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.perfectScore(duration: duration), 
                                      parameterCurves: EducationalHapticPatterns.perfectScoreCurves(duration: duration))
        case .rankPromotion(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.rankPromotion(duration: duration), parameters: [])
        case .dailyGoalComplete(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.dailyGoalComplete(duration: duration), parameters: [])
        case .trophyUnlock(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.trophyUnlock(duration: duration), parameters: [])
        case .questComplete(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.questComplete(duration: duration), parameters: [])
        case .highScore(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.highScore(duration: duration), parameters: [])
        case .masteryAchieved(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.masteryAchieved(duration: duration), parameters: [])
        case .correctAnswer(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.correctAnswer(duration: duration), parameters: [])
        case .incorrectGentle(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.incorrectGentle(duration: duration), parameters: [])
        case .hintAvailable(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.hintAvailable(duration: duration), parameters: [])
        case .progressCheckpoint(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.progressCheckpoint(duration: duration), parameters: [])
        case .encouragementTap(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.encouragementTap(duration: duration), parameters: [])
        case .skillUnlocked(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.skillUnlocked(duration: duration), parameters: [])
        case .lessonComplete(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.lessonCompleteEvents(duration: duration), parameterCurves: EducationalHapticPatterns.lessonCompleteCurves(duration: duration))
        case .practiceReminder(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.practiceReminder(duration: duration), parameters: [])
        case .knowledgeGained(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.knowledgeGained(duration: duration), parameters: [])
        case .feedbackPositive(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.feedbackPositive(duration: duration), parameters: [])
        case .xpGainSmall(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.xpGainSmall(duration: duration), parameters: [])
        case .xpGainLarge(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.xpGainLargeEvents(duration: duration), parameterCurves: EducationalHapticPatterns.xpGainLargeCurves(duration: duration))
        case .bonusPoints(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.bonusPoints(duration: duration), parameters: [])
        case .powerUpCollected(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.powerUpCollected(duration: duration), parameters: [])
        case .lifeGained(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.lifeGained(duration: duration), parameters: [])
        case .challengeAccepted(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.challengeAccepted(duration: duration), parameters: [])
        case .timerTick(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.timerTick(duration: duration), parameters: [])
        case .rewardUnlock(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.rewardUnlock(duration: duration), parameters: [])
        case .progressBarFill(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.progressBarFill(duration: duration), parameters: [])
        case .comboMultiplier(let count, let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.comboMultiplier(count: count, duration: duration), parameters: [])
            
        // Missing Achievement Patterns
        case .correctAnswerBasic(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.correctAnswerBasic(duration: duration), parameters: [])
        case .correctAnswerSimple(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.correctAnswerSimple(duration: duration), parameters: [])
        case .correctAnswerStreak(let streakCount, let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.correctAnswerStreak(streakCount: streakCount, duration: duration), parameters: [])
        case .correctAnswerPerfect(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.correctAnswerPerfectEvents(duration: duration), parameterCurves: EducationalHapticPatterns.correctAnswerPerfectCurves(duration: duration))
        case .perfectLessonComplete(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.perfectLessonCompleteEvents(duration: duration), parameterCurves: EducationalHapticPatterns.perfectLessonCompleteCurves(duration: duration))
        case .badgeUnlock(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.badgeUnlock(duration: duration), parameters: [])
        case .skillMastery(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.skillMastery(duration: duration), 
                                      parameterCurves: EducationalHapticPatterns.skillMasteryCurves(duration: duration))
        case .leaguePromotion(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.leaguePromotion(duration: duration), 
                                      parameterCurves: EducationalHapticPatterns.leaguePromotionCurves(duration: duration))
        case .celebrationBurst(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.celebrationBurst(duration: duration), parameters: [])
        case .ascendingSuccess(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.ascendingSuccess(duration: duration), parameters: [])
            
        // Missing Learning Feedback Patterns
        case .wrongAnswerGentle(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.wrongAnswerGentle(duration: duration), parameters: [])
        case .wrongAnswerStandard(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.wrongAnswerStandard(duration: duration), parameters: [])
        case .nearMissAnswer(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.nearMissAnswer(duration: duration), parameters: [])
        case .grammarError(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.grammarError(duration: duration), parameters: [])
        case .hintActivation(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.hintActivation(duration: duration), parameters: [])
        case .hintReveal(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.hintReveal(duration: duration), parameters: [])
        case .timeCriticalWarning(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.timeCriticalWarning(duration: duration), 
                                      parameterCurves: EducationalHapticPatterns.timeCriticalWarningCurves(duration: duration))
        case .partialCredit(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.partialCredit(duration: duration), parameters: [])
        case .tryAgainEncouragement(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.tryAgainEncouragement(duration: duration), parameters: [])
        case .learningProgress(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.learningProgress(duration: duration), parameters: [])
        case .focusReminder(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.focusReminder(duration: duration), parameters: [])
            
        // Missing Gamification Patterns
        case .xpGainBonus(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.xpGainBonus(duration: duration), parameters: [])
        case .xpGainDynamic(let xpAmount, let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.xpGainDynamicEvents(xpAmount: xpAmount, duration: duration), 
                                      parameterCurves: EducationalHapticPatterns.xpGainDynamicCurves(xpAmount: xpAmount, duration: duration))
        case .progress25:
            return try CHHapticPattern(events: EducationalHapticPatterns.progress25(), parameters: [])
        case .progress50:
            return try CHHapticPattern(events: EducationalHapticPatterns.progress50(), parameters: [])
        case .progress75:
            return try CHHapticPattern(events: EducationalHapticPatterns.progress75(), parameters: [])
        case .progressBarFilling(let startPercent, let endPercent, let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.progressBarFillingEvents(startPercent: Float(startPercent), endPercent: Float(endPercent), duration: duration), 
                                      parameterCurves: EducationalHapticPatterns.progressBarFillingCurves(startPercent: Float(startPercent), endPercent: Float(endPercent), duration: duration))
        case .dailyGoalCheckpoint(let checkpointNumber, let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.dailyGoalCheckpoint(checkpointNumber: checkpointNumber, duration: duration), parameters: [])
        case .leagueAdvancement(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.leagueAdvancementEvents(duration: duration), 
                                      parameterCurves: EducationalHapticPatterns.leagueAdvancementCurves(duration: duration))
        case .crownGemCollection:
            return try CHHapticPattern(events: EducationalHapticPatterns.crownGemCollection(), parameters: [])
        case .powerUpActivation(let powerUpType, _):
            return try CHHapticPattern(events: EducationalHapticPatterns.powerUpActivation(powerUpType: powerUpType), 
                                      parameterCurves: EducationalHapticPatterns.powerUpActivationCurves())
        case .challengeCompletion(let isPerfect, _):
            return try CHHapticPattern(events: EducationalHapticPatterns.challengeCompletion(isPerfect: isPerfect), 
                                      parameterCurves: EducationalHapticPatterns.challengeCompletionCurves(isPerfect: isPerfect))
        case .lessonPathProgress(let nodeType, _):
            return try CHHapticPattern(events: EducationalHapticPatterns.lessonPathProgress(nodeType: nodeType), parameters: [])
        case .socialFeatureNotification(let notificationType, _):
            return try CHHapticPattern(events: EducationalHapticPatterns.socialFeatureNotification(notificationType: notificationType), parameters: [])
            
        // Missing Streaks & Milestones Patterns
        case .streakRiskWarning(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakRiskWarning(duration: duration), parameters: [])
        case .streakLost(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakLost(duration: duration), parameters: [])
        case .streakBuilding(let streakCount, _):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakBuilding(streakCount: streakCount), 
                                      parameterCurves: EducationalHapticPatterns.streakBuildingCurves(streakCount: streakCount))
        case .streakMilestone5(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakMilestone5(duration: duration), parameters: [])
        case .streakMilestone7Days(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakMilestone7Days(duration: duration), parameters: [])
        case .streakMilestone10(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakMilestone10(duration: duration), parameters: [])
        case .streakMilestone25(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakMilestone25Events(duration: duration), parameterCurves: EducationalHapticPatterns.streakMilestone25Curves(duration: duration))
        case .streakMilestone30Days(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakMilestone30Days(duration: duration), parameters: [])
        case .streakMilestone100Days(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.streakMilestone100Days(duration: duration), 
                                      parameterCurves: EducationalHapticPatterns.streakMilestone100DaysCurves(duration: duration))
        }
    }
    
    private func getUIInteractionPattern(_ pattern: UIInteractionHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .doubleTapLike(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.doubleTapLike(duration: duration), parameters: [])
        case .messageSent(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.messageSent(duration: duration), parameters: [])
        case .notificationPop(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.notificationPop(duration: duration), parameters: [])
        case .typingIndicator(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.typingIndicator(duration: duration), parameters: [])
        case .commentPosted(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.commentPosted(duration: duration), parameters: [])
        case .pullToRefresh(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.pullToRefreshEvents(duration: duration),
                                      parameterCurves: UIInteractionHapticPatterns.pullToRefreshCurves(duration: duration))
        case .swipeAction(let duration, let actionType):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.swipeActionEvents(duration: duration, actionType: actionType), parameters: [])
        case .toggleSwitch(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.toggleSwitchEvents(duration: duration), parameters: [])
        case .pickerDetent(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.pickerDetentEvents(duration: duration), parameters: [])
        case .longPressActivation(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.longPressActivationEvents(duration: duration),
                                      parameterCurves: UIInteractionHapticPatterns.longPressActivationCurves(duration: duration))
        case .tabSelection(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.tabSelectionEvents(duration: duration), parameters: [])
        case .navigationPush(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.navigationPushEvents(duration: duration), parameters: [])
        case .navigationPop(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.navigationPopEvents(duration: duration), parameters: [])
        case .modalPresent(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.modalPresentEvents(duration: duration), parameters: [])
        case .modalDismiss(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.modalDismissEvents(duration: duration), parameters: [])
        case .keyboardTap(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.keyboardTapEvents(duration: duration), parameters: [])
        case .sliderStep(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.sliderStepEvents(duration: duration), parameters: [])
        case .sliderTick(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.sliderTick(duration: duration), parameters: [])
        case .buttonPress(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.buttonPress(duration: duration), parameters: [])
        case .selectionTick(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.selectionTickEvents(duration: duration), parameters: [])
        case .segmentChange(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.segmentChangeEvents(duration: duration), parameters: [])
        case .zoomBoundary(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.zoomBoundaryEvents(duration: duration), parameters: [])
        case .dragAndDrop(let duration, let phase):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.dragAndDropEvents(duration: duration, phase: phase), parameters: [])
        case .formSubmit(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.formSubmitEvents(duration: duration), parameters: [])
        case .inputError(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.inputErrorEvents(duration: duration), parameters: [])
        case .loadingComplete(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.loadingCompleteEvents(duration: duration), parameters: [])
        case .appIconTap(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.appIconTapEvents(duration: duration), parameters: [])
        case .scrollBounce(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.scrollBounce(duration: duration), parameters: [])
        case .pageFlip(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.pageFlip(duration: duration), parameters: [])
        case .photoCapture(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.photoCapture(duration: duration), parameters: [])
        case .shareAction(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.shareAction(duration: duration), parameters: [])
        case .downloadComplete(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.downloadComplete(duration: duration), parameters: [])
        case .refreshData(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.refreshData(duration: duration), parameters: [])
        case .gestureRecognized(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.gestureRecognized(duration: duration), parameters: [])
        case .pageTurn(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.pageTurn(duration: duration), parameters: [])
        case .customPop(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.customPopEvents(duration: duration),
                                      parameterCurves: UIInteractionHapticPatterns.customPopCurves(duration: duration))
        case .contextualMenu(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.contextualMenuEvents(duration: duration), parameters: [])
        case .sliderValueChange(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.sliderValueChangeEvents(duration: duration), parameters: [])
        case .pop(let duration):
            return try CHHapticPattern(events: UIInteractionHapticPatterns.popEvents(duration: duration),
                                      parameterCurves: UIInteractionHapticPatterns.popCurves(duration: duration))
        }
    }
    
    private func getSpecialEffectPattern(_ pattern: SpecialEffectHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .magicSparkle(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.magicSparkle(duration: duration), parameters: [])
        case .waterDrop(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.waterDropEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.waterDropCurves(duration: duration))
        case .earthquake(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.earthquakeEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.earthquakeCurves(duration: duration))
        case .laserBeam(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.laserBeamEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.laserBeamCurves(duration: duration))
        case .typewriter(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.typewriter(duration: duration), parameters: [])
        case .heartbeat(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.heartbeatEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.heartbeatCurves(duration: duration))
        case .electricSpark(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.electricSpark(duration: duration), parameters: [])
        case .rubberBand(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.rubberBandEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.rubberBandCurves(duration: duration))
        case .buildUp(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.buildUpEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.buildUpCurves(duration: duration))
        case .boing(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.boingEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.boingCurves(duration: duration))
        case .inflate(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.inflateEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.inflateCurves(duration: duration))
        case .oscillate(let duration):
            return try CHHapticPattern(events: SpecialEffectHapticPatterns.oscillateEvents(duration: duration),
                                      parameterCurves: SpecialEffectHapticPatterns.oscillateCurves(duration: duration))
        }
    }
    
    private func getWellnessPattern(_ pattern: WellnessHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .breathingGuide(let duration):
            return try CHHapticPattern(events: WellnessHapticPatterns.breathingGuideEvents(duration: duration),
                                      parameterCurves: WellnessHapticPatterns.breathingGuideCurves(duration: duration))
        case .calmPulse(let duration):
            return try CHHapticPattern(events: WellnessHapticPatterns.calmPulseEvents(duration: duration),
                                      parameterCurves: WellnessHapticPatterns.calmPulseCurves(duration: duration))
        case .meditationBell(let duration):
            return try CHHapticPattern(events: WellnessHapticPatterns.meditationBell(duration: duration),
                                      parameterCurves: WellnessHapticPatterns.meditationBellCurves(duration: duration))
        case .relaxationWave(let duration):
            return try CHHapticPattern(events: WellnessHapticPatterns.relaxationWave(duration: duration),
                                      parameterCurves: WellnessHapticPatterns.relaxationWaveCurves(duration: duration))
        case .zenNotification(let duration):
            return try CHHapticPattern(events: WellnessHapticPatterns.zenNotification(duration: duration), parameters: [])
        case .heartBeats(let count, let durationPerBeat):
            return try CHHapticPattern(events: WellnessHapticPatterns.heartbeatsEvents(count: count, durationPerBeat: durationPerBeat),
                                      parameters: [])
        case .timeWarning30s(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.timeWarning30s(duration: duration), parameters: [])
        case .timeWarning10s(let duration):
            return try CHHapticPattern(events: EducationalHapticPatterns.timeWarning10s(duration: duration), parameters: [])
        }
    }
    
    private func getProductivityPattern(_ pattern: ProductivityHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .timerComplete(let duration):
            return try CHHapticPattern(events: ProductivityHapticPatterns.timerCompleteEvents(duration: duration),
                                      parameterCurves: ProductivityHapticPatterns.timerCompleteCurves(duration: duration))
        case .taskCheck(let duration):
            return try CHHapticPattern(events: ProductivityHapticPatterns.taskCheck(duration: duration), parameters: [])
        case .focusStart(let duration):
            return try CHHapticPattern(events: ProductivityHapticPatterns.focusStart(duration: duration), parameters: [])
        case .breakReminder(let duration):
            return try CHHapticPattern(events: ProductivityHapticPatterns.breakReminder(duration: duration), parameters: [])
        case .focusReminder(let duration):
            return try CHHapticPattern(events: ProductivityHapticPatterns.focusReminder(duration: duration), parameters: [])
        }
    }
    
    private func getFinancePattern(_ pattern: FinanceHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .paymentSuccess(let duration):
            return try CHHapticPattern(events: FinanceHapticPatterns.paymentSuccess(duration: duration), parameters: [])
        case .paymentProcessing(let duration):
            return try CHHapticPattern(events: FinanceHapticPatterns.paymentProcessingEvents(duration: duration),
                                      parameterCurves: FinanceHapticPatterns.paymentProcessingCurves(duration: duration))
        case .transactionAlert(let duration):
            return try CHHapticPattern(events: FinanceHapticPatterns.transactionAlert(duration: duration), parameters: [])
        case .receiptSaved(let duration):
            return try CHHapticPattern(events: FinanceHapticPatterns.receiptSaved(duration: duration), parameters: [])
        }
    }
    
    private func getEmotionalPattern(_ pattern: EmotionalHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .excitementBuild(let duration):
            return try CHHapticPattern(events: EmotionalHapticPatterns.excitementBuildEvents(duration: duration),
                                      parameterCurves: EmotionalHapticPatterns.excitementBuildCurves(duration: duration))
        case .disappointment(let duration):
            return try CHHapticPattern(events: EmotionalHapticPatterns.disappointmentEvents(duration: duration),
                                      parameterCurves: EmotionalHapticPatterns.disappointmentCurves(duration: duration))
        case .surprise(let duration):
            return try CHHapticPattern(events: EmotionalHapticPatterns.surprise(duration: duration), parameters: [])
        case .joy(let duration):
            return try CHHapticPattern(events: EmotionalHapticPatterns.joy(duration: duration), parameters: [])
        case .anticipation(let duration):
            return try CHHapticPattern(events: EmotionalHapticPatterns.anticipation(duration: duration),
                                      parameterCurves: EmotionalHapticPatterns.anticipationCurves(duration: duration))
        }
    }
    
    private func getIntenseGamificationPattern(_ pattern: IntenseGamificationHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .fireBurst(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.fireBurstEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.fireBurstCurves(duration: duration))
        case .iceShard(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.iceShardEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.iceShardCurves(duration: duration))
        case .earthquakeRumble(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.earthquakeRumbleEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.earthquakeRumbleCurves(duration: duration))
        case .windTornado(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.windTornadoEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.windTornadoCurves(duration: duration))
        case .thunderStorm(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.thunderStormEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.thunderStormCurves(duration: duration))
        case .meteorImpact(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.meteorImpactEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.meteorImpactCurves(duration: duration))
        case .earthquake(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.earthquakeEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.earthquakeCurves(duration: duration))
        case .tornado(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.tornadoEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.tornadoCurves(duration: duration))
        case .plasmaCharge(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.plasmaChargeEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.plasmaChargeCurves(duration: duration))
        case .gravityWell(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.gravityWellEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.gravityWellCurves(duration: duration))
        case .photonBlast(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.photonBlastEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.photonBlastCurves(duration: duration))
        case .quantumShift(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.quantumShiftEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.quantumShiftCurves(duration: duration))
        case .rocketLaunch(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.rocketLaunchEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.rocketLaunchCurves(duration: duration))
        case .warpDrive(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.warpDriveEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.warpDriveCurves(duration: duration))
        case .laserCannon(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.laserCannonEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.laserCannonCurves(duration: duration))
        case .alienTeleport(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.alienTeleportEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.alienTeleportCurves(duration: duration))
        case .spaceExplosion(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.spaceExplosionEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.spaceExplosionCurves(duration: duration))
        case .ultimatePower(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.ultimatePowerEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.ultimatePowerCurves(duration: duration))
        case .dragonRoar(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.dragonRoarEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.dragonRoarCurves(duration: duration))
        case .titanSmash(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.titanSmashEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.titanSmashCurves(duration: duration))
        case .dimensionalRift(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.dimensionalRiftEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.dimensionalRiftCurves(duration: duration))
        case .volcanicEruption(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.volcanicEruptionEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.volcanicEruptionCurves(duration: duration))
        case .titanStomp(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.titanStompEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.titanStompCurves(duration: duration))
        case .phoenixRebirth(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.phoenixRebirthEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.phoenixRebirthCurves(duration: duration))
        case .divineIntervention(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.divineInterventionEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.divineInterventionCurves(duration: duration))
        case .invincibilityActivation(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.invincibilityActivationEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.invincibilityActivationCurves(duration: duration))
        case .timeFreeze(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.timeFreezeEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.timeFreezeCurves(duration: duration))
        case .ultraCombo(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.ultraComboEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.ultraComboCurves(duration: duration))
        case .nuclearCharge(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.nuclearChargeEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.nuclearChargeCurves(duration: duration))
        case .megaBoost(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.megaBoostEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.megaBoostCurves(duration: duration))
        case .starPower(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.starPowerEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.starPowerCurves(duration: duration))
        case .berserkerRage(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.berserkerRageEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.berserkerRageCurves(duration: duration))
        case .divineShield(let duration):
            return try CHHapticPattern(events: IntenseGamificationHapticPatterns.divineShieldEvents(duration: duration),
                                      parameterCurves: IntenseGamificationHapticPatterns.divineShieldCurves(duration: duration))
        }
    }
}

// MARK: - Raw Value Support
extension HapticOption {
    public var rawValue: String {
        switch self {
        case .basic(let pattern):
            return "basic.\(pattern.rawValue)"
        case .gaming(let pattern):
            return "gaming.\(getGamingRawValue(pattern))"
        case .educational(let pattern):
            return "educational.\(getEducationalRawValue(pattern))"
        case .uiInteraction(let pattern):
            return "uiInteraction.\(getUIInteractionRawValue(pattern))"
        case .specialEffect(let pattern):
            return "specialEffect.\(getSpecialEffectRawValue(pattern))"
        case .wellness(let pattern):
            return "wellness.\(getWellnessRawValue(pattern))"
        case .productivity(let pattern):
            return "productivity.\(getProductivityRawValue(pattern))"
        case .finance(let pattern):
            return "finance.\(getFinanceRawValue(pattern))"
        case .emotional(let pattern):
            return "emotional.\(getEmotionalRawValue(pattern))"
        case .intenseGamification(let pattern):
            return "intenseGamification.\(getIntenseGamificationRawValue(pattern))"
        case .ratingsFeedback(let pattern):
            return "ratingsFeedback.\(getRatingsFeedbackRawValue(pattern))"
        case .toolsWriting(let pattern):
            return "toolsWriting.\(getToolsWritingRawValue(pattern))"
        case .custom:
            return "custom"
        case .customCurve:
            return "customCurve"
        }
    }
    
    private func getGamingRawValue(_ pattern: GamingHaptic) -> String {
        switch pattern {
        case .lightningStrikeQuick: return "lightningStrikeQuick"
        case .lightningStrikeChain: return "lightningStrikeChain"
        case .lightningStrikeHeavy: return "lightningStrikeHeavy"
        case .coinCollectSingle: return "coinCollectSingle"
        case .coinCollectMulti: return "coinCollectMulti"
        case .coinCollectJackpot: return "coinCollectJackpot"
        case .swordSlashLight: return "swordSlashLight"
        case .swordSlashHeavy: return "swordSlashHeavy"
        case .arrowRelease: return "arrowRelease"
        case .explosionSmall: return "explosionSmall"
        case .explosionMassive: return "explosionMassive"
        case .shieldBlock: return "shieldBlock"
        case .criticalHit: return "criticalHit"
        case .comboHit3x: return "comboHit3x"
        case .comboHit5x: return "comboHit5x"
        case .footstepGrass: return "footstepGrass"
        case .footstepMetal: return "footstepMetal"
        case .engineStart: return "engineStart"
        case .turboBoost: return "turboBoost"
        case .portalEnter: return "portalEnter"
        case .magicCharge: return "magicCharge"
        case .machineGun: return "machineGun"
        case .drums: return "drums"
        case .cascade: return "cascade"
        case .elasticBounce: return "elasticBounce"
        }
    }
    
    private func getEducationalRawValue(_ pattern: EducationalHaptic) -> String {
        switch pattern {
        case .achievementUnlocked: return "achievementUnlocked"
        case .levelUp: return "levelUp"
        case .starRating: return "starRating"
        case .badgeEarned: return "badgeEarned"
        case .streakMilestone: return "streakMilestone"
        case .perfectScore: return "perfectScore"
        case .rankPromotion: return "rankPromotion"
        case .dailyGoalComplete: return "dailyGoalComplete"
        case .trophyUnlock: return "trophyUnlock"
        case .questComplete: return "questComplete"
        case .highScore: return "highScore"
        case .masteryAchieved: return "masteryAchieved"
        case .correctAnswerBasic: return "correctAnswerBasic"
        case .correctAnswerSimple: return "correctAnswerSimple"
        case .correctAnswerStreak: return "correctAnswerStreak"
        case .correctAnswerPerfect: return "correctAnswerPerfect"
        case .perfectLessonComplete: return "perfectLessonComplete"
        case .badgeUnlock: return "badgeUnlock"
        case .skillMastery: return "skillMastery"
        case .leaguePromotion: return "leaguePromotion"
        case .celebrationBurst: return "celebrationBurst"
        case .ascendingSuccess: return "ascendingSuccess"
        case .correctAnswer: return "correctAnswer"
        case .incorrectGentle: return "incorrectGentle"
        case .hintAvailable: return "hintAvailable"
        case .progressCheckpoint: return "progressCheckpoint"
        case .encouragementTap: return "encouragementTap"
        case .skillUnlocked: return "skillUnlocked"
        case .lessonComplete: return "lessonComplete"
        case .practiceReminder: return "practiceReminder"
        case .knowledgeGained: return "knowledgeGained"
        case .feedbackPositive: return "feedbackPositive"
        case .wrongAnswerGentle: return "wrongAnswerGentle"
        case .wrongAnswerStandard: return "wrongAnswerStandard"
        case .nearMissAnswer: return "nearMissAnswer"
        case .grammarError: return "grammarError"
        case .hintActivation: return "hintActivation"
        case .hintReveal: return "hintReveal"
        case .timeCriticalWarning: return "timeCriticalWarning"
        case .partialCredit: return "partialCredit"
        case .tryAgainEncouragement: return "tryAgainEncouragement"
        case .learningProgress: return "learningProgress"
        case .focusReminder: return "focusReminder"
        case .xpGainSmall: return "xpGainSmall"
        case .xpGainLarge: return "xpGainLarge"
        case .xpGainBonus: return "xpGainBonus"
        case .xpGainDynamic: return "xpGainDynamic"
        case .bonusPoints: return "bonusPoints"
        case .powerUpCollected: return "powerUpCollected"
        case .lifeGained: return "lifeGained"
        case .challengeAccepted: return "challengeAccepted"
        case .timerTick: return "timerTick"
        case .rewardUnlock: return "rewardUnlock"
        case .progressBarFill: return "progressBarFill"
        case .progressBarFilling: return "progressBarFilling"
        case .dailyGoalCheckpoint: return "dailyGoalCheckpoint"
        case .leagueAdvancement: return "leagueAdvancement"
        case .crownGemCollection: return "crownGemCollection"
        case .powerUpActivation: return "powerUpActivation"
        case .challengeCompletion: return "challengeCompletion"
        case .lessonPathProgress: return "lessonPathProgress"
        case .socialFeatureNotification: return "socialFeatureNotification"
        case .streakBuilding: return "streakBuilding"
        case .comboMultiplier: return "comboMultiplier"
        case .progress25: return "progress25"
        case .progress50: return "progress50"
        case .progress75: return "progress75"
        case .streakRiskWarning: return "streakRiskWarning"
        case .streakLost: return "streakLost"
        case .streakMilestone5: return "streakMilestone5"
        case .streakMilestone7Days: return "streakMilestone7Days"
        case .streakMilestone10: return "streakMilestone10"
        case .streakMilestone25: return "streakMilestone25"
        case .streakMilestone30Days: return "streakMilestone30Days"
        case .streakMilestone100Days: return "streakMilestone100Days"
        }
    }
    
    private func getUIInteractionRawValue(_ pattern: UIInteractionHaptic) -> String {
        switch pattern {
        case .doubleTapLike: return "doubleTapLike"
        case .messageSent: return "messageSent"
        case .notificationPop: return "notificationPop"
        case .typingIndicator: return "typingIndicator"
        case .commentPosted: return "commentPosted"
        case .pullToRefresh: return "pullToRefresh"
        case .swipeAction: return "swipeAction"
        case .toggleSwitch: return "toggleSwitch"
        case .pickerDetent: return "pickerDetent"
        case .longPressActivation: return "longPressActivation"
        case .tabSelection: return "tabSelection"
        case .navigationPush: return "navigationPush"
        case .navigationPop: return "navigationPop"
        case .modalPresent: return "modalPresent"
        case .modalDismiss: return "modalDismiss"
        case .keyboardTap: return "keyboardTap"
        case .sliderStep: return "sliderStep"
        case .sliderTick: return "sliderTick"
        case .buttonPress: return "buttonPress"
        case .selectionTick: return "selectionTick"
        case .segmentChange: return "segmentChange"
        case .zoomBoundary: return "zoomBoundary"
        case .dragAndDrop: return "dragAndDrop"
        case .formSubmit: return "formSubmit"
        case .inputError: return "inputError"
        case .loadingComplete: return "loadingComplete"
        case .appIconTap: return "appIconTap"
        case .scrollBounce: return "scrollBounce"
        case .pageFlip: return "pageFlip"
        case .photoCapture: return "photoCapture"
        case .shareAction: return "shareAction"
        case .downloadComplete: return "downloadComplete"
        case .refreshData: return "refreshData"
        case .gestureRecognized: return "gestureRecognized"
        case .pageTurn: return "pageTurn"
        case .customPop: return "customPop"
        case .contextualMenu: return "contextualMenu"
        case .sliderValueChange: return "sliderValueChange"
        case .pop: return "pop"
        }
    }
    
    private func getSpecialEffectRawValue(_ pattern: SpecialEffectHaptic) -> String {
        switch pattern {
        case .magicSparkle: return "magicSparkle"
        case .waterDrop: return "waterDrop"
        case .earthquake: return "earthquake"
        case .laserBeam: return "laserBeam"
        case .typewriter: return "typewriter"
        case .heartbeat: return "heartbeat"
        case .electricSpark: return "electricSpark"
        case .rubberBand: return "rubberBand"
        case .buildUp: return "buildUp"
        case .boing: return "boing"
        case .inflate: return "inflate"
        case .oscillate: return "oscillate"
        }
    }
    
    private func getWellnessRawValue(_ pattern: WellnessHaptic) -> String {
        switch pattern {
        case .breathingGuide: return "breathingGuide"
        case .calmPulse: return "calmPulse"
        case .meditationBell: return "meditationBell"
        case .relaxationWave: return "relaxationWave"
        case .zenNotification: return "zenNotification"
        case .timeWarning30s: return "timeWarning30s"
        case .timeWarning10s: return "timeWarning10s"
        case .heartBeats: return "heartBeats"
        }
    }
    
    private func getProductivityRawValue(_ pattern: ProductivityHaptic) -> String {
        switch pattern {
        case .timerComplete: return "timerComplete"
        case .taskCheck: return "taskCheck"
        case .focusStart: return "focusStart"
        case .breakReminder: return "breakReminder"
        case .focusReminder: return "focusReminder"
        }
    }
    
    private func getFinanceRawValue(_ pattern: FinanceHaptic) -> String {
        switch pattern {
        case .paymentSuccess: return "paymentSuccess"
        case .paymentProcessing: return "paymentProcessing"
        case .transactionAlert: return "transactionAlert"
        case .receiptSaved: return "receiptSaved"
        }
    }
    
    private func getEmotionalRawValue(_ pattern: EmotionalHaptic) -> String {
        switch pattern {
        case .excitementBuild: return "excitementBuild"
        case .disappointment: return "disappointment"
        case .surprise: return "surprise"
        case .joy: return "joy"
        case .anticipation: return "anticipation"
        }
    }
    
    private func getIntenseGamificationRawValue(_ pattern: IntenseGamificationHaptic) -> String {
        switch pattern {
        case .fireBurst: return "fireBurst"
        case .iceShard: return "iceShard"
        case .earthquakeRumble: return "earthquakeRumble"
        case .windTornado: return "windTornado"
        case .plasmaCharge: return "plasmaCharge"
        case .gravityWell: return "gravityWell"
        case .photonBlast: return "photonBlast"
        case .quantumShift: return "quantumShift"
        case .rocketLaunch: return "rocketLaunch"
        case .warpDrive: return "warpDrive"
        case .laserCannon: return "laserCannon"
        case .alienTeleport: return "alienTeleport"
        case .spaceExplosion: return "spaceExplosion"
        case .ultimatePower: return "ultimatePower"
        case .dragonRoar: return "dragonRoar"
        case .titanSmash: return "titanSmash"
        case .dimensionalRift: return "dimensionalRift"
        case .volcanicEruption: return "volcanicEruption"
        case .megaBoost: return "megaBoost"
        case .starPower: return "starPower"
        case .berserkerRage: return "berserkerRage"
        case .divineShield: return "divineShield"
        case .thunderStorm: return "thunderStorm"
        case .meteorImpact: return "meteorImpact"
        case .earthquake: return "earthquake"
        case .tornado: return "tornado"
        case .titanStomp: return "titanStomp"
        case .phoenixRebirth: return "phoenixRebirth"
        case .divineIntervention: return "divineIntervention"
        case .invincibilityActivation: return "invincibilityActivation"
        case .timeFreeze: return "timeFreeze"
        case .ultraCombo: return "ultraCombo"
        case .nuclearCharge: return "nuclearCharge"
        }
    }
    
    private func getRatingsFeedbackPattern(_ pattern: RatingsFeedbackHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .starRating1(let duration):
            return try CHHapticPattern(events: RatingsFeedbackHapticPatterns.starRating1(duration: duration), parameters: [])
        case .starRating3(let duration):
            return try CHHapticPattern(events: RatingsFeedbackHapticPatterns.starRating3(duration: duration), parameters: [])
        case .starRating5(let duration):
            return try CHHapticPattern(events: RatingsFeedbackHapticPatterns.starRating5(duration: duration), parameters: [])
        case .socialNotification(let notificationType, let duration):
            return try CHHapticPattern(events: RatingsFeedbackHapticPatterns.socialNotification(notificationType: notificationType, duration: duration), parameters: [])
        }
    }
    
    private func getToolsWritingPattern(_ pattern: ToolsWritingHaptic) throws -> CHHapticPattern {
        switch pattern {
        case .pencilWrite:
            return try CHHapticPattern(events: ToolsWritingHapticPatterns.pencilWrite(), parameters: [])
        case .eraserUse:
            return try CHHapticPattern(events: ToolsWritingHapticPatterns.eraserUse(), parameters: [])
        }
    }
    
    private func getRatingsFeedbackRawValue(_ pattern: RatingsFeedbackHaptic) -> String {
        switch pattern {
        case .starRating1: return "starRating1"
        case .starRating3: return "starRating3"
        case .starRating5: return "starRating5"
        case .socialNotification: return "socialNotification"
        }
    }
    
    private func getToolsWritingRawValue(_ pattern: ToolsWritingHaptic) -> String {
        switch pattern {
        case .pencilWrite: return "pencilWrite"
        case .eraserUse: return "eraserUse"
        }
    }
}