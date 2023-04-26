//
//  Point.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import Foundation

enum Point {
    case topLeading
    case leading
    case bottomLeading
    case top
    case center
    case bottom
    case topTrailing
    case trailing
    case bottomTrailing
    
    var point: CGPoint {
        switch self {
        case .topLeading:
            return CGPoint(x: 0.0, y: 0.0)
        case .leading:
            return CGPoint(x: 0.0, y: 0.5)
        case .bottomLeading:
            return CGPoint(x: 0.0, y: 1.0)
        case .top:
            return CGPoint(x: 0.5, y: 0.0)
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .bottom:
            return CGPoint(x: 0.5, y: 1.0)
        case .topTrailing:
            return CGPoint(x: 1.0, y: 0.0)
        case .trailing:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottomTrailing:
            return CGPoint(x: 1.0, y: 1.0)
        }
    }
}
