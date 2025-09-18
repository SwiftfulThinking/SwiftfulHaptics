//
//  FinanceHapticPatterns.swift
//  
//
//  Created by Nick Sarno on 9/18/25.
//

import Foundation
import CoreHaptics

struct FinanceHapticPatterns {
    
    // MARK: - Finance Patterns
    
    static func paymentSuccess(duration: Double) -> [CHHapticEvent] {
        // Confident single pulse with high sharpness
        let successIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.8))
        let successSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1.0))
        let paymentConfirm = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [successIntensity, successSharpness],
            relativeTime: 0.0
        )
        
        return [paymentConfirm]
    }
    
    static func paymentProcessingEvents(duration: Double) -> [CHHapticEvent] {
        // Subtle continuous vibration for processing state
        let processingIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.2))
        let processingSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(-0.3))
        let processing = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [processingIntensity, processingSharpness],
            relativeTime: 0.0,
            duration: duration
        )
        
        return [processing]
    }
    
    static func paymentProcessingCurves(duration: Double) -> [CHHapticParameterCurve] {
        // Gentle pulsing curve for processing indication
        let pulseCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.25, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.5, value: Float(0.1)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration * 0.75, value: Float(0.3)),
                CHHapticParameterCurve.ControlPoint(relativeTime: duration, value: Float(0.1))
            ],
            relativeTime: 0.0
        )
        
        return [pulseCurve]
    }
    
    static func transactionAlert(duration: Double) -> [CHHapticEvent] {
        // Double tap alert pattern
        let firstTapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.6))
        let firstTapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.8))
        let firstTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [firstTapIntensity, firstTapSharpness],
            relativeTime: 0.0
        )
        
        let secondTapIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.7))
        let secondTapSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
        let secondTap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [secondTapIntensity, secondTapSharpness],
            relativeTime: 0.15
        )
        
        return [firstTap, secondTap]
    }
    
    static func receiptSaved(duration: Double) -> [CHHapticEvent] {
        // Paper slide and save confirmation
        let slideIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.3))
        let slideSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let paperSlide = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [slideIntensity, slideSharpness],
            relativeTime: 0.0,
            duration: 0.15
        )
        
        let saveIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let saveSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.7))
        let saveConfirm = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [saveIntensity, saveSharpness],
            relativeTime: 0.2
        )
        
        return [paperSlide, saveConfirm]
    }
}