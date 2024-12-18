//
//  Error+EXT.swift
//  SwiftfulHaptics
//
//  Created by Nicholas Sarno on 12/18/24.
//
import Foundation

extension Error {
    
    var eventParameters: [String: Any] {
        [
            "error_description": localizedDescription
        ]
    }
}
