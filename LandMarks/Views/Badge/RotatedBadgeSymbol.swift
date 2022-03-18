//
//  RotatedBadgeSymbol.swift
//  LandMarks
//
//  Created by Михаил Медведев on 11.01.2022.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
	let angle: Angle

    var body: some View {
       BadgeSymbol()
			.padding(-60)
			.rotationEffect(self.angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
		RotatedBadgeSymbol(angle: .degrees(5))
    }
}
