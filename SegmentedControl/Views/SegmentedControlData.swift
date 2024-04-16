//
//  SegmentedControlData.swift
//  SegmentedControl
//
//  Created by Steven Santeliz on 15/4/24.
//

import Foundation

// MARK: - Color Segment Control Item

enum ColorOptions: Int, SegmentControlItem {
    case red
    case green
    case blue
    
    var id: Int { self.rawValue }
    
    var name: String? { String(describing: self).capitalized }
    
    var iconString: String? { nil }
}

// MARK: -  Shape Segment Control Item

enum ShapeOptions: Int, SegmentControlItem {
    case circle
    case square
    case triangle
    
    var id: Int { self.rawValue }
    
    var name: String? { String(describing: self).capitalized }
    
    var iconString: String? {
        switch self {
            case .circle: "o.circle.fill"
            case .square: "square.on.square.fill"
            case .triangle: "arrowtriangle.up.fill"
        }
    }
}

// MARK: - Emoji Segment Control Item

enum EmojiOptions: Int, SegmentControlItem {
    case happy
    case cool
    
    var id: Int { self.rawValue }
    
    var name: String? { nil }
    
    var iconString: String? {
        switch self {
            case .happy: "face.dashed"
            case .cool: "face.dashed.fill"
        }
    }
}
