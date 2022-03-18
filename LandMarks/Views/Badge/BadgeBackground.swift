//
//  BadgeBackground.swift
//  LandMarks
//
//  Created by Михаил Медведев on 10.01.2022.
//

import SwiftUI

struct BadgeBackground: View {
	static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
	static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

	var body: some View {
		GeometryReader { geometry in
			Path { path in
				let width = min(geometry.size.width, geometry.size.height)
				let height = width
				let movePoint = CGPoint(x: width * 0.95,
										y: height * (0.2 + HexagonParameters.adjustment))
				path.move(to: movePoint)

				HexagonParameters.segments.forEach {
					let point = CGPoint(x: width * $0.line.x, y: height * $0.line.y)
					path.addLine(to: point)

					let curvePoint = CGPoint(x: width * $0.curve.x,
											 y: height * $0.curve.y)
					let controlPoint = CGPoint(x: width * $0.control.x,
											   y: height * $0.control.y)

					path.addQuadCurve(to: curvePoint, control: controlPoint)
				}
			}
			.fill(.linearGradient(
				Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
				startPoint: UnitPoint(x: 0.5, y: 0),
				endPoint: UnitPoint(x: 0.5, y: 0.6)
			))
		}
		.aspectRatio(1, contentMode: .fit)
	}
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
