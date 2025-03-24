//
//  Typography.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 23/3/25.
//

import SwiftUI

public enum Typography: CaseIterable {
    public static var allCases: [Typography] {
        return [
            .title1,
            .title2,
            .body,
        ]
    }
    
    case title1
    case title2
    case body
    
    public var size: CGFloat {
        switch self {
        case .title1:
            return UIFontMetrics.default.scaledValue(for: 27)
        case .title2:
            return UIFontMetrics.default.scaledValue(for: 21)
        case .body:
            return UIFontMetrics.default.scaledValue(for: 16)
        }
    }
  
    public var weightUI: Font.Weight {
        switch self {
        case .title1:
            return .light
        case .title2:
            return .light
        case .body:
            return .light
        }
    }
}


public extension Typography {
    var font: Font {
        return .system(size: size, weight: weightUI, design: .default)
    }
}
