//
//  PencilTimberShape.swift
//  Custom Controls
//
//  Created by Eric Carroll on 5/15/23.
//

import SwiftUI

struct PencilTimberShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = Path { path in
            path.move(to: CGPoint(x: 0.330 * rect.maxX * 0.5, y: 0.106 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.670 * rect.maxX * 0.5, y: 0.106 * rect.maxY),
                          control1: CGPoint(x: 0.420 * rect.maxX * 0.5, y: 0.120 * rect.maxY),
                          control2: CGPoint(x: 0.580 * rect.maxX * 0.5, y: 0.120 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.980 * rect.maxX * 0.5, y: 0.270 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.020 * rect.maxX * 0.5, y: 0.270 * rect.maxY),
                          control1: CGPoint(x: 0.700 * rect.maxX * 0.5, y: 0.320 * rect.maxY),
                          control2: CGPoint(x: 0.300 * rect.maxX * 0.5, y: 0.320 * rect.maxY))
            path.closeSubpath()
        }
        return path
    }
}
