//
//  Badge.swift
//  LandMarks
//
//  Created by Михаил Медведев on 11.01.2022.
//

import SwiftUI

struct Badge: View {
	var badgeSymbols: some View {
		ForEach(0..<8) { index in
			RotatedBadgeSymbol(angle: .degrees(Double(index) / Double(8)) * 360.0)
		}
		.opacity(0.5)
	}
    var body: some View {
		ZStack {
			BadgeBackground()
			GeometryReader { geo in
				self.badgeSymbols
					.scaleEffect( 1.0 / 4.0, anchor: .top)
					.position(x: geo.size.width / 2.0, y: (3.0 / 4.0) * geo.size.height)
			}
			.scaledToFit()
		}
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
