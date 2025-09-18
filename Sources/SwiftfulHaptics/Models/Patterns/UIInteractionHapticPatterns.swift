//
//  UIInteractionHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct UIInteractionHapticPatterns {
    
    // MARK: - Social Media Patterns
    
    static func doubleTapLike(duration: Double) -> [CHHapticEvent] {
        // First tap - instant feedback
        let firstTapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let firstTapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let firstTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [firstTapIntensity, firstTapSharpness],
            relativeTime: 0.0
        )
        
        // Second tap - confirmation
        let secondTapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let secondTapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let secondTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [secondTapIntensity, secondTapSharpness],
            relativeTime: 0.1
        )
        
        return [firstTap, secondTap]
    }
    
    static func messageSent(duration: Double) -> [CHHapticEvent] {
        // Quick swoosh start
        let swooshIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let swooshSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let swoosh = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [swooshIntensity, swooshSharpness],
            relativeTime: 0.0
        )
        
        // Quick fade out like message flying away
        let fadeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let fadeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let messageTrail = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [fadeIntensity, fadeSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [swoosh, messageTrail]
    }
    
    static func notificationPop(duration: Double) -> [CHHapticEvent] {
        // Sharp attention-grabbing pop
        let popIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let popSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let notificationPopp = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [popIntensity, popSharpness],
            relativeTime: 0.0
        )
        
        // Quick vibration tail
        let tailIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let tailSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let notificationTail = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tailIntensity, tailSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [notificationPopp, notificationTail]
    }
    
    static func typingIndicator(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Three dots appearing in sequence
        let dotCount = 3
        let dotSpacing = 0.15
        
        for i in 0..<dotCount {
            let dotTime = Double(i) * dotSpacing
            let dotIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
            let dotSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let dot = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [dotIntensity, dotSharpness],
                relativeTime: dotTime
            )
            events.append(dot)
        }
        
        // Continuous typing vibration
        let typingIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let typingSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let typingVibration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [typingIntensity, typingSharpness],
            relativeTime: dotSpacing * Double(dotCount),
            duration: duration - (dotSpacing * Double(dotCount))
        )
        events.append(typingVibration)
        
        return events
    }
    
    static func commentPosted(duration: Double) -> [CHHapticEvent] {
        // Quick post confirmation
        let postIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let postSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let postTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [postIntensity, postSharpness],
            relativeTime: 0.0
        )
        
        // Success vibration
        let successIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let successSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let successVibration = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [successIntensity, successSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [postTap, successVibration]
    }
    
    // MARK: - Core UI Interaction Patterns
    
    static func pullToRefreshEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Building tension
        let tensionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let tensionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let tension = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [tensionIntensity, tensionSharpness],
            relativeTime: 0.0,
            duration: 0.25
        )
        events.append(tension)
        
        // Release snap
        let releaseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let releaseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let release = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [releaseIntensity, releaseSharpness],
            relativeTime: 0.25
        )
        events.append(release)
        
        // Refreshing vibration
        let refreshIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let refreshSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let refreshing = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [refreshIntensity, refreshSharpness],
            relativeTime: 0.3,
            duration: duration - 0.3
        )
        events.append(refreshing)
        
        return events
    }
    
    static func pullToRefreshCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Elastic tension curve
        let tensionCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.6))
            ],
            relativeTime: 0.0
        )
        
        return [tensionCurve]
    }
    
    static func swipeActionEvents(duration: Double, actionType: String) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Initial swipe feedback
        let swipeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let swipeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let swipe = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [swipeIntensity, swipeSharpness],
            relativeTime: 0.0,
            duration: 0.2
        )
        events.append(swipe)
        
        // Action confirmation based on type
        let confirmIntensity: Float = actionType == "delete" ? 0.8 : 0.6
        let confirmSharpness: Float = actionType == "delete" ? 0.9 : 0.7
        
        let confirmationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: confirmIntensity)
        let confirmationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: confirmSharpness)
        let confirmation = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [confirmationIntensity, confirmationSharpness],
            relativeTime: 0.25
        )
        events.append(confirmation)
        
        return events
    }
    
    static func toggleSwitchEvents(duration: Double) -> [CHHapticEvent] {
        // Switch movement start
        let moveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let moveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let movement = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [moveIntensity, moveSharpness],
            relativeTime: 0.0,
            duration: 0.1
        )
        
        // State change click
        let clickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let clickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let stateClick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [clickIntensity, clickSharpness],
            relativeTime: 0.12
        )
        
        return [movement, stateClick]
    }
    
    static func pickerDetentEvents(duration: Double) -> [CHHapticEvent] {
        // Mechanical click sensation
        let clickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let clickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let detentClick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [clickIntensity, clickSharpness],
            relativeTime: 0.0
        )
        
        return [detentClick]
    }
    
    static func longPressActivationEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Building pressure
        let pressureIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let pressureSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let pressureBuild = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [pressureIntensity, pressureSharpness],
            relativeTime: 0.0,
            duration: 0.4
        )
        events.append(pressureBuild)
        
        // Activation pop
        let activationIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let activationSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let activation = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [activationIntensity, activationSharpness],
            relativeTime: 0.45
        )
        events.append(activation)
        
        // Menu appearance
        let menuIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let menuSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let menuAppear = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [menuIntensity, menuSharpness],
            relativeTime: 0.5,
            duration: duration - 0.5
        )
        events.append(menuAppear)
        
        return events
    }
    
    static func longPressActivationCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Pressure buildup curve
        let pressureCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.2)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: Float(0.4)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.8, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: Float(0.7))
            ],
            relativeTime: 0.0
        )
        
        return [pressureCurve]
    }
    
    // MARK: - Navigation & Transition Patterns
    
    static func tabSelectionEvents(duration: Double) -> [CHHapticEvent] {
        // Tab tap
        let tapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let tapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let tabTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tapIntensity, tapSharpness],
            relativeTime: 0.0
        )
        
        // Selection confirmation
        let confirmIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let confirmSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let confirmation = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [confirmIntensity, confirmSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [tabTap, confirmation]
    }
    
    static func navigationPushEvents(duration: Double) -> [CHHapticEvent] {
        // Forward push
        let pushIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let pushSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let push = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [pushIntensity, pushSharpness],
            relativeTime: 0.0
        )
        
        // Slide completion
        let slideIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let slideSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
        let slideComplete = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [slideIntensity, slideSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [push, slideComplete]
    }
    
    static func navigationPopEvents(duration: Double) -> [CHHapticEvent] {
        // Back gesture start
        let gestureIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let gestureSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let gesture = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [gestureIntensity, gestureSharpness],
            relativeTime: 0.0,
            duration: 0.08
        )
        
        // Pop confirmation
        let popIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let popSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let pop = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [popIntensity, popSharpness],
            relativeTime: 0.1
        )
        
        return [gesture, pop]
    }
    
    static func modalPresentEvents(duration: Double) -> [CHHapticEvent] {
        // Upward slide
        let slideIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let slideSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let slideUp = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [slideIntensity, slideSharpness],
            relativeTime: 0.0,
            duration: 0.15
        )
        
        // Sheet snap into place
        let snapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let snapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let snap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [snapIntensity, snapSharpness],
            relativeTime: 0.18
        )
        
        return [slideUp, snap]
    }
    
    static func modalDismissEvents(duration: Double) -> [CHHapticEvent] {
        // Downward movement
        let moveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let moveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let moveDown = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [moveIntensity, moveSharpness],
            relativeTime: 0.0,
            duration: 0.12
        )
        
        // Dismiss completion
        let dismissIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let dismissSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let dismiss = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [dismissIntensity, dismissSharpness],
            relativeTime: 0.15
        )
        
        return [moveDown, dismiss]
    }
    
    // MARK: - Input & Control Patterns
    
    static func keyboardTapEvents(duration: Double) -> [CHHapticEvent] {
        // Sharp key press
        let keyIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let keySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let keyPress = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [keyIntensity, keySharpness],
            relativeTime: 0.0
        )
        
        return [keyPress]
    }
    
    static func sliderStepEvents(duration: Double) -> [CHHapticEvent] {
        // Step tick
        let tickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let tickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let stepTick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tickIntensity, tickSharpness],
            relativeTime: 0.0
        )
        
        return [stepTick]
    }
    
    static func selectionTickEvents(duration: Double) -> [CHHapticEvent] {
        // Light selection feedback
        let selectIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let selectSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let selectionFeedback = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [selectIntensity, selectSharpness],
            relativeTime: 0.0
        )
        
        return [selectionFeedback]
    }
    
    static func segmentChangeEvents(duration: Double) -> [CHHapticEvent] {
        // Segment switch
        let switchIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let switchSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let segmentSwitch = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [switchIntensity, switchSharpness],
            relativeTime: 0.0
        )
        
        return [segmentSwitch]
    }
    
    // MARK: - Gesture & Interaction Patterns
    
    static func zoomBoundaryEvents(duration: Double) -> [CHHapticEvent] {
        // Boundary resistance
        let resistanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let resistanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let resistance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resistanceIntensity, resistanceSharpness],
            relativeTime: 0.0,
            duration: 0.2
        )
        
        // Elastic bounce back
        let bounceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let bounceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let bounce = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [bounceIntensity, bounceSharpness],
            relativeTime: 0.22
        )
        
        return [resistance, bounce]
    }
    
    static func dragAndDropEvents(duration: Double, phase: String) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        switch phase {
        case "pickup":
            // Item pickup
            let pickupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let pickupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let pickup = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pickupIntensity, pickupSharpness],
                relativeTime: 0.0
            )
            events.append(pickup)
            
        case "hover":
            // Hover feedback
            let hoverIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
            let hoverSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
            let hover = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [hoverIntensity, hoverSharpness],
                relativeTime: 0.0,
                duration: duration
            )
            events.append(hover)
            
        default: // complete
            // Pickup
            let pickupIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let pickupSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
            let pickup = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pickupIntensity, pickupSharpness],
                relativeTime: 0.0
            )
            events.append(pickup)
            
            // Drag vibration
            let dragIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
            let dragSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.4))
            let drag = CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [dragIntensity, dragSharpness],
                relativeTime: 0.1,
                duration: 0.5
            )
            events.append(drag)
            
            // Drop confirmation
            let dropIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
            let dropSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let drop = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [dropIntensity, dropSharpness],
                relativeTime: 0.65
            )
            events.append(drop)
        }
        
        return events
    }
    
    // MARK: - Form & Data Entry Patterns
    
    static func formSubmitEvents(duration: Double) -> [CHHapticEvent] {
        // Submit button press
        let submitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let submitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let submitPress = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [submitIntensity, submitSharpness],
            relativeTime: 0.0
        )
        
        // Processing vibration
        let processIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let processSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let processing = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [processIntensity, processSharpness],
            relativeTime: 0.05,
            duration: 0.25
        )
        
        // Success confirmation
        let successIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let successSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let success = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [successIntensity, successSharpness],
            relativeTime: 0.35
        )
        
        return [submitPress, processing, success]
    }
    
    static func inputErrorEvents(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Error shake pattern
        let shakeCount = 2
        for i in 0..<shakeCount {
            let shakeTime = Double(i) * 0.12
            let shakeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
            let shakeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
            let shake = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [shakeIntensity, shakeSharpness],
                relativeTime: shakeTime
            )
            events.append(shake)
        }
        
        // Error buzz
        let buzzIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let buzzSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let errorBuzz = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [buzzIntensity, buzzSharpness],
            relativeTime: 0.25,
            duration: duration - 0.25
        )
        events.append(errorBuzz)
        
        return events
    }
    
    // MARK: - System & App Feedback Patterns
    
    static func loadingCompleteEvents(duration: Double) -> [CHHapticEvent] {
        // Success tick
        let tickIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let tickSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let successTick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [tickIntensity, tickSharpness],
            relativeTime: 0.0
        )
        
        // Completion vibration
        let completeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let completeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let completion = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [completeIntensity, completeSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [successTick, completion]
    }
    
    static func appIconTapEvents(duration: Double) -> [CHHapticEvent] {
        // Springy bounce effect
        let bounceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let bounceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let bounce = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [bounceIntensity, bounceSharpness],
            relativeTime: 0.0
        )
        
        // Quick spring back
        let springIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let springSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let springBack = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [springIntensity, springSharpness],
            relativeTime: 0.08
        )
        
        return [bounce, springBack]
    }
    
    static func customPopEvents(duration: Double) -> [CHHapticEvent] {
        // Initial hit with maximum sharpness
        let hitIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let hitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let initialHit = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [hitIntensity, hitSharpness],
            relativeTime: 0.0
        )
        
        // Short sustain
        let sustainIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let sustainSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let sustain = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [sustainIntensity, sustainSharpness],
            relativeTime: 0.0,
            duration: 0.05
        )
        
        // Quick decay
        let decayIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let decaySharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let decay = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [decayIntensity, decaySharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [initialHit, sustain, decay]
    }
    
    static func customPopCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Sharp attack and quick release
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.02, value: Float(0.8)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.05, value: Float(0.6)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        let sharpnessCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.1, value: Float(0.5)),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: Float(0.0))
            ],
            relativeTime: 0.0
        )
        
        return [intensityCurve, sharpnessCurve]
    }
    
    // MARK: - Additional UI Patterns
    
    static func scrollBounce(duration: Double) -> [CHHapticEvent] {
        // Elastic resistance
        let resistanceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let resistanceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let resistance = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [resistanceIntensity, resistanceSharpness],
            relativeTime: 0.0,
            duration: 0.15
        )
        
        // Bounce back
        let bounceIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let bounceSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let bounce = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [bounceIntensity, bounceSharpness],
            relativeTime: 0.17
        )
        
        return [resistance, bounce]
    }
    
    static func pageFlip(duration: Double) -> [CHHapticEvent] {
        // Page lift
        let liftIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let liftSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let lift = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [liftIntensity, liftSharpness],
            relativeTime: 0.0,
            duration: 0.2
        )
        
        // Page land
        let landIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let landSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let land = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [landIntensity, landSharpness],
            relativeTime: 0.25
        )
        
        return [lift, land]
    }
    
    static func photoCapture(duration: Double) -> [CHHapticEvent] {
        // Shutter click
        let shutterIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let shutterSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let shutterClick = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [shutterIntensity, shutterSharpness],
            relativeTime: 0.0
        )
        
        // Photo process
        let processIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let processSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let processing = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [processIntensity, processSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [shutterClick, processing]
    }
    
    static func shareAction(duration: Double) -> [CHHapticEvent] {
        // Share sheet appear
        let appearIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let appearSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let appear = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [appearIntensity, appearSharpness],
            relativeTime: 0.0
        )
        
        // Share complete
        let completeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let completeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let complete = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [completeIntensity, completeSharpness],
            relativeTime: 0.15
        )
        
        return [appear, complete]
    }
    
    static func downloadComplete(duration: Double) -> [CHHapticEvent] {
        // Download finish
        let finishIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let finishSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let finish = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [finishIntensity, finishSharpness],
            relativeTime: 0.0
        )
        
        // Success vibration
        let successIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let successSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let success = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [successIntensity, successSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [finish, success]
    }
    
    static func refreshData(duration: Double) -> [CHHapticEvent] {
        var events: [CHHapticEvent] = []
        
        // Refresh pulses
        let pulseCount = 3
        for i in 0..<pulseCount {
            let pulseTime = Double(i) * 0.15
            let pulseIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
            let pulseSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
            let pulse = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [pulseIntensity, pulseSharpness],
                relativeTime: pulseTime
            )
            events.append(pulse)
        }
        
        // Refresh complete
        let completeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let completeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let complete = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [completeIntensity, completeSharpness],
            relativeTime: 0.5
        )
        events.append(complete)
        
        return events
    }
    
    static func gestureRecognized(duration: Double) -> [CHHapticEvent] {
        // Recognition confirmation
        let recognizeIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let recognizeSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let recognition = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [recognizeIntensity, recognizeSharpness],
            relativeTime: 0.0
        )
        
        // Action feedback
        let actionIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let actionSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.6))
        let action = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [actionIntensity, actionSharpness],
            relativeTime: 0.05,
            duration: duration - 0.05
        )
        
        return [recognition, action]
    }
    
    static func pageTurn(duration: Double) -> [CHHapticEvent] {
        // Page start movement
        let startIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let startSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let pageStart = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [startIntensity, startSharpness],
            relativeTime: 0.0,
            duration: 0.15
        )
        
        // Page settle
        let settleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4))
        let settleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let pageSettle = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [settleIntensity, settleSharpness],
            relativeTime: 0.18
        )
        
        return [pageStart, pageSettle]
    }
    
    // MARK: - Pop Pattern
    
    static func popEvents(duration: Double) -> [CHHapticEvent] {
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1.0))
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0)
        
        return [event1]
    }
    
    static func popCurves(duration: Double) -> [CHHapticParameterCurve] {
        let curve1 = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [
            CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(1.0)),
            CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(1.0)),
        ], relativeTime: 0.0)

        return [curve1]
    }
}