//
//  AuthLogger.swift
//  SwiftfulHaptics
//
//  Created by Nicholas Sarno on 12/18/24.
//
@MainActor
public protocol HapticLogger {
    func trackEvent(event: HapticLogEvent)
    func addUserProperties(dict: [String: Any], isHighPriority: Bool)
}

public protocol HapticLogEvent {
    var eventName: String { get }
    var parameters: [String: Any]? { get }
    var type: HapticLogType { get }
}

public enum HapticLogType: Int, CaseIterable, Sendable {
    case info // 0
    case analytic // 1
    case warning // 2
    case severe // 3

    var emoji: String {
        switch self {
        case .info:
            return "👋"
        case .analytic:
            return "📈"
        case .warning:
            return "⚠️"
        case .severe:
            return "🚨"
        }
    }

    var asString: String {
        switch self {
        case .info: return "info"
        case .analytic: return "analytic"
        case .warning: return "warning"
        case .severe: return "severe"
        }
    }
}
